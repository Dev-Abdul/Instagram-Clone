//
//  AuthManager.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 21/03/22.
//

import FirebaseAuth
public class AuthManager {
    static let shared = AuthManager()
    // Mark:  - public
    public func registerNewUser(username: String, email: String, password: String, completion :@escaping (Bool) -> Void) {
        /*
         - check if user name is avaliabvle
         - check if email is avaliavle
         */
        
        DatabaseManager.shared.canCreateNuewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                 - create an account
                 - Incert an account to databbase
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard result != nil, error == nil else {
                        // Fire base auth could't create account
                        completion(false)
                        return
                    }
                    // Incert into Database
                    DatabaseManager.shared.incertNewuser(with: email, username: username) { incerted in
                        if incerted{
                            // incerted data to database
                            completion(true)
                            return
                        } else {
                            // failed to incert to database
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                //either username or email dose not match
                completion(false)
            }
        }
    }
                                                 
    public func loginUser(username: String?, email: String?, password: String, completion :@escaping (Bool) -> Void) {
        if let email = email {
            // email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            // username Login
            print(username)
            
        }
    }
    
    ///
    public func logOut(completion : (Bool) -> Void ) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }catch {
            print("Failed to sign out")
            completion(false)
            return
        }
    }
}
