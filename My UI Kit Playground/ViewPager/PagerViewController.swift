//
//  PagerViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 18/04/23.
//

import UIKit

class PagerViewController: UIViewController, TabsDelegate, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    @IBOutlet weak var tabsView: TabsView!
    
    var currentIndex: Int = 0
    var pageController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "Grey200")
        appearance.shadowColor = UIColor(named: "Grey200")
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationItem.title = "View Pager"
        
        setupTabs()
        setupPageViewController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "Grey200")
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func viewDidLayoutSubviews() {
        tabsView.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func tabsViewDidSelectItemAt(position: Int) {
        if position != currentIndex {
            if position > currentIndex {
                self.pageController.setViewControllers([showViewController(position)!], direction: .forward, animated: true, completion: nil)
            } else {
                self.pageController.setViewControllers([showViewController(position)!], direction: .reverse, animated: true, completion: nil)
            }
            tabsView.collectionView.scrollToItem(at: IndexPath(item: position, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = pageViewController.viewControllers?.first
        var index: Int
        index = getVCPageIndex(vc)
        if index == tabsView.tabs.count {
            return nil
        } else {
            index += 1
            return self.showViewController(index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = pageViewController.viewControllers?.first
        var index: Int
        index = getVCPageIndex(vc)
        
        if index == 0 {
            return nil
        } else {
            index -= 1
            return self.showViewController(index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            if completed {
                guard let vc = pageViewController.viewControllers?.first else { return }
                let index: Int
                
                index = getVCPageIndex(vc)
                
                tabsView.collectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredVertically)
                tabsView.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
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
        
        tabsView.delegate = self
        tabsView.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
    }
    
    private func setupPageViewController() {
        self.pageController = storyboard?.instantiateViewController(withIdentifier: "TabsViewController") as! TabsViewController
        self.addChild(self.pageController)
        self.view.addSubview(self.pageController.view)
        
        pageController.delegate = self
        pageController.dataSource = self
        
        pageController.setViewControllers([showViewController(0)!], direction: .forward, animated: true, completion: nil)
        
        self.pageController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.pageController.view.topAnchor.constraint(equalTo: self.tabsView.bottomAnchor),
            self.pageController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.pageController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.pageController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.pageController.didMove(toParent: self)
    }
    
    func showViewController(_ index: Int) -> UIViewController? {
        if (self.tabsView.tabs.count == 0) || (index >= self.tabsView.tabs.count) {
            return nil
        }
        
        currentIndex = index
        
        if index == 0 {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "TabOneViewController") as! TabOneViewController
            contentVC.pageIndex = index
            return contentVC
        } else if index == 1 {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "TabTwoViewController") as! TabTwoViewController
            contentVC.pageIndex = index
            return contentVC
        } else if index == 2 {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "TabThreeViewController") as! TabThreeViewController
            contentVC.pageIndex = index
            return contentVC
        } else {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "TabOneViewController") as! TabOneViewController
            contentVC.pageIndex = index
            return contentVC
        }
    }
    
    func getVCPageIndex(_ viewController: UIViewController?) -> Int {
        switch viewController {
        case is TabOneViewController:
            let vc = viewController as! TabOneViewController
            return vc.pageIndex
        case is TabTwoViewController:
            let vc = viewController as! TabTwoViewController
            return vc.pageIndex
        case is TabThreeViewController:
            let vc = viewController as! TabThreeViewController
            return vc.pageIndex
        default:
            let vc = viewController as! TabOneViewController
            return vc.pageIndex
        }
    }

}
