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

// https://api.thecatapi.com/v1/images/search

struct FirstCatNotification: VaporCronSchedulable {
    
    static var expression: String { "0 9 * * *" }
    
    static func task(on application: Application) -> EventLoopFuture<Void> {
        application.db.query(User.self).all().map { users in
            for user in users {
                do {
                    let decodedUrl = try Decoder.decodeCats(app: application).wait()
                    let photoParams: TGSendPhotoParams = .init(chatId: .chat(Int64(user.userid)), photo: .url(decodedUrl) )
                    let messageParams: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Добрый день! Вот ваша первая киса дня!")
                    do {
                        try TGBot.shared.sendPhoto(params: photoParams)
                        try TGBot.shared.sendMessage(params: messageParams)
                    } catch {
                        
                    }
                } catch {
                    
                }
                
            }
        }
        
        
    }
}

struct SecondCatNotification: VaporCronSchedulable {
    
    static var expression: String { "0 17 * * *" }
    
    static func task(on application: Application) -> EventLoopFuture<Void> {
        application.db.query(User.self).all().map { users in
            for user in users {
                do {
                    let decodedUrl = try Decoder.decodeCats(app: application).wait()
                    let photoParams: TGSendPhotoParams = .init(chatId: .chat(Int64(user.userid)), photo: .url(decodedUrl) )
                    let messageParams: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Уже вечер??? Вот ваша вторая киса дня!")
                    do {
                        try TGBot.shared.sendPhoto(params: photoParams)
                        try TGBot.shared.sendMessage(params: messageParams)
                    } catch {
                        
                    }
                } catch {
                    
                }
                
            }
        }
        
        
    }
}

struct ThirdCatNotification: VaporCronSchedulable {
    
    static var expression: String { "12 21 * * *" }
    
    static func task(on application: Application) -> EventLoopFuture<Void> {
        application.db.query(User.self).all().map { users in
            for user in users {
                do {
                    let decodedUrl = try Decoder.decodeCats(app: application).wait()
                    let photoParams: TGSendPhotoParams = .init(chatId: .chat(Int64(user.userid)), photo: .url(decodedUrl) )
                    let messageParams: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Пора спать!!!!!!!! Последняя киса на сегодня (напоминаю что ты самая лучшая кисуля)!")
                    do {
                        try TGBot.shared.sendPhoto(params: photoParams)
                        try TGBot.shared.sendMessage(params: messageParams)
                    } catch {
                        
                    }
                } catch {
                    
                }
                
            }
        }
        
        
    }
}


struct FirstNotify: VaporCronSchedulable {
    static var expression: String { "0 8 * * *" }
    
    static func task(on application: Application) -> EventLoopFuture<Void> {
        application.db.query(User.self).all().map { users in
            for user in users {
                let params: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Яна, доброе утро! Сейчас нужно принять: Венлафаксин 0,75\nВитамины для волос")
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
                let params: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Как себя чувствуешь? Сейчас нужно принять: Венлафаксин 0,75\nАмитриптилин 0,25")
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
                let params: TGSendMessageParams = .init(chatId: .chat(Int64(user.userid)), text: "Скоро спать! Сейчас нужно принять: Карбомазепин 200\nАмитриптилин 0,25\nКветиапин 100\nВитамины для волос")
                do {
                    try TGBot.shared.sendMessage(params: params)
                } catch {
                    
                }
            }
        }
        
    }
}


