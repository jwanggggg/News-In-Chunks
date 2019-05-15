//
//  ArticlesTableViewController.swift
//  News In Chunks
//
//  Created by Eui Joon Kim on 5/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllArticles.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        let article = AllArticles.articles[indexPath.row]
        cell.thumbnailImageView.downloadImage(from: AllArticles.articles[indexPath.item].thumbnailFileName)
        cell.article = article
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UIStoryboardSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the index path from the cell that was tapped
        let indexPath = tableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        let index = indexPath?.row

        // Set ArticleViewController's article to the one that was tapped
        let articleVC: ArticleViewController! = segue.destination as? ArticleViewController
        articleVC.article = AllArticles.articles[index!]
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        // set gradient background
        tableView.backgroundView = UIImageView(image: UIImage(named: "ViewControllerBackground.png"))
        fetchArticles()
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        
        tableView.refreshControl = refreshControl
    }
    
    func fetchArticles(){
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9d9eeff96c6f4f4989f1e892f700857a")!)
        
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            AllArticles.articles = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        var article = Article(articleName: "", articleDescription: "", thumbnailFileName: "", articleText: "", bookmarked: false)
                        if let articleName = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let articleDescription = articleFromJson["description"] as? String, let thumbnailFileName = articleFromJson["urlToImage"] as? String,
                            let articleText = articleFromJson["content"] as? String{
                            
                            article.articleName = articleName
                            article.articleDescription = articleDescription
                            article.thumbnailFileName = thumbnailFileName
                            article.articleText = articleText
                        }
                        AllArticles.articles.append(article)
                        print(article)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error)
            }
            
            
        }
        
        task.resume()
        
    }
    
}

extension UIImageView {
    
    func downloadImage(from url: String) {
        print("URL: " + url)
        
        if url.count == 0 {
            return
        }
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if (error != nil) {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
        }
        task.resume()
    }
    
}
