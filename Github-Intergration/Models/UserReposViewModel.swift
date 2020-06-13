//
//  UserSpecefic.swift
//  Github-Intergration
//
//  Created by devTmg on 6/14/20.
//  Copyright © 2020 devTmg. All rights reserved.
//

import SwiftUI

struct UserReposViewModel: Hashable,Codable,Identifiable {
    
    
    
    var repo : UserRepos
    
    init(repo : UserRepos) {
        self.repo = repo
    }
    var name: String {
        return self.repo.name ?? ""
       }
       
    var id: String {
       return self.repo.id ?? ""
    }
    
  
}
