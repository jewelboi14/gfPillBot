import Vapor
import telegram_vapor_bot
import VaporCron
import Fluent
import FluentPostgresDriver

extension Application {
    static let databaseUrl = URL(string: Environment.get("DB_URL")!)!
}

// configures your application
public func configure(_ app: Application) throws {
    
    let firstJob = try app.cron.schedule(FirstNotify.self)
    let secondJob = try app.cron.schedule(SecondNotify.self)
    let thirdJob = try app.cron.schedule(ThirdNotify.self)
    let firstCatJob = try app.cron.schedule(FirstCatNotification.self)
    let secondCatJob = try app.cron.schedule(SecondCatNotification.self)
    let thirdCatJob = try app.cron.schedule(ThirdCatNotification.self)
    
    app.eventLoopGroup.next().scheduleTask(in: .hours(2000)) {
        firstJob.cancel()
        secondJob.cancel()
        thirdJob.cancel()
        firstCatJob.cancel()
        secondCatJob.cancel()
        thirdCatJob.cancel()
    }
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
//    app.http.server.configuration.hostname = "0.0.0.0"
//    app.http.server.configuration.port = 80
    
    func routes(_ app: Application) throws {
        
    }
    
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "newPassword", database: "newtgbotdb"), as: .psql)
    
    app.migrations.add(CreateUser())
    
    
    
    let tgApi: String = "5103282669:AAEfimU19Tf7qSQJggNVH1g2QiJechuEJiI"
    let connection: TGConnectionPrtcl = TGLongPollingConnection()
    TGBot.configure(connection: connection, botId: tgApi, vaporClient: app.client)
    try TGBot.shared.start()
    TGBot.log.logLevel = .error
    DefaultBotHandlers.addHandlers(app: app, bot: TGBot.shared)
    
    try routes(app)
    
}
