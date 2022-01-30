//
//  File.swift
//  
//
//  Created by Михаил on 30.01.2022.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor

final class User: Model, Content {
    
    static let schema = "newtgbotdb"
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "userid")
    var userid: Int
    
    init() {}
    
    init(id: UUID? = nil, userId: Int){
        self.userid = userId
        
    }
}
