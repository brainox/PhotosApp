//
//  PhotoView.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoView: View {
    
    @Binding var isSet: Bool
    var imageUrlString: String
    var title: String
    var subtitle: String
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottomLeading) {
                ZStack(alignment: .center) {
                    Rectangle()
                        .fill(Color(.gray))
                        .aspectRatio(4/3, contentMode: .fit)
                    
//                    Image(imageUrlString)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .layoutPriority(-1)
                                WebImage(url: URL(string: imageUrlString))
                                    .resizable()
                                    .placeholder(Image(systemName: "photo"))
                                    .indicator(.activity)
                                    .aspectRatio(contentMode: .fill)
                                    .layoutPriority(-1)
                }
                .clipped()
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                    Text(subtitle)
                        .font(.subheadline)
                }
                .foregroundColor(.white)
                .offset(x: 10.0, y: -10.0)
            }
            Button(action: {isSet.toggle()}, label: {
                Image(systemName: isSet ? "star.circle" : "star.circle.fill")
                    .accentColor(.primary)
                    .font(.title)
            })
            .offset(x: -10.0, y: 10.0)
        }
        // magic
        
        //        ZStack {
        //
        //            VStack {
        //                HStack {
        //                    Spacer()
        //                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
        //                        Image(systemName: "star.circle.fill")
        //                            .accentColor(.primary)
        //                            .font(.title)
        //                    })
        //
        //                }.padding()
        //                Spacer()
        //                HStack {
        //                    VStack(alignment: .leading) {
        //                        Text(title)
        //                            .font(.title)
        //                            .foregroundColor(.primary)
        //                        Text(subtitle)
        //                            .font(.subheadline)
        //                            .foregroundColor(.primary)
        //                    }
        //                    .padding()
        //                    Spacer()
        //                }
        //            }
        //            .background(
        ////                Image(photoImage)
        ////                    .resizable()
        ////                    .scaledToFill()
        ////                    .frame(width: screenWidth, height: screenHeight)
        //
        //                WebImage(url: URL(string: imageUrlString))
        //                    .resizable()
        //                    .placeholder(Image(systemName: "photo"))
        //                    .indicator(.activity)
        //                    .transition(.fade(duration: 0.5))
        //                    .scaledToFit()
        //                    .frame(width: screenWidth, height: screenHeight)
        //
        //
        //            )
        //            .frame(width: screenWidth, height: screenHeight, alignment: .center)
        //
        //
        //
        //        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
//        PhotoView(imageUrlString: "snow6", title: "Villa", subtitle: "Vegilis Peectorie", screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.width*0.64, favoritingButtonToggle: {})
        PhotoView(isSet: .constant(true), imageUrlString: "snow6", title: "Villa", subtitle: "Vegilis Peectorie", screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.width*0.64)
    }
}
