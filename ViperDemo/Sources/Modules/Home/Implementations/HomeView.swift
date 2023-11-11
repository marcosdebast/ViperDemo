//
//  HomeView.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import UIKit

class HomeView: UIViewController, HomeDefaultView {
    var presenter: HomePresenter?
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = false
        table.estimatedRowHeight = 70
        table.rowHeight = UITableView.automaticDimension
        table.register(TableCellUser.self, forCellReuseIdentifier: "TableCellUser")
        return table
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.isHidden = false
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    func update(users: [User]) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.stopActivityIndicator()
            self?.users = users
            self?.tableView.reloadData()
        }
    }
    
    func update(error: Error) {
        print(error)
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.stopActivityIndicator()
            self?.tableView.reloadData()
        }
    }
    
    func setTitle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.title = NSLocalizedString("ViperDemo", comment: "")
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellUser") as! TableCellUser
        let user = users[indexPath.row]
        cell.mainLabel.text = user.name
        cell.secondLabel.text = user.username
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let user = users[indexPath.row]
        presenter?.router?.pushToDetail(user: user)
    }
}
