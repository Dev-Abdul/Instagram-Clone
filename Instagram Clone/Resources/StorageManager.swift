//
//  StorageManager.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 21/03/22.
//

import FirebaseStorage
import Foundation
import CoreMedia

public class StorageManager {
    static let shared = StorageManager()
    private var ref = Storage.storage().reference()
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    // Mark:  - public
   
    public func uploadUserPhotoPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void) {
        ref.child(reference).downloadURL (completion:  { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        })
    }
}
