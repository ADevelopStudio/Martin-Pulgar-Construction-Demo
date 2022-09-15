//
//  SingleImageView.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct SingleImageView: View {
    var image: Image
    var onDelete: ()->(Void)
    
    var body: some View {
        image
            .resizable()
            .cornerRadius(8)
            .padding(6)
            .overlay(
                Button(action: {
                    onDelete()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .shadow(radius: 5)
                })
                , alignment: .topTrailing)
            .frame(width: 100, height: 100)
    }
}

struct SingleImageView_Previews: PreviewProvider {
    static var previews: some View {
        SingleImageView(image: Image(systemName: "questionmark.square"), onDelete:{  })
    }
}
