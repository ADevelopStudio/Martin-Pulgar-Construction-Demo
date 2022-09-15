//
//  DiarySectionHeaderView.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

enum DiarySectionHeaderType {
    case usual
    case withToggle(Binding<Bool>)
}

struct DiarySectionHeaderView: View {
    var title: String
    var type: DiarySectionHeaderType = .usual
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                    .font(.title2)
                    .bold()
                    .padding(.vertical)
                switch type {
                case .usual:
                    Spacer()
                case .withToggle(let bool):
                    Spacer()
                    MPCheckBox(isOn: bool)
                }
            }
            Divider()
        }
    }
}

struct DiarySectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DiarySectionHeaderView(title: "Section Header 1", type: .usual)
            DiarySectionHeaderView(title: "Section Header 2", type: .withToggle(.constant(false)))
            DiarySectionHeaderView(title: "Section Header 3", type: .withToggle(.constant(true)))
        }
    }
}
