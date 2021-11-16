//
//  FavouriteModelData.swift
//  PhotosApp
//
//  Created by Decagon on 15/11/2021.
//

import Foundation
import RealmSwift 

class FavouriteModelData: ObservableObject {
    
    static let shared = FavouriteModelData()
    
    @Published var favouriteData: [Photo] = []

    var realmItems = try! Realm().objects(PhotosDB.self)
    
    func addToFavorites(photoToFav: PhotosDB) {
        let photoDatabase = PhotosDB()
        photoDatabase.id = photoToFav.id
        photoDatabase.ownerName = photoToFav.ownerName
        photoDatabase.imageString = photoToFav.imageString
        photoDatabase.isFavourite = photoToFav.isFavourite

        RealmManager.Shared.create(photoToFav)
        
        favouriteData.append(Photo(id: "\(photoToFav.id)", title: photoToFav.title, ownername: photoToFav.ownerName, urlM: photoToFav.imageString))
        print("After adding to the database \(favouriteData)")
    }
    
    func delete(photoToDelete: PhotosDB){
        RealmManager.Shared.delete(photoToDelete)
        print("After Deleting to the database \(favouriteData)")
    }
    
    func populateFavoritesDataArray() {
        for realmItem in realmItems {
            favouriteData.append(Photo(id: "\(realmItem.id)", title: realmItem.title, ownername: realmItem.ownerName, urlM: realmItem.imageString))
        }
    }
    func readFromRealm() {
        var photosData = try! Realm().objects(PhotosDB.self)
          .sorted(byKeyPath: "title", ascending: true)
        print(photosData)
    }
}
