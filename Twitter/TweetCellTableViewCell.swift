//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by cs_apple_11 on 10/31/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var TweetContent: UILabel!
    
    
    @IBOutlet weak var RetweetButton: UIButton!
    
    @IBOutlet weak var FavButton: UIButton!
    var favorited:Bool = false
    var tweetId:Int = -1
   
    
    @IBAction func FavoriteButton(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
                
            })
        
    } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
                }, failure: { (error) in
                    print("Unfavorite did not succeed: \(error)")
                    
            })
        }
    }
    
    
    @IBAction func Retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success:{
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })
    
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        if (isRetweeted) {
            RetweetButton.setImage(UIImage(named: "retweet-icon-green"), for:
                UIControl.State.normal)
            RetweetButton.isEnabled = false
        } else {
            RetweetButton.setImage(UIImage(named: "retweet-icon"), for:
                UIControl.State.normal)
            RetweetButton.isEnabled = true        }
    
    }
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            FavButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            FavButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
