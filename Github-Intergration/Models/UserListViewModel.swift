//
//  UserListViewModel.swift
//  Github-Intergration
//
//  Created by devTmg on 6/13/20.
//  Copyright © 2020 devTmg. All rights reserved.
//

import SwiftUI

class UserListViewModel : ObservableObject {
    
    @Published var users = [UserViewModel]()
    var search: String = "" {
        willSet(newValue) {
            fetchUsers(newValue)
            
        }
    }

    init() {
        
        fetchUsers("hesam")
    }
   
    
    
    func fetchUsers(_ user:String){
        var users = [User]()
        Network.shared.apollo.fetch(query: SearchTop10UsersQuery(user: user, count: 30)) { result in

            switch result{
            case .success(let graphQLResult):
                
                for ss in graphQLResult.data!.search.nodes! {
                    
                    if let user = Network.shared.decode(data: ss?.asUser?.resultMap as! [String : Any], type: User.self) {
                       users.append(user)
                    }
                    
                }
                 self.users = users.map(UserViewModel.init)
            case .failure(let error):
                print(error)
            }


        }
    }
    

}


