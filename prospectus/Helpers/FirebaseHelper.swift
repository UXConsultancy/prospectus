//
//  FirebaseHelper.swift
//  prospectus
//
//  Created by Craig Chambers on 20/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation
import Firebase

enum MyError: Error {
    case encodingError
}

class FBHelper {
    
    private init() {}
    
    static let shared = FBHelper()
    
    func configure() {
        FirebaseApp.configure()
    }
    
    private func reference(to collectionReference: FBCollectionReference) -> CollectionReference {
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    func create<T: Encodable>(for encodeableObject: T, in collectionReference: FBCollectionReference){
        do {
            let json = try encodeableObject.toJson(excluding: ["id"])
            reference(to: collectionReference).addDocument(data: json)
        } catch {
            print(error)
        }
    }
    
    func read<T: Decodable>(from collectionReference: FBCollectionReference, returning objectType: T.Type, completion: @escaping ([T]) -> Void)  {
        reference(to: collectionReference).addSnapshotListener { (snapshot, error) in
            
            guard let articles = snapshot else { return }
            do {
                var objects = [T]()
                for article in articles.documents {
                    let object = try article.decode(as: objectType.self)
                    var test = objects.count
                    if objects.count < 0 {
                        test = 1
                    }
                        objects.insert(object, at: test)
                }
                completion(objects)
            } catch {
                print(error)
            }
        }
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
}

extension Encodable {
    
    func toJson(excluding keys: [String] = [String]()) throws -> [String: Any] {
        
        let objectData = try JSONEncoder().encode(self)
        // jsonObject comes back as any, make this more robust!
        let jsonObject = try JSONSerialization.jsonObject(with: objectData, options: [])
        guard var json = jsonObject as? [String: Any] else { throw MyError.encodingError}
        
        for key in keys {
            json[key] = nil
        }
        return json
    }
}

extension DocumentSnapshot {
    func decode<T: Decodable>(as objectType: T.Type, includingId: Bool = true) throws -> T {
        var documentJson = data()
        if includingId {
            documentJson!["id"] = documentID
        }
        
        let documentData = try JSONSerialization.data(withJSONObject: documentJson!, options: [])
        let decodedObject = try JSONDecoder().decode(objectType, from: documentData)
        
        return decodedObject
    }
}
