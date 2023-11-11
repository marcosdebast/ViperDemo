//
//  HomeRouter.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import UIKit

class HomeRouter: HomeDefaultRouter {
    weak var entry: UIViewController?
    
    func pushToDetail(user: User) {
        let detailEntryPoint = DetailBuilder.build(user: user)
        
        entry?.navigationController?.pushViewController(detailEntryPoint, animated: true)
    }
}
