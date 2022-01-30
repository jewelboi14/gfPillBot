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
    
    let complexJob = try app.cron.schedule(Notify.self)
        /// This example code will cancel scheduled job after 120 seconds
        /// so in a console you'll see "Closure fired" three times only
        app.eventLoopGroup.next().scheduleTask(in: .seconds(120)) {
            complexJob.cancel()
        }
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
//    app.http.server.configuration.hostname = "0.0.0.0"
//    app.http.server.configuration.port = 80
   
    
    app.databases.use(.postgres(hostname: "localhost", username: "mihail", password: "", database: "newtgbotdb"), as: .psql)
    
    app.migrations.add(CreateUser())
    
    let tgApi: String = "5103282669:AAEfimU19Tf7qSQJggNVH1g2QiJechuEJiI"
    let connection: TGConnectionPrtcl = TGLongPollingConnection()
    TGBot.configure(connection: connection, botId: tgApi, vaporClient: app.client)
    try TGBot.shared.start()
    TGBot.log.logLevel = .error
    DefaultBotHandlers.addHandlers(app: app, bot: TGBot.shared)
    
    try routes(app)
    
}
