//
//  MPButton.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct MPButtonView: View {
    var state: MPButtonState
    
    var body: some View {
        ZStack{
            switch state {
            case .loading:
                Color.green
                Color.black.opacity(0.5)
            case .normal:
                Color.green
            }
            
            HStack(spacing: 10) {
                if state.isLoadingNeeded {
                    ProgressView()
                        .tint(.white)
                }
                Text(state.titleText)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
        .frame(height: 60)
        .cornerRadius(8)
        .shadow(radius: 5, x: 2, y: 2)
    }
}

struct MPButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MPButtonView(state: .loading("Loading..."))
            MPButtonView(state: .normal("Next"))
        }
        .padding()

    }
}
