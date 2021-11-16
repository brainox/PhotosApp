//
//  PhotoView.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import SwiftUI
import SDWebImageSwiftUI
import RealmSwift

struct PhotoView: View {
    
    private let realm = try! Realm()
    let realmItem = PhotosDB()
    @State var screen = "Home"
    let favouriteDataModel = FavouriteModelData()
    @EnvironmentObject var photosDataModel: PhotosModelData
    var photo: Photo
    
    @State var isSet = false {
        didSet {
            
            if(screen == "Home") {
                if isSet {
                    
                    realm.beginWrite()
                    realmItem.id = photo.id
                    
                    realmItem.imageString = photo.urlM
                    realmItem.ownerName = photo.ownername
                    realmItem.title = photo.title
                    realm.add(realmItem)
                    try! realm.commitWrite()
                    photosDataModel.allFavPhotos.append(photo)
                    
                    favouriteDataModel.readFromRealm()
                    
                } else {
                    // remove from realm
                    
                    
                    let item = realm.objects(PhotosDB.self)
                    if let itemToDelete = item.first { thephoto in
                        thephoto.id == photo.id
                    } {
                        if let indexPos = photosDataModel.allFavPhotos.firstIndex(of: photo) {
                            photosDataModel.allFavPhotos.remove(at: indexPos)
                            favouriteDataModel.delete(photoToDelete: itemToDelete)
                        }
                    }
                    print("Not saved to realm")
                }
            } else {
                
                
                let item = realm.objects(PhotosDB.self)
                if let itemToDelete = item.first { thephoto in
                    thephoto.id == photo.id
                } {
                    if let indexPos = photosDataModel.allFavPhotos.firstIndex(of: photo) {
                        photosDataModel.allFavPhotos.remove(at: indexPos)
                        favouriteDataModel.delete(photoToDelete: itemToDelete)
                    }
                }
            }
        }
    }
    
    var body: some View {
        
        Button(action: {
            self.isSet.toggle()
        }, label: {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottomLeading) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .fill(Color(.gray))
                            .aspectRatio(4/3, contentMode: .fit)
                        WebImage(url: URL(string: photo.urlM))
                            .resizable()
                            .placeholder(Image(systemName: "photo"))
                            .indicator(.activity)
                            .aspectRatio(contentMode: .fill)
                            .layoutPriority(-1)
                    }
                    .clipped()
                    VStack(alignment: .leading) {
                        Text(photo.ownername)
                            .font(.title)
                        Text(photo.title)
                            .font(.subheadline)
                    }
                    .foregroundColor(.white)
                    .offset(x: 10.0, y: -10.0)
                }
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: isSet ? "star.circle" : "star.circle.fill")
                        .accentColor(.primary)
                        .font(.title)
                })
                .offset(x: -10.0, y: 10.0)
            }
        })
    }
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
////        PhotoView(imageUrlString: "snow6", title: "Villa", subtitle: "Vegilis Peectorie", screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.width*0.64, favoritingButtonToggle: {})
//        PhotoView(isSet: .constant(true), imageUrlString: "snow6", title: "Villa", subtitle: "Vegilis Peectorie", screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.width*0.64)
//    }
//}
