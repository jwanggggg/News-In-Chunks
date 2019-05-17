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
    @IBOutlet weak var bookmarkSymbol: UIButton!
    
    @IBAction func bookmark(_ sender: UIButton) {
        if (!MyNewsFeed.articles.contains(article)) {
//            article.bookmarked = true
            MyNewsFeed.articles.append(article)
            bookmarkSymbol.isSelected = true
        } else {
            let index = MyNewsFeed.articles.firstIndex(of: article)!
            MyNewsFeed.articles.remove(at: index)
//            article.bookmarked = false
            bookmarkSymbol.isSelected = false
        }
    }
    
    @IBAction func unBookmark(_ sender: UIButton) {
//        if let index = MyNewsFeed.articles.firstIndex(where: {$0.articleName == article.articleName}) {
//            MyNewsFeed.articles.remove(at: index)
////            DispatchQueue.main.async { self.tableView.reloadData() }
//        }
    }
    
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
    }
}
