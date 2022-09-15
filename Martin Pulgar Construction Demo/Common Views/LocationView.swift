//
//  LocationView.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct LocationView: View {
    var locationName: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .frame(width: 20, height: 20)
            Text(locationName)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(locationName: "Noosa, QLD2")
    }
}
