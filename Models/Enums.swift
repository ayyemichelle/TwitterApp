//
//  Enums.swift
//  Twitter
//
//  Created by Michelle Vasquez-Aleman on 2/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import Foundation

enum TwitterAPIUrl : String {
    case oauthURL = "https://api.twitter.com/oauth/request_token"
    case homeTimelineURL = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    case postTweetURL = "https://api.twitter.com/1.1/statuses/update.json"
    case favoriteTweetURL = "https://api.twitter.com/1.1/favorites/create.json"
    case unfavoriteTweetURL = "https://api.twitter.com/1.1/favorites/destroy.json"
    case retweetURL = "https://api.twitter.com/1.1/statuses/retweet/:id.json"
    case unretweetURL = "https://api.twitter.com/1.1/statuses/unretweet/:id.json"
}
