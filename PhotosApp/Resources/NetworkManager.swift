//
//  NetworkManager.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import Foundation

//
//final class NetworkManager {
//
//    static let shared   = NetworkManager()
//
//    private init () { }
//
//    private let path    = "v1/breeds"
//    //MARK: Pass in URL and get a decoded Data
//    public func getCatsData(completion: @escaping ((Result<[CatsDataModel], Error>)->Void)) {
//        guard let urlrequest = URL(string: Constants.UrlConstants.baseUrl+path) else { return }
//        URLSession.shared.decodeData(from: urlrequest, type: [CatsDataModel].self) { result in
//            switch result {
//            case .success(let data):
//                completion(.success(data))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//
//    }
//}

//final class NetworkManager {
//    
//    static let shared = NetworkManager()
//    
//    private init () {}
//    
//    private let path = "services/rest/?method=flickr.people.getPublicPhotos&api_key=\(Constants.UrlConstants.apiKey)&user_id=65789667%40N06&extras=url_m%2Cowner_name&format=json&nojsoncallback=1"
//    //MARK: Pass in URL and get a decoded Data
//    public func getPhotosData(completion: @escaping ((Result<[Photo], Error>) -> Void)) {
//        guard let urlrequest = URL(string: Constants.UrlConstants.baseUrl+path) else { return}
//        URLSession.shared.decodeData(from: urlrequest, type: [Photo].self) { result in
//            switch result {
//            case .success(let data):
//                completion(.success(data))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//    
//    
//    
//}


//"https://www.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=4229581a465a3a6b913eef2344e18abe&user_id=65789667%40N06&extras=url_m%2Cowner_name&format=json&nojsoncallback=1"
