//
//  ArticleTableViewCell.swift
//  News In Chunks
//
//  Created by Eui Joon Kim on 5/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var bookmarked: UIImageView!
    
    var article: Article! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        thumbnailImageView.image = UIImage(named: article.thumbnailFileName)
        thumbnailImageView.layer.cornerRadius = 14.0
        thumbnailImageView.layer.masksToBounds = true
        thumbnailImageView.layer.zPosition = 1
        
        articleTitle.text = article.articleName
        articleTitle.adjustsFontSizeToFitWidth = true

        articleDescription.text = article.articleDescription
        
        if article.bookmarked {
            bookmarked.isHighlighted = true
        } else {
            bookmarked.isHighlighted = false
        }
    }
}
