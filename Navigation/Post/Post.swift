//
//  Post.swift
//  Navigation
//
//  Created by Ален Авако on 11.09.2021.
//

import UIKit

struct Post {
    var title: String
}

    struct NewPost {
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    }

struct Storage {
    static let tableModel = [
        NewPost(author: "Natasha Romanoff", description: "with friends", image: "post1", likes: 333, views: 333),
        NewPost(author: "Tony Stark", description: "brand new suit", image: "post2", likes: 123, views: 123),
        NewPost(author: "Clint Barton", description: "Me)", image: "post3", likes: 234, views: 356),
        NewPost(author: "Piter Parker", description: "Venice", image: "post4", likes: 435, views: 464)
    ]
}
