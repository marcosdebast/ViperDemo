//
//  DetailDefaultView.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 09/11/23.
//

import UIKit

protocol DetailDefaultView {
    var presenter: DetailPresenter? { get set }
    
    func setTitle()
    func setupHeaderView()
}
