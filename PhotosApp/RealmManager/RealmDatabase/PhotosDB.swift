//
//  PhotosViewModel.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import Foundation
import RealmSwift

class PhotosDB: Object {
    @Persisted var id = UUID()
    
    @Persisted var isFavourite = false
    @Persisted var ownerName = ""
    @Persisted var title = ""
    @Persisted var imageString = ""
    
    override static func primaryKey() -> String? {
        "id"
    }
}
