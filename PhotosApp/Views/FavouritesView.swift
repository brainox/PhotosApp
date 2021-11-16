//
//  FavouritesView.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import SwiftUI
import RealmSwift

struct FavouritesView: View {
    
    @EnvironmentObject var photosDataModel: PhotosModelData
    
    let item = try! Realm().objects(PhotosDB.self)
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0) {
                ForEach(item, id:\.id) { favData in 
                    if let foundPhoto = photosDataModel.allPhotos.first { thePhoto in
                        thePhoto.id == favData.id
                    } {
                        PhotoView(screen: "Fav", photo: foundPhoto)
                    }
                }
            }
        }
    }
}

//struct FavouritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritesView()
//            .environmentObject(PhotosModelData())
//    }
//}
