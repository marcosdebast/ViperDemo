//
//  DetailView.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 09/11/23.
//

import UIKit

class DetailView: UIViewController, DetailDefaultView {
    var presenter: DetailPresenter?
    
    var user: User?
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = false
        table.estimatedRowHeight = 70
        table.rowHeight = UITableView.automaticDimension
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TableCellUserDetail")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        self.setupHeaderView()
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupHeaderView() {
        let view = UIView()
        view.frame.size.height = 80
        
        let usernameLabel: UILabel = {
            let label = UILabel()
            label.text = user?.username
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            return label
        }()
        
        let emailLabel: UILabel = {
            let label = UILabel()
            label.text = user?.email
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            return label
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "mountains")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 6
            imageView.clipsToBounds = true
            return imageView
        }()
        
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(imageView)
        
        tableView.tableHeaderView = view
        
        usernameLabel.leadingAnchor.constraint(equalTo: tableView.layoutMarginsGuide.leadingAnchor).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: tableView.layoutMarginsGuide.trailingAnchor).isActive = true
        usernameLabel.bottomAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -2.5).isActive = true
        
        emailLabel.leadingAnchor.constraint(equalTo: tableView.layoutMarginsGuide.leadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: tableView.layoutMarginsGuide.trailingAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5).isActive = true
        
        imageView.trailingAnchor.constraint(equalTo: tableView.layoutMarginsGuide.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setTitle() {
        self.navigationItem.title = user?.name
    }
}

extension DetailView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return NSLocalizedString("Street", comment: "")
        case 1:
            return NSLocalizedString("Suite", comment: "")
        case 2:
            return NSLocalizedString("City", comment: "")
        case 3:
            return NSLocalizedString("Zipcode", comment: "")
        default:
            return String()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellUserDetail", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.section {
        case 0:
            content.text = user?.address.street
        case 1:
            content.text = user?.address.suite
        case 2:
            content.text = user?.address.city
        case 3:
            content.text = user?.address.zipcode
        default:
            break
        }
        cell.contentConfiguration = content
        return cell
    }
}
