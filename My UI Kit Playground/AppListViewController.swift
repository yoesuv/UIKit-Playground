//
//  AppListViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 05/04/23.
//

import UIKit

class AppListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var listData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in 1...100 {
            listData.append("Data ke \(number)")
        }
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "List View"
        
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
        cell.label.text = listData[indexPath.row]
        cell.directionalLayoutMargins = .zero
        cell.layoutMargins = .zero
        cell.contentView.layoutMargins = .zero
        return cell
    }

}
