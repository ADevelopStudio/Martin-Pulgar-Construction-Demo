//
//  MPOptionsPicketView.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct MPOptionsPicketView: View {
    @Binding var selectedOption: String
    @State var isSelecting: Bool = false
    
    var pickerType: OptionPickerType
    
    var body: some View {
        VStack {
            Button {
                isSelecting.toggle()
            } label: {
                MPTextFieldWithOptions(placeHolder: pickerType.placeholder,
                                       selectedOption: $selectedOption,
                                       isSelecting: $isSelecting)
            }
            
            if isSelecting {
                Picker("", selection: $selectedOption) {
                    ForEach(pickerType.options, id: \.self) { Text($0) }
                }
                .pickerStyle(.wheel)
            }
        }
    }
}

struct MPOptionsPicketView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MPOptionsPicketView(selectedOption: .constant(""), pickerType: .area)
            Spacer()
        }
    }
}
