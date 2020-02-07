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
    
}
