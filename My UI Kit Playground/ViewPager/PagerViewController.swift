//
//  PagerViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 18/04/23.
//

import UIKit

class PagerViewController: UIViewController {

    @IBOutlet weak var tabsView: TabsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "View Pager"
        
        setupTabs()
    }
    
    private func setupTabs() {
        tabsView.tabs = [
            Tab(icon: UIImage(systemName: "music.note"), title: "Music"),
            Tab(icon: UIImage(systemName: "video.square"), title: "Movies"),
            Tab(icon: UIImage(systemName: "text.book.closed"), title: "Books")
        ]
        
        tabsView.tabMode = .fixed
        
        tabsView.titleColor = .black
        tabsView.iconColor = .black
        tabsView.backgroundColor = UIColor(named: "Grey200")
        tabsView.titleFont = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        tabsView.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
    }

}
