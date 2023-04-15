//
//  AppGridViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 14/04/23.
//

import UIKit

class AppGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let layout = UICollectionViewFlowLayout()
    let spacing: CGFloat = 5
    let images = ["Sunset1", "Sunset2", "Sunset3", "Sunset4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "Grid View"
        
        collectionView.delegate = self
        collectionView.dataSource = self

        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        collectionView.collectionViewLayout = layout
        collectionView.register(GridCollectionViewCell.nib(), forCellWithReuseIdentifier: GridCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("AppGridViewController # select at \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 35
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.identifier, for: indexPath) as! GridCollectionViewCell
        cell.configure(with: UIImage(named: images.randomElement()!)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = layout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let cellWidth = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: cellWidth , height: cellWidth)
    }

}
