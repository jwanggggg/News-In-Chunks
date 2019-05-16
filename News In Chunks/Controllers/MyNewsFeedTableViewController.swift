//
//  MyNewsFeedTableViewController.swift
//  News In Chunks
//
//  Created by Eui Joon Kim on 5/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import UIKit

class MyNewsFeedTableViewController: UITableViewController {
    // The second array represents another set of articles
    // TODO: create a func that passes an article from one ViewController's array to the other
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyNewsFeed.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        let article = MyNewsFeed.articles[indexPath.row]
        
        cell.article = article
        cell.thumbnailImageView.downloadImage(from: (MyNewsFeed.articles[indexPath.item].thumbnailFileName))
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
        articleVC.article = MyNewsFeed.articles[index!]
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        // set gradient background
        tableView.backgroundView = UIImageView(image: UIImage(named: "ViewControllerBackground.png"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("hello world")
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("Deleted")
            MyNewsFeed.articles.remove(at: indexPath.row)
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
    }
    
}
