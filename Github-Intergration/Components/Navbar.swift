//
//  Navbar.swift
//  Github-Intergration
//
//  Created by devTmg on 6/13/20.
//  Copyright © 2020 devTmg. All rights reserved.
//



import SwiftUI

struct NavBar: View {
    
    @State private var showCancelButton: Bool = false
    @ObservedObject var model = UserListViewModel()
    
    init(model : UserListViewModel) {
        self.model = model
    }
    
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "magnifyingglass")

                TextField("search",text: $model.search)
                    
                    
                
               
                Button(action: {
                    self.model.search = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(self.model.search == "" ? 0.0 : 1.0)
                    
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)

            if showCancelButton  {
                Button("Cancel") {
                        UIApplication.shared.endEditing(true)
                        self.model.search = ""
                        self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        
        
                
            }
        .padding(.horizontal)
        .navigationBarHidden(self.model.search == "" ? false : true)
    
        }
      
    
}


struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(model: UserListViewModel())
    }
}
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
