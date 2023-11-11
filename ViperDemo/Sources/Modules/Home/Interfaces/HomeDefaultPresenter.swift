//
//  HomeDefaultPresenter.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import Foundation

protocol HomeDefaultPresenter: AnyObject {
    
    var router: HomeRouter? { get set }
    var interactor: HomeInteractor? { get set }
    var view: HomeView? { get set }
    
    func viewDidLoad()
    func animateActivityIndicator()
    func stopActivityIndicator()
}
