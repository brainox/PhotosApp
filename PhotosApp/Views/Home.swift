//
//  Home.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import SwiftUI
import RealmSwift

struct Home: View {
    @EnvironmentObject var photosDataModel: PhotosModelData
    @State var isSet: Bool = false
    @ObservedObject var photosViewModel = PhotosViewModel()
    @State var selectedPhoto: Photo? = nil
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0) {
                ForEach(photosDataModel.allPhotos, id:\.id) { photoData in
                    
                    //                    PhotoView(isSet: $isSet, id: photoData.id, imageUrlString: photoData.urlM, title: photoData.ownername, subtitle: photoData.title, screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.width*0.64)
                    PhotoView( screen: "Home", photo: photoData)
                       
                }
            }
        }
    }
    
    //    func saveFavorite() {
    //        if photosDataModel.allPhotos.first(where: )
    //    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(PhotosModelData())
        
    }
}
