//
//  ViewController.swift
//  DemoNavigationBar
//
//  Created by ChesterGuo on 2017/6/22.
//  Copyright © 2017年 xinyuantec. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,UISearchResultsUpdating{
    var searchResultsCon = ResultsTableViewController()
    var contacts = Array<Contact>()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
    }
    func configureTableView(){
        for _ in 0...20 {
            let temp = Int(arc4random_uniform(1000000000)) + 15000000000
            let contact = Contact()
            contact.mobile = String(temp)
            contacts.append(contact)
        }
    }
    func configureNavigationBar(){
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            let mySearchController: UISearchController = UISearchController(searchResultsController: searchResultsCon)
            mySearchController.searchResultsUpdater = self
            mySearchController.hidesNavigationBarDuringPresentation = false
            self.navigationController?.navigationItem.searchController = mySearchController
            self.definesPresentationContext = true
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK -- tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "reuseID")
        if contacts.count > indexPath.row {
            let contact = contacts[indexPath.row]
            cell.textLabel?.text = contact.mobileString
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK -- searchController
    @available(iOS 8.0, *)
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        let contactList = contacts.filter({ (con) -> Bool in
            return (con.mobile?.hasPrefix(searchText))!
        })
        searchResultsCon.contacts = contactList
        searchResultsCon.tableView.reloadData()

    }
}

