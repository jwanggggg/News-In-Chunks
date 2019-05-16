//
//  Article.swift
//  News In Chunks
//
//  Created by Eui Joon Kim on 5/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import Foundation

struct Article: Equatable {
    
    var articleName: String
    var articleDescription: String
    var thumbnailFileName: String
    var articleText: String
    var bookmarked: Bool
    
    static func ==(lhs: Article, rhs: Article) -> Bool {
        return lhs.articleName == rhs.articleName && lhs.articleDescription == lhs.articleDescription
    }
    
}
