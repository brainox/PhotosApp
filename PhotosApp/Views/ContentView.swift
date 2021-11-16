//
//  ContentView.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                Home()
                    .tabItem {
                        Image(systemName: "photo")
                        Text("Photo")
                    }
                    .tag(0)
               FavouritesView()
                .tabItem {
                    Image(systemName: "star.circle.fill")
                    Text("Favourites")
                }
                    .tag(1)
            }
            .navigationTitle(selectedTab == 0 ? "Photos" : "Favourites")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PhotosModelData())
    }
}
