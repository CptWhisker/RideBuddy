//
//  JSONDecoder+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 14.11.2024.
//

import Foundation
import OpenAPIRuntime

extension  JSONDecoder {
    func decode<T: Decodable>(from httpBody: HTTPBody, to type: T.Type, upTo maxBytes: Int = 100 * 1024 * 1024) async throws -> T {
        let data = try await Data(collecting: httpBody, upTo: maxBytes)
        return try self.decode(T.self, from: data)
    }
}
