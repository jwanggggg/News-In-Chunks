//
//  ArticleViewController.swift
//  News In Chunks
//
//  Created by Eui Joon Kim on 5/5/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleDetail: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var article: Article!
    
    override func viewDidLoad() {
        // set gradient background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ViewControllerBackground.png")!)
        
        // set article image
        thumbnailImageView.image = UIImage(named: article.thumbnailFileName)
        thumbnailImageView.layer.cornerRadius = 14.0
        thumbnailImageView.layer.masksToBounds = true
        thumbnailImageView.layer.zPosition = 1
        
        // set article title label
        articleTitle.text = article.articleName
        articleTitle.adjustsFontSizeToFitWidth = true
        
        // set article description label
        articleDescription.text = article.articleDescription
        articleDescription.adjustsFontSizeToFitWidth = true
        
        // set article text label
        articleDetail.numberOfLines = 0
        articleDetail.text = article.articleText
    }
}
