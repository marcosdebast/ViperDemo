//
//  HomePresenter.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import Foundation

class HomePresenter: HomeDefaultPresenter {
    var router: HomeRouter?
    
    var interactor: HomeInteractor?
    
    weak var view: HomeView?
    
    func viewDidLoad() {
        animateActivityIndicator()
        Task.init {
            let result = try? await interactor?.fetchUsers()
            switch result {
            case .success(let users):
                await view?.update(users: users)
            case .failure(let error):
                await view?.update(error: error)
            default:
                await view?.update(error: FetchError.error)
            }
        }
    }
    
    func animateActivityIndicator() {
        view?.activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        view?.activityIndicator.stopAnimating()
    }
}
