//
//  tweetCellTableViewCell.swift
//  Twitter
//
//  Created by Divyansh Singh on 29/09/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class tweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    var favourited:Bool = false
    var tweetId:Int = -1
   
    @IBAction func favTweet(_ sender: Any) {
        let toBeFavorited = !favourited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavourite(true)
            }, failure: { (error) in
                print("Favorite Did Not Succedd")
            })
        }
        else
        {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavourite(false)
            }, failure: { (error) in
                print("UNFavorite Did Not Succedd")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error in retweeting")
        })
        
    }
    
    func setRetweeted(_ isRetweeted:Bool)
    {
        if(isRetweeted)
        {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else
        {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    func setFavourite(_ isFavourited:Bool) {
        favourited = isFavourited
        if (favourited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else
        {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
