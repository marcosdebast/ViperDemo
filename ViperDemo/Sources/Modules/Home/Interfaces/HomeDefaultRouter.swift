//
//  HomeDefaultRouter.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import UIKit

protocol HomeDefaultRouter: AnyObject {
    var entry: UIViewController? {get set}
    
    func pushToDetail(user: User)
}
