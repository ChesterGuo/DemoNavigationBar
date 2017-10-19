//
//  TestViewController.swift
//  DemoNavigationBar
//
//  Created by ChesterGuo on 2017/10/19.
//  Copyright © 2017年 xinyuantec. All rights reserved.
//

import UIKit

class TestViewController: UIViewController,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    }

    var searchResultsCon = ResultsTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
