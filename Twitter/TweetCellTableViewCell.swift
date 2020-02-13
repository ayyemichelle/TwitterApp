//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Michelle Vasquez-Aleman on 2/5/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited = false
    var tweetId : Int = -1 
    
    func setFavorited(isFavorited: Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    // actions
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            // call api
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                // change button color
                self.setFavorited(isFavorited: true)
            }, failure: { (Error) in
                print("Favorite did not succeed")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                // change button color
                self.setFavorited(isFavorited: false)
            }, failure: { (Error) in
                print("Unfavorite did not succeed")
            })
        }
        
    }
    @IBAction func retweet(_ sender: Any) {
        
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
