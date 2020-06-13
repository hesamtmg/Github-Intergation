//
//  UserView.swift
//  Github-Intergration
//
//  Created by devTmg on 6/13/20.
//  Copyright © 2020 devTmg. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage


struct UserView: View {
    
    
   @ObservedObject var model = UserReposListViewModel()
    var user =
        User(id: "", name: "", bio: "", login: "", avatarUrl: "", url: "", __typename: "", repositories: Repositories(totalCount: 0, nodes: []))
    
    init(model : UserReposListViewModel,user:User) {
        self.model = model
        self.user = user
        self.model.fetchUsersRepos(user.login!, 100)
    }
   
    var body: some View {
        
        
            List{
                VStack(alignment: .center ){
                   KFImage(URL(string: user.avatarUrl!))
                       .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            
                .listRowInsets(EdgeInsets())
                
                
                Spacer()
              
                   ForEach(model.repos) { repo in
                    VStack{
                        Text(repo.name)
                        }
                    }
                
                    
                    
                }
                  
                .edgesIgnoringSafeArea(.top)
                .navigationBarHidden(true)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(model: UserReposListViewModel(),user: User(id: "", name: "", bio: "", login: "", avatarUrl: "", url: "", __typename: "", repositories: Repositories(totalCount: 0, nodes: [])))
    }
}
