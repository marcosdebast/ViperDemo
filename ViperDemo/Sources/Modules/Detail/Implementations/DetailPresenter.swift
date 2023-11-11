//
//  DetailPresenter.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 09/11/23.
//

import Foundation

class DetailPresenter: DetailDefaultPresenter {
    var router: DetailRouter?
    
    var interactor: DetailInteractor?
    
    weak var view: DetailView?
}
