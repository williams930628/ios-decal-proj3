//
//  PhotoViewController.swift
//  Photos
//
//  Created by Kyle Boss on 11/15/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var uploader: UILabel!
    @IBOutlet weak var numLikes: UILabel!
    @IBOutlet weak var numDislikes: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var disLikeImg: UIImageView!
    var photo:Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploader.text   = photo!.username
        numLikes.text   = String(photo!.likes)
        numDislikes.text = String(photo!.dislikes)
        
        let url         = NSURL(string: photo!.url)
        disLikeImg.image = UIImage(named: "Dislike.png")
        
        if let data     = NSData(contentsOfURL: url!) {
            image.image = UIImage(data: data)
        }
        if (photo!.isLiked) {
            likeImg.image = UIImage(named: "Liked.png")
            print("Img liked")
        } else {
            likeImg.image = UIImage(named: "heartGrey.png")
            print("Img not liked yet")
        }
        
        let singleTap                   = UITapGestureRecognizer(target: self, action:Selector("tapDetected"))
        likeImg.userInteractionEnabled  = true
        likeImg.addGestureRecognizer(singleTap)
        
        let secondTap                   = UITapGestureRecognizer(target: self, action:Selector("tapDislikeDetected"))
        disLikeImg.userInteractionEnabled  = true
        disLikeImg.addGestureRecognizer(secondTap)
    }
    
    func tapDetected() {
        print(photo!.isLiked)
        
        if (photo!.isLiked) {
            likeImg.image = UIImage(named: "heartGrey.png")
            numLikes.text = String(photo!.likes)
            photo!.isLiked = false
        } else {
            likeImg.image = UIImage(named: "Liked.png")
            numLikes.text = String(photo!.likes+1)
            photo!.isLiked = true
        }
        
    }
    func tapDislikeDetected(){
        if (photo!.disLiked) {
            disLikeImg.image = UIImage(named: "Dislike.png")
            numDislikes.text = String(photo!.dislikes)
            photo!.disLiked = false
        }else{
            disLikeImg.image = UIImage(named: "Dislike.png")
            numDislikes.text = String(photo!.dislikes+1)
            photo!.disLiked = true
        }

    }
}