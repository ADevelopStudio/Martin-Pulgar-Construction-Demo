//
//  MPTextField.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct MPTextField: View {
    @Binding var text: String
    @State private var isEditing = false
    
    private let placeHolderText: String
    
    fileprivate var shouldPlaceHolderMove: Bool {
        isEditing || !text.isEmpty
    }
    
    init(placeHolder: String, text: Binding<String>) {
        self._text = text
        self.placeHolderText = placeHolder
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeHolderText)
                .font(shouldPlaceHolderMove ? .subheadline : .title3)
                .foregroundColor(Color.secondary)
                .padding(.bottom, shouldPlaceHolderMove ? 70 : 10)
                .padding(.horizontal, 5)
                .animation(.linear(duration: 0.2), value: isEditing)
            
            VStack(spacing: 5) {
                TextField("", text: $text, onEditingChanged: { (edit) in
                    isEditing = edit
                })
                .frame(height: 60)
                .font(.title3)
                .multilineTextAlignment(.leading)
                .animation(.linear(duration: 0.2), value: isEditing)
                .padding(.horizontal, 5)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(isEditing ? .red : .gray)
            }
        }
    }
}

private struct MPTextFieldDemo: View {
    @State var name: String = "Michael"
    @State var email: String = ""
    var body: some View {
        VStack {
            MPTextField(placeHolder: "Name", text: $name)
            MPTextField(placeHolder: "Email", text: $email)
        }.padding()
    }
}

struct MPTextField_Previews: PreviewProvider {
    static var previews: some View {
        MPTextFieldDemo()
    }
}
