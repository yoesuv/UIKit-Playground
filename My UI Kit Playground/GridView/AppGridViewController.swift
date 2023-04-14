//
//  AppGridViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 14/04/23.
//

import UIKit

class AppGridViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "Grid View"
    }

}
