//
//  CollapsingViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 17/05/23.
//

import UIKit

class CollapsingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    // MARK: - UI Components
    private var tableView: UITableView!
    
    // MARK: - Data
    private var listData: [String] = []
    
    // MARK: - Constants
    private let expandedHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Generate sample data
        for number in 1...50 {
            listData.append("Item \(number)")
        }
        
        setupNavigationBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make navigation bar transparent initially
        setupTransparentNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Restore navigation bar appearance
        restoreNavigationBar()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        // Back button (like ListView)
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        // Title
        navigationItem.title = "Expanded List"
    }
    
    private func setupTransparentNavigationBar() {
        // Make navigation bar transparent (like Flutter's SliverAppBar expanded state)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        // Tint color for back button
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.backgroundColor = .systemBackground
        
        // Disable automatic content inset adjustment (we handle it manually)
        tableView.contentInsetAdjustmentBehavior = .never
        
        // Add table view to view
        view.addSubview(tableView)
        view.sendSubviewToBack(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Push table content below header
        tableView.contentInset = UIEdgeInsets(top: expandedHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -expandedHeight)
        
        // Bring header to front
        view.bringSubviewToFront(headerView)
    }
    
    // MARK: - Navigation Bar Appearance
    
    private func updateNavigationBarAppearance(progress: CGFloat) {
        // progress: 0 = expanded (transparent), 1 = collapsed (opaque)
        
        let appearance = UINavigationBarAppearance()
        
        if progress >= 1.0 {
            // Fully collapsed - opaque indigo
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemIndigo
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.tintColor = .white
        } else if progress > 0 {
            // Partially collapsed - semi-transparent
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor.systemIndigo.withAlphaComponent(progress)
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white.withAlphaComponent(progress)]
            navigationController?.navigationBar.tintColor = .white
        } else {
            // Fully expanded - transparent
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .clear
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.tintColor = .white
        }
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    private func restoreNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.tintColor = nil
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = listData[indexPath.row]
        cell.separatorInset = .zero
        cell.layoutMargins = .zero
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Calculate offset from top
        let offsetY = scrollView.contentOffset.y + expandedHeight
        
        // Calculate new header height
        let newHeight = expandedHeight - offsetY
        
        // Clamp between 0 and expandedHeight
        let clampedHeight = max(0, min(expandedHeight, newHeight))
        
        // Update header height constraint
        headerHeightConstraint.constant = clampedHeight
        
        // Calculate collapse progress (0 = expanded, 1 = collapsed)
        let progress = min(1, max(0, offsetY / expandedHeight))
        
        // Update navigation bar appearance
        updateNavigationBarAppearance(progress: progress)
        
        // Parallax effect on header background
        if offsetY > 0 {
            headerView.transform = CGAffineTransform(translationX: 0, y: -offsetY * 0.3)
        } else {
            headerView.transform = .identity
        }
    }
}
