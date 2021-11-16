//
//  PhotosAppApp.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import SwiftUI

@main
struct PhotosAppApp: App {
    @StateObject var photosModelData = PhotosModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(photosModelData)
        }
    }
}
