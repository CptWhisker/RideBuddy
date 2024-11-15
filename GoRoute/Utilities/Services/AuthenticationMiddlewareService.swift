//
//  AutenticationMiddlewareService.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 15.11.2024.
//

import Foundation
import HTTPTypes
import OpenAPIRuntime

struct AuthenticationMiddlewareService {
    
    // MARK: Properties
    private let apiKey: String
    
    // MARK: Initialization
    init(authorizationHeaderValue apiKey: String) {
        self.apiKey = apiKey
    }
}

// MARK: - ClientMiddleware
extension AuthenticationMiddlewareService: ClientMiddleware {
    
    func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        var request = request
        
        request.headerFields[.authorization] = apiKey
        return try await next(request, body, baseURL)
    }
}
