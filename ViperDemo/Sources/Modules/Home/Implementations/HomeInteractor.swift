//
//  HomeInteractor.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import Foundation

class HomeInteractor: HomeDefaultInteractor {
    
    //MARK: presenter should be 'weak'
    weak var presenter: HomePresenter? 
    
    func fetchUsers() async throws -> Result<[User], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return Result.failure(FetchError.malformedURL)}
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let users = try JSONDecoder().decode([User].self, from: data)
        
        return Result.success(users)
        
    }
}


