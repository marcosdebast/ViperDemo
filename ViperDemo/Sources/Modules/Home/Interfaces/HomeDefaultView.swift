//
//  HomeDefaultView.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import Foundation

protocol HomeDefaultView: AnyObject {
    var presenter: HomePresenter? { get set }
    func update(users: [User])
    func update(error: Error)
    func setTitle()
}
