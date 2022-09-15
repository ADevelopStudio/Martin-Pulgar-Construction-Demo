//
//  ResultView.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct ResultView: View {
    @Binding var isPresented: Bool
    var result: ApiResult
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName:result.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            Text(result.message)
                .font(.title)
            
            Button {
                isPresented.toggle()
            } label: {
                MPButtonView(state: .normal("Close"))
                    .padding(.horizontal, 40)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ResultView(isPresented: .constant(false), result: .error(NetworkModel.ServiceError.generalFailure))
        }
    }
}
