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

struct FirstNotify: VaporCronSchedulable {
    static var expression: String { "0 8 * * *" }
    
    static func task(on application: Application) -> EventLoopFuture<Void> {
        application.db.query(User.self).all().map { users in
            for user in users {
                let params: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Яна, доброе утро! Сейчас нужно принять: Венлафаксин 0,75 \n Витамины для волос")
                do {
                    try TGBot.shared.sendMessage(params: params)
                } catch {
                    
                }
            }
        }
        
    }
}

struct SecondNotify: VaporCronSchedulable {
    static var expression: String { "0 11 * * *" }
    
    static func task(on application: Application) -> EventLoopFuture<Void> {
        application.db.query(User.self).all().map { users in
            for user in users {
                let params: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Как себя чувствуешь? Сейчас нужно принять: Венлафаксин 0,75 \n Амитриптилин 0,25")
                do {
                    try TGBot.shared.sendMessage(params: params)
                } catch {
                    
                }
            }
        }
        
    }
}

struct ThirdNotify: VaporCronSchedulable {
    static var expression: String { "0 19 * * *" }
    
    static func task(on application: Application) -> EventLoopFuture<Void> {
        application.db.query(User.self).all().map { users in
            for user in users {
                let params: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Скоро спать! Сейчас нужно принять: Карбомазепин 200 \n Амитриптилин 0,25 \n Кветиапин 100 \n Витамины для волос")
                do {
                    try TGBot.shared.sendMessage(params: params)
                } catch {
                    
                }
            }
        }
        
    }
}


