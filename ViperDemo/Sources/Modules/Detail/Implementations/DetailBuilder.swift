//
//  DetailBuilder.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 09/11/23.
//

import UIKit

class DetailBuilder {

    static func build(user: User) -> UIViewController {
        let view = DetailView()
        view.user = user
        
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()

        view.presenter = presenter

        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        router.entry = view

        return view
    }
}
