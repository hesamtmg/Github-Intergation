


import SwiftUI


struct Home: View {
 
    
    
    @ObservedObject var model = UserListViewModel()
   
    

    var body: some View {

       
        
        
        NavigationView {
            VStack {
                 NavBar(model: model)
                HStack {
                    List(model.users){ user in
                    ImageRow(model: user)
                        VStack(alignment: .leading){
                        Text(user.name)
                        Text(user.repoCount)
                        NavigationLink(destination:
                        UserView(model: UserReposListViewModel(), user: user.user)) {
                              Text("")
                          }
                        }
                       
                       
                }
                       

                .navigationBarTitle(Text("Github Search"))
                .resignKeyboardOnDragGesture()
            }
                
        }
    }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           Home()
              .environment(\.colorScheme, .light)

           Home()
              .environment(\.colorScheme, .dark)
        }
    }
}






