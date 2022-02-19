//
//  File.swift
//  
//
//  Created by Михаил on 19.02.2022.
//

import Foundation
import Vapor
import CloudKit

class Decoder {
    
    static func decodeCats(app: Application) throws -> EventLoopFuture<String> {
        let uri: URI = URI(string: "https://api.thecatapi.com/v1/images/search")
        return app.client.get(uri).flatMapThrowing { response in
            guard response.status == .ok else { throw Abort(.unauthorized) }
            guard let buffer = response.body else { throw Abort(.badRequest) }
            guard let data = String(buffer: buffer).data(using: .utf8) else { throw Abort(.badRequest) }
            print("buffer \(buffer)")
            print("buffer \(response)")
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let decoded = try decoder.decode([Cat].self, from: data)
                return decoded[0].url
                
            } catch {
                print("bad request")
                throw Abort(.badRequest)
            }
        }
    }
}


