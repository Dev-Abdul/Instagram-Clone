//
//  Models.swift
//  Instagram Clone
//
//  Created by PATHAN'S MAC on 31/03/22.
//

import Foundation

enum Gender {
    case Male, Female, other
}
struct User {
    let userName: String
    let name: (first: String, last : String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}
struct UserCount {
    let follower: Int
    let following: Int
    let posts: Int
}
public enum UserPostType {
    case photo,video
}
/// Represent a User Post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage : URL
    let postURL : URL //either Video url or fill resolurion photo
    let caption : String?
    let like : [postLike]
    let coments: [postComments]
    let createdDate: Date
    let taggedUsers: [userObjects]
}
struct userObjects {
    
}
struct postLike {
    let userName: String
    let postIdentifier: String
}
struct commentLike {
    let userName: String
    let commentIdentifier: String
}
struct postComments {
    let identifier: String
    let userName: String
    let Text: String
    let comentedDate: Date
    let like: [commentLike]
}
