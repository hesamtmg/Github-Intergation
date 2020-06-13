//
//  UserSpeceficListViewModel.swift
//  Github-Intergration
//
//  Created by devTmg on 6/14/20.
//  Copyright © 2020 devTmg. All rights reserved.
//


import SwiftUI

class UserReposListViewModel : ObservableObject {
    
    @Published var repos = [UserReposViewModel]()
 
    
    
    func fetchUsersRepos(_ user:String, _ count:Int){
        var repos = [UserRepos]()
        Network.shared.apollo.fetch(query: SearchReposQuery(user: user, count: count)){ result in

            switch result{
            case .success(let graphQLResult):
                
                for ss in
                    (graphQLResult.data!.user?.repositories.nodes)!{
                    print(ss)
                        if let repo = Network.shared.decode(data: ss?.resultMap as! [String : Any], type: UserRepos.self) {
                       repos.append(repo)
                    }
                    
                }
                 self.repos = repos.map(UserReposViewModel.init)
                
            case .failure(let error):
                print(error)
            }


        }
    }
    
    
    
    
}

