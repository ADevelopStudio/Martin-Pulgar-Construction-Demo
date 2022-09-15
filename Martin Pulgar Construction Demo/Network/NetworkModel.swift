//
//  NetworkModel.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import Foundation

final class NetworkModel {
    enum ServiceError: Error, LocalizedError {
        case generalFailure
        case invalidStatus
        case invalidUrl
        case invalidParameters
        
        var errorDescription: String? {
            switch self {
            case .invalidStatus:
                return "Nothing found"
            case .generalFailure:
                return "Something went wrong"
            case .invalidUrl:
                return "Invalid Url"
            case .invalidParameters:
                return "Invalid data to send"
            }
        }
    }
    
    private let baseUrl = URL(string: "https://reqres.in")!
    
    fileprivate func fetch<T: Decodable>(request: URLRequest) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
    
    fileprivate func send(request: URLRequest) async throws -> RestResult {
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(RestResult.self, from: data)
    }
    
    func post(_ codable: Codable) async throws -> RestResult {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        guard let jsonBody = try? encoder.encode(codable) else {
            throw ServiceError.invalidParameters
        }
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try await self.send(request: request)
    }
}


//FAKING for tesing purposes
extension NetworkModel {
    func postFake(_ codable: Codable) async throws -> FakeDataToRecieve {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
       
        guard let jsonBody = try? encoder.encode(FakeDataToSend.example) else {
            throw ServiceError.invalidParameters
        }
        
        var request = URLRequest(url: baseUrl.appendingPathComponent("/api/users"))
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(FakeDataToRecieve.self, from: data)
    }

}
