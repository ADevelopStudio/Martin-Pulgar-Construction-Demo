//
//  DiaryReportViewModel.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import UIKit

@MainActor
class DiaryReportViewModel: ObservableObject {
    var location: String
    
    @Published var comments: String = ""
    @Published var includeInPhotoBallery: Bool = false
    @Published var images: [UIImage] = []
    
    //Details
    @Published var detailsDate: Date = .now
    @Published var detailsArea: String = ""
    @Published var detailsCategory: String = ""
    @Published var detailsTags: String = ""
    
    //Link to existing Event
    @Published var selectedEvent: String = ""
    @Published var needToLinkToEvent: Bool = false
    
    //Upload and result
    @Published var isUploading: Bool = false
    @Published var showingResult = false
    var apiResultType: ApiResult = .success
    
    private let serviceModel = NetworkModel()
    
    init(location: String) {
        self.location = location
    }
    
    func onNext() async {
        if isUploading { return }
        isUploading = true
        do {
            let _ = try await serviceModel.postFake(self.generateReport())
            isUploading = false
            apiResultType = .success
            showingResult = true
        } catch {
            apiResultType = .error(error)
            showingResult = true
            isUploading = false
        }
    }
    
    private func generateReport() -> DiaryReport {
        DiaryReport(location: self.location,
                    comments: comments.isEmpty ? nil : comments,
                    images: images.compactMap{$0.base64},
                    date: detailsDate,
                    area: detailsArea.isEmpty ? nil : detailsArea,
                    category: detailsCategory.isEmpty ? nil : detailsCategory,
                    tags: detailsTags.isEmpty ? nil : detailsTags,
                    event: (selectedEvent.isEmpty || !needToLinkToEvent) ? nil : selectedEvent
        )
    }
}
