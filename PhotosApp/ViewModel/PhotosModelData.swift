//
//  PhotosDataService.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import SwiftUI
import Combine
import  RealmSwift

class PhotosModelData: ObservableObject {
    @Published var allPhotos: [Photo] = []
    @Published var allFavPhotos: [Photo] = []
    
    var photosSubscription: AnyCancellable?
    private let realm = try! Realm()
    let realmItem = PhotosDB()
    
    init() {
        getPhotos()
    }
    
    private func getPhotos() {
        guard let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=4229581a465a3a6b913eef2344e18abe&user_id=65789667%40N06&extras=url_m%2Cowner_name&format=json&nojsoncallback=1") else {
            return
        }
        
        photosSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: SessionResponse.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedPhotosData) in
                self?.allPhotos = returnedPhotosData.photos.photo
                
                let item = self?.realm.objects(PhotosDB.self)
                if let eachPhoto = self?.allPhotos {
                    for photo in eachPhoto {
                        if let _ = item?.first(where: { photoDB in
                            photoDB.id == photo.id
                        }) {
                            self?.allFavPhotos.append(photo)
                        }
                    }
                }
                self?.photosSubscription?.cancel()
            }
    }
}
