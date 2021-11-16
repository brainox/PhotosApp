//
//  PhotosViewModel.swift
//  PhotosApp
//
//  Created by Decagon on 15/11/2021.
//

import SwiftUI
import RealmSwift

class PhotosViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var ownerName: String = ""
    @Published var imageString: String = ""
    @Published var isFavorite: Bool = false
    
    init() {}
    
    init(title: String, ownerName: String, imageString: String, isFavorite: Bool) {
        self.title = title
        self.ownerName = ownerName
        self.imageString = imageString
        self.isFavorite = isFavorite
    }
}
