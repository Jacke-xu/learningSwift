//
//  MaterViewController.swift
//  swift(UISearchViewController)
//
//  Created by 范云飞 on 2018/8/27.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class MaterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {

    //MARK:--- Properties
    var tableView: UITableView!
    var searchFooter: SearchFooter!
    var detailViewController : DatailViewController? = nil
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    //MARK:--- View Setup
    override func viewDidLoad() { 
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let image = UIImage(named: "Inline-Logo")
        let width: CGFloat = (image?.size.width)!
        let height: CGFloat = (image?.size.height)!
        
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100 * (height/width)))
        titleImageView.image = UIImage(named:"Inline-Logo")
        let titleview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100 * (height/width)))
        self.navigationItem.titleView = titleview
        titleview.addSubview(titleImageView)


        // Setup tableView
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        searchFooter = SearchFooter(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        tableView.tableFooterView = searchFooter
        
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
    
        
        // Setup the DataSource
        candies = [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear"),
            Candy(category:"Other", name:"Candy Floss"),
            Candy(category:"Chocolate", name:"Chocolate Coin"),
            Candy(category:"Chocolate", name:"Chocolate Egg"),
            Candy(category:"Other", name:"Jelly Beans"),
            Candy(category:"Other", name:"Liquorice"),
            Candy(category:"Hard", name:"Toffee Apple")
            
        ]
        
        
//        if splitViewController != nil {
//            let controllers = splitViewController?.viewControllers
//            detailViewController = (controllers![(controllers?.count)! - 1] as! UINavigationController).topViewController as? DatailViewController
//        }
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        if masterViewController!.isCollapsed {
//            if let selectionIndexPath = tableView.indexPathForSelectedRow {
//                tableView.deselectRow(at: selectionIndexPath, animated: animated)
//            }
//        }
//        super.viewWillAppear(animated)
//    }
    
    
    //MARK:--- UITableViewDelegate && UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            searchFooter.setIsFilteringToShow(filteredItemCount: filteredCandies.count, of: candies.count)
            return filteredCandies.count
        }
        
        searchFooter.setNotFiltering()
        return candies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let candy: Candy
        if isFiltering() {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let candy: Candy
        if isFiltering() {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        
        let detailController = DatailViewController.init()
        detailController.detailCandy = candy
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCandies = candies.filter({ (candy: Candy) -> Bool in
            let doesCategoryMatch = (scope == "All") || (candy.category == scope)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && candy.name.lowercased().contains(searchText.lowercased())
            }
        })
        
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }

    //MARK:--- UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    
    //MARK:-- UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
    

}
