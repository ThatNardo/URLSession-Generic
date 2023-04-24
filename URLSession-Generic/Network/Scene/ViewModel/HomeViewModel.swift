//
//  HomeViewModel.swift
//  URLSession-Generic
//
//  Created by Buğra Özuğurlu on 15.04.2023.
//

import UIKit

final class HomeViewModel: NSObject {
    
    var myModel = [MyModel]()
    var successCallBack: (() -> ())?
    
    public func getTitleItems() {
        NetworkManager.shared.getTitleItem(type: [MyModel].self) { [weak self] result in
            switch result {
            case.success(let model):
                self?.myModel = model
                self?.successCallBack?()
                print(model)
            case.failure(let error):
                print(error)
            }
        }
    }
}
extension HomeViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(data: myModel[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
