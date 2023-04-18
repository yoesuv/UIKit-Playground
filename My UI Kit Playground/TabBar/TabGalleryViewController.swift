//
//  TabGalleryViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 18/04/23.
//

import UIKit

class TabGalleryViewController: UIViewController {

    @IBOutlet weak var labelGallery: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelGallery.text = "Gallery"
    }

}
