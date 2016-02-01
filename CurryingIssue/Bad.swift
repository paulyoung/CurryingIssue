import Argo
import Foundation

public struct Bad {
    public let createdAt: NSDate?
    public let updatedAt: NSDate?
    
    public init(createdAt: NSDate? = .None, updatedAt: NSDate? = .None) {
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension Bad: Decodable {
    static func create(createdAt: NSDate?) -> (updatedAt: NSDate?) -> Bad {
        return { updatedAt in
            return Bad(createdAt: createdAt, updatedAt: updatedAt)
        }
    }
    
    public static func decode(json: JSON) -> Decoded<Bad> {
        let createdAt = Decoded.Success(NSDate())
        let updatedAt = Decoded.Success(NSDate())
        
        let f = Bad.create
            <^> createdAt
        return f
            <*> updatedAt
    }
}
