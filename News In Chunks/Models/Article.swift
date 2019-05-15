//
//  Article.swift
//  News In Chunks
//
//  Created by Eui Joon Kim on 5/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import Foundation

struct Article {
    var articleName: String
    var articleDescription: String
    var thumbnailFileName: String
    var articleText: String
    var bookmarked: Bool
    
    static func fetchBookmarked() -> [Article] {
        let a1 = Article(articleName: "Apple's WWDC keynote is set for June 3rd", articleDescription: "The annual developer conference again takes place at San Jose's McEnery Convention Center.", thumbnailFileName: "a1", articleText: "Apple has set the dates for this year's Worldwide Developers Conference. It takes place June 3rd to 7th at San Jose's McEnery Convention Center, the same venue as the last couple of years. At WWDC, Apple typically gives developers (and everyone else) an early look at upcoming versions of iOS, macOS, watchOS and tvOS. We might also learn a little more about Apple's services (it's likely to announce streaming video and news subscription plans this month) or even get a glimpse at new hardware. \n\n If you are interested in attending, you have until March 20th to register for the chance to buy tickets. Otherwise, you'll be able to watch live streams of the keynote (which takes place June 3rd) and conference through the WWDC app or the Apple Developer website.", bookmarked: true)
        
        return [a1]
    }
}
