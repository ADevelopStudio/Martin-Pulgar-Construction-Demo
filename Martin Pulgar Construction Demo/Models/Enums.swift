//
//  Enums.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import Foundation

enum ApiResult {
    case success
    case error(Error)
}

extension ApiResult {
    var imageName: String {
        switch self {
        case .success:
            return "externaldrive.badge.checkmark"
        case .error:
            return "exclamationmark.circle"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "Success"
        case .error(let error):
            return error.localizedDescription
        }
    }
}


enum OptionPickerType {
    case area
    case taskCategory
    case event
}

extension OptionPickerType {
    var placeholder: String {
        switch self {
        case .area:
            return "Select Area"
        case .taskCategory:
            return "Task Category"
        case .event:
            return "Select an event"
        }
    }
    
    var options: [String] {
        switch self {
        case .area:
            return (1...10).map{"Area \($0)"}
        case .taskCategory:
            return (1...10).map{"Task \($0)"}
        case .event:
            return (1...10).map{"Event \($0)"}
        }
    }
}


enum MPButtonState {
    case normal(String)
    case loading(String)
}

extension MPButtonState {
    var titleText: String {
        switch self {
        case .normal(let string):
            return string
        case .loading(let string):
            return string
        }
    }
    var isLoadingNeeded: Bool {
        switch self {
        case .normal:
            return false
        case .loading:
            return true
        }
    }
}
