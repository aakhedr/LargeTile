//
//  DetailViewController.swift
//  LargeTitle
//
//  Created by Ahmed Khedr on 9/25/17.
//  Copyright © 2017 Ahmed Khedr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    
    
    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        initializeSearchController()
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            title = detail
        }
    }
    
    // MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFinal" {
            let final = segue.destination as! FinalViewController
            final.object = detailItem
        }
    }
    
    // MARK:- table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        cell.textLabel?.text = detailItem
        return cell
    }
    
    func initializeSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.scopeButtonTitles = ["All", "Favorites"]
        searchController.searchBar.placeholder = "Search..."
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.sizeToFit()
        searchController.loadViewIfNeeded()
        definesPresentationContext = true
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
    }
}

