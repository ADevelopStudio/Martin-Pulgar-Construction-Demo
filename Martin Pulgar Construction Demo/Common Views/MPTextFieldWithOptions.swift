//
//  MPTextFieldWithOptions.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct MPTextFieldWithOptions: View {
    var placeHolder: String
    @Binding var selectedOption: String
    @Binding var isSelecting: Bool
    
    var body: some View {
        ZStack {
            MPTextField(placeHolder: placeHolder, text: $selectedOption)
            HStack {
                Spacer()
                Image(systemName: isSelecting ? "chevron.up" : "chevron.down")
                    .renderingMode(.original)
                    .tint(.gray)
                    .padding(.bottom, 4)
            }
            Color.white.opacity(0) // for disabling text editing
        }
        .frame(height: 70)
    }
}

struct MPTextFieldWithOptions_Previews: PreviewProvider {
    static var previews: some View {
        MPTextFieldWithOptions(placeHolder: "Please choose", selectedOption: .constant(""), isSelecting: .constant(false))
    }
}
