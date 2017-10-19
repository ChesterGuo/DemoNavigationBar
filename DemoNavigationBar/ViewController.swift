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
        tableView.estimatedRowHeight = 44.0
        tableView.estimatedSectionHeaderHeight = 0.0
        tableView.estimatedSectionFooterHeight = 0.0
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
            //导航栏文本颜色
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)]
            self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor:#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)]
            //search
            let mySearchController: UISearchController = UISearchController(searchResultsController: searchResultsCon)
            mySearchController.searchResultsUpdater = self
            // 设置模态出结果页搜索前不隐藏导航栏
//            mySearchController.hidesNavigationBarDuringPresentation = false
            self.navigationItem.searchController = mySearchController
            // 搜索框默认显示并且滚动不消失
            self.navigationItem.hidesSearchBarWhenScrolling = false
            //当模态出结果页搜索后不隐藏导航栏
            self.definesPresentationContext = true
            //刷新控件
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(TestViewController(), animated: true)
    }
    @objc func refreshData(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2), execute: {
            self.tableView.refreshControl?.endRefreshing()
        })
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
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // 搜索框滚动时消失
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
}
