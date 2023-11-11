//
//  DetailDefaultPresenter.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 09/11/23.
//

import Foundation

protocol DetailDefaultPresenter {
    
    var router: DetailRouter? { get set }
    var interactor: DetailInteractor? { get set }
    var view: DetailView? { get set }

}
