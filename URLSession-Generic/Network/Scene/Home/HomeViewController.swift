//
//  HomeViewController.swift
//  URLSession-Generic
//
//  Created by Buğra Özuğurlu on 15.04.2023.
//
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    // MARK: - Properties
  
    private let homeViewModel = HomeViewModel()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return table
    }()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
        serviceManager()
    }
     private func serviceManager() {
        homeViewModel.getTitleItems()
        homeViewModel.successCallBack = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
         }
    }
}
// MARK: - Helpers
extension HomeViewController {
    private func configure() {
        view.backgroundColor = .label
        view.addSubview(tableView)
        tableViewSetup()
    }
    private func layout() {
        tableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    private func tableViewSetup() {
        tableView.delegate = homeViewModel
        tableView.dataSource = homeViewModel
    }
}
