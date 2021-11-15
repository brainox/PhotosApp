//
//  RealmManager.swift
//  PhotosApp
//
//  Created by Decagon on 15/11/2021.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    
    private init() {}
    
    static let Shared = RealmManager()
    
    func create<T: Object>(_ object: T) {
        objectWillChange.send()
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
        } catch let error {
            
            print(error.localizedDescription)
            
        }
    }
    
    func delete<T: Object>(_ object: T) {
        objectWillChange.send()
        
        do {
            
            let realm = try Realm()
            try realm.write {
                realm.delete(object)
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
