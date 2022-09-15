//
//  MPDatePickerView.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct MPDatePickerView: View {
    var placeholder: String
    
    @Binding var date: Date
    @State var isSelecting: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isSelecting.toggle()
            } label: {
                MPTextFieldWithOptions(placeHolder: placeholder,
                                       selectedOption: .constant(date.formatted(date: .long, time: .omitted)),
                                       isSelecting: $isSelecting)
            }
            
            if isSelecting {
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .frame(maxHeight: 400)
            }
        }
    }
}

struct MPDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MPDatePickerView(placeholder: "Choose a date", date: .constant(.now))
    }
}
