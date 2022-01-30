//
//  File.swift
//  
//
//  Created by Михаил on 30.01.2022.
//

import Foundation

import Foundation
import VaporCron
import Vapor
import telegram_vapor_bot

struct Notify: VaporCronSchedulable {
    static var expression: String { "* * * * *" }
    
    static func task(on application: Application) -> EventLoopFuture<Void> {
        application.db.query(User.self).all().map { users in
            for user in users {
                let params: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "выпей бля таблы")
                do {
                    try TGBot.shared.sendMessage(params: params)
                } catch {
                    
                }
            }
        }
        
    }
}

