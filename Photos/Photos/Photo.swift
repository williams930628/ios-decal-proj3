//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    /* Whether the photo is liked or not */
    var isLiked:Bool
    /* The number of dislikes the photo has. */
    var dislikes: Int!
    /* Whether the photo is Disliked or not*/
    var disLiked:Bool

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'

        self.likes = (data.valueForKey("likes") as! NSDictionary).valueForKey("count") as! Int!
        self.dislikes = 0
        let image = (data.valueForKey("images") as! NSDictionary!).valueForKey("standard_resolution") as! NSDictionary
        self.url = image.valueForKey("url") as! String!
        self.username = (data.valueForKey("user") as! NSDictionary).valueForKey("username") as! String!
        self.isLiked = false
        self.disLiked = false
    }

}
