//
//  UserViewModel.swift
//  Github-Intergration
//
//  Created by devTmg on 6/13/20.
//  Copyright © 2020 devTmg. All rights reserved.
//

import SwiftUI

struct UserViewModel: Hashable,Codable,Identifiable {
    
    var id = UUID()
    
    var user : User
    
    init(user : User) {
        self.user = user
    }
    var name: String {
        return self.user.name ?? ""
       }
       
    var url: String {
       return self.user.avatarUrl ?? ""
    }
    
    var repoCount: String {
        return "\(self.user.repositories.totalCount ?? 0) repositories available"
    }
    
    var reposName : [repoNodes] {
        return self.user.repositories.nodes!
    }
    var login : String {
        return self.user.login ?? ""
    }
}

