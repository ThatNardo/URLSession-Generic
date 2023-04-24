//
//  HomeTableViewCell.swift
//  URLSession-Generic
//
//  Created by Buğra Özuğurlu on 16.04.2023.
//

import UIKit
import SnapKit

protocol HomeTableViewCellProtocol {
    var titleLbl: String {get}
    var descLbl: String {get}
}
class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"
    
    private let titleLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.textColor = .red
        tLabel.numberOfLines = 0
        return tLabel
    }()
    private let descLabel: UILabel = {
        let dLabel = UILabel()
        return dLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewSetup()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HomeTableViewCell {
    private func viewSetup() {
        addSubview(titleLabel)
        addSubview(descLabel)
    }
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(10)
        }
        descLabel.snp.makeConstraints { make in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    func configure(data: HomeTableViewCellProtocol) {
        titleLabel.text = data.titleLbl
        descLabel.text = data.descLbl
    }
}
