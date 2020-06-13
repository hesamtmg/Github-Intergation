//
//  User.swift
//  Github-Intergration
//
//  Created by devTmg on 6/13/20.
//  Copyright © 2020 devTmg. All rights reserved.
//

import SwiftUI

struct repoNodes: Hashable,Codable,Identifiable{
    var id  : String??
    var name : String?
}

struct Repositories : Hashable,Codable{
    
    var totalCount : Int?
    var nodes : [repoNodes]?
}

struct User: Hashable,Codable,Identifiable {
    var id :String?
    var name :String?
    var bio :String?
    var login :String?
    var avatarUrl :String?
    var url :String?
    var __typename :String?
    var repositories : Repositories
    
}
