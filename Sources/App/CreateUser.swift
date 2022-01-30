import Foundation
import Fluent
import FluentPostgresDriver

struct CreateUser: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("newtgbotdb")
            .id()
            .field("userid", .int64)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("newtgbotdb").delete()
    }
}
