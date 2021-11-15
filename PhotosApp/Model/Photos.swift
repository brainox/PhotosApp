//
//  Model.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import Foundation

let apiKey = "4229581a465a3a6b913eef2344e18abe"

//struct PhotosDataModel: Identifiable, Decodable {
//    var id: String
//    var title: String
//    var ownername: String
//}

struct SessionResponse: Codable {
    let photos: Photos
}

// MARK: - Photos
struct Photos: Codable {
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable, Identifiable {
    let id: String
    let title: String
    let ownername: String
    let urlM: String
    var isFavorite: Bool?

    enum CodingKeys: String, CodingKey {
        case id, title, ownername
        case urlM = "url_m"
    }
}





