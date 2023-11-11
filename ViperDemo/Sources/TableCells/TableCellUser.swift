//
//  TableCellUser.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 09/11/23.
//

import UIKit

class TableCellUser: UITableViewCell {
    
    lazy var mainLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainLabel)
        contentView.addSubview(secondLabel)

        mainLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
        mainLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: -5).isActive = true
        
        secondLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        secondLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10).isActive = true
        secondLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
