//
//  MPCheckBox.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct MPCheckBox: View {
    @Binding var isOn: Bool
    
    var body: some View {
            Image(systemName: isOn ? "checkmark.square.fill" : "checkmark.square")
                .resizable()
                .foregroundColor(.green)
                .frame(width: 30, height: 30)
        .onTapGesture {
            isOn.toggle()
        }
    }
}

struct MPCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MPCheckBox(isOn: .constant(true))
            MPCheckBox(isOn: .constant(false))
        }
    }
}
