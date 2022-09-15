//
//  ContentView.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import SwiftUI

struct DiaryReportView: View {
    @ObservedObject var viewModel: DiaryReportViewModel
    
    init(location: String) {
        self.viewModel = DiaryReportViewModel(location: location)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                LocationView(locationName: viewModel.location)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                
                List {
                    Section {
                        DiarySectionHeaderView(title: "Add photos to site diary")
                        MPImagePickerView(images: $viewModel.images, includeInPhotoBallery: $viewModel.includeInPhotoBallery)
                            .listRowSeparator(.hidden)
                    } header: {
                        HStack {
                            Text("Add a site diary")
                                .font(.title2)
                                .foregroundColor(.primary)
                                .padding(.vertical)
                            Spacer()
                            Button {
                                // question tapped
                            } label: {
                                Image(systemName: "questionmark.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, -8)
                    }
                    
                    Section {
                        DiarySectionHeaderView(title: "Comments")
                        MPTextField(placeHolder: "Comments", text: $viewModel.comments)
                    }
                    .listRowSeparator(.hidden)
                    
                    Section {
                        DiarySectionHeaderView(title: "Details")
                        MPDatePickerView(placeholder: "Date", date: $viewModel.detailsDate)
                        MPOptionsPicketView(selectedOption: $viewModel.detailsArea, pickerType: .area)
                        MPOptionsPicketView(selectedOption: $viewModel.detailsCategory, pickerType: .taskCategory)
                        MPTextField(placeHolder: "Tags", text: $viewModel.detailsTags)
                    }
                    .listRowSeparator(.hidden)
                    
                    Section {
                        DiarySectionHeaderView(title: "Link to existing event?", type: .withToggle($viewModel.needToLinkToEvent))
                        MPOptionsPicketView(selectedOption: $viewModel.selectedEvent, pickerType: .event)
                    } footer: {
                        Button {
                            Task {
                                await viewModel.onNext()
                            }
                        } label: {
                            MPButtonView(state: viewModel.isUploading ? .loading("Please wait...") : .normal("Next"))
                                .padding(.horizontal, -18)
                                .padding(.vertical)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .scrollDismissesKeyboard(.interactively)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("New Diary")
            .toolbar {
                Button {
                    // closing tapped
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                }
            }
            .fullScreenCover(isPresented: $viewModel.showingResult) {
                ResultView(isPresented: $viewModel.showingResult, result: viewModel.apiResultType)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryReportView(location: "Somewhere here\nsecondline")
    }
}
