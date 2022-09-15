//
//  MPImagePickerView.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct MPImagePickerView: View {
    @Binding var images: [UIImage]
    @Binding var includeInPhotoBallery: Bool
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage? = nil
    
    var body: some View {
        VStack {
            if !images.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<images.count, id: \.self) { imgNumber in
                            SingleImageView(image: Image(uiImage: images[imgNumber]), onDelete: {
                                images.remove(at: imgNumber)
                            })
                        }
                        Spacer()
                    }
                }
                .frame(height: 110)
            }
            Button {
                showingImagePicker = true
            } label: {
                MPButtonView(state: .normal("Add a photo"))
            }
            .padding(.vertical)
            
            HStack {
                Text("Include in photo gallery")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                MPCheckBox(isOn: $includeInPhotoBallery)
            }
        }
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    private func loadImage() {
        guard let inputImage = inputImage else { return }
        images.append(inputImage)
    }
}

struct MPImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MPImagePickerView(images:.constant([]), includeInPhotoBallery: .constant(true))
    }
}
