//
//  Home.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import SwiftUI
import RealmSwift

struct Home: View {
    @ObservedObject var photosData = PhotosDataService()
    @State var isSet: Bool = false

    
    @ObservedObject var photosViewModel = PhotosViewModel()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0) {
                ForEach(photosData.allPhotos, id:\.id) { photoData in
                    
//                    PhotoView(imageUrlString: photoData.urlM, title: photoData.ownername, subtitle: photoData.title, screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.width*0.64)
                    PhotoView(isSet: $isSet, imageUrlString: photoData.urlM, title: photoData.ownername, subtitle: photoData.title, screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.width*0.64)
                }
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        
    }
}
