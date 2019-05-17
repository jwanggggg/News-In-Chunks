//
//  SectionViewController.swift
//  News In Chunks
//
//  Created by Jonathan Wang on 5/8/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import UIKit
import Foundation

class SectionViewController: UITableViewController {
    // Users choose section. Articles are displayed
    // in ArticlesTableViewController accordingly.
    
    // Sections and section selected should be static and accessible
    // so JSON parser can access correct news articles
    
    var selectedIndex = [[IndexPath.init(row:0, section:0)]]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sections.sections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Sections.sections[indexPath.row]
        
        let selectedIndex = self.selectedIndex[indexPath.section]
        if selectedIndex.contains(indexPath) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        cell.textLabel?.font = UIFont(name:"Futura", size:45)

//            [UIFont fontWithName: @"Futura Bold" size: 18.0 ];
//        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.textAlignment = NSTextAlignment.center
//        cell.textLabel?.increaseSize(5)
//        cell.textLabel?.textColor = CGColor.whiteColor
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Only one can be selected at once. One must be selected
        // If an unselected section is chosen, remove checkmark from previously selected and place on new.
        
        let cell = tableView.cellForRow(at: indexPath)
        
        // If current cell is not present in selectedIndexes
        if !self.selectedIndex[indexPath.section].contains(indexPath) {
            // mark it checked
            cell?.accessoryType = .checkmark
            
            // Remove any previous selected indexpath
            self.selectedIndex[indexPath.section].removeAll()
            
            // add currently selected indexpath
            self.selectedIndex[indexPath.section].append(indexPath)
            Sections.sectionSelected = selectedIndex
            tableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set gradient background
        tableView.backgroundView = UIImageView(image: UIImage(named: "ViewControllerBackground.png"))
    }
    
}
