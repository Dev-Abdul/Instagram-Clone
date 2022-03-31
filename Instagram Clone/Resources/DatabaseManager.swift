//
//  DatabaseManager.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 21/03/22.
//
import FirebaseDatabase
import Foundation

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let ref = Database.database().reference()
    // Mark:  - public
    
    
    /// Check if username and email is avalianle
    /// - parameters
    ///     - email: String representing email
    ///     - username: String representing username
    
    public func canCreateNuewUser(with email: String ,username : String ,completion: (Bool) -> Void ) {
        completion(true)
    }

    /// Incerts new data to database
    /// - parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - complition:  Async callback for result if database entery succeded

    public func incertNewuser(with email:String, username:String, completion: @escaping (Bool) -> Void ) {
        let key = email.safeDatabaseKey()
        print(key)
        ref.child(key).setValue(["username": username]) {  error, _ in
            if error == nil {
                //succeeded
                completion(true)
                return
            } else {
                //failed
                completion(false)
                return
            }
        }
    }
}
