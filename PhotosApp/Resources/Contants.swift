//
//  Contants.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import Foundation

struct Constants {
    typealias ApiMethod = (@escaping (Result<[Photo], Error>)->Void)->Void
    
    static let noLikedPetsLabel = "You have not liked any cats yet\nLike a cat and they will appear on this screen"
    
    struct UrlConstants {
        static let baseUrl = "https://www.flickr.com/"
        static let apiKey = "4229581a465a3a6b913eef2344e18abe"
        
    }
}


