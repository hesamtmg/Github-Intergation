
//
//  imageRow.swift
//  Github-Intergration
//
//  Created by devTmg on 6/13/20.
//  Copyright © 2020 devTmg. All rights reserved.
//
import SwiftUI
import struct Kingfisher.KFImage

struct ImageRow: View {
    let model: UserViewModel
    
    init(model : UserViewModel) {
        self.model = model
        print(model.url)
    }
    var body: some View {
        VStack(alignment: .leading) {
            ImageViewContainer(imageUrl: model.url)
        }
    }
}
struct ImageViewContainer: View {
   
    var imageUrl : String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        
        KFImage(URL(string: imageUrl))
        
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 3.0))
            .frame(width: 70.0, height: 70.0)
    }
}
