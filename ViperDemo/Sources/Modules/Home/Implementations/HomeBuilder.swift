//
//  HomeBuilder.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import UIKit

class HomeBuilder {

    static func build() -> UIViewController {
        let view = HomeView()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()

        view.presenter = presenter

        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        router.entry = view

        return view
    }
}
