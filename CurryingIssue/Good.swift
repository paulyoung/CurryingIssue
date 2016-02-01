import Argo
import Foundation

public struct Good {
    public let createdAt: NSDate?
    public let updatedAt: NSDate?
    
    public init(createdAt: NSDate? = .None, updatedAt: NSDate? = .None) {
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension Good: Decodable {
    static func create(createdAt: NSDate?) -> (updatedAt: NSDate?) -> Good {
        return { updatedAt in
            return Good(createdAt: createdAt, updatedAt: updatedAt)
        }
    }
    
    public static func decode(json: JSON) -> Decoded<Good> {
        let createdAt = Decoded.Success(NSDate())
        let updatedAt = Decoded.Success(NSDate())
        
        return Good.create
            <^> createdAt
            <*> updatedAt
    }
}
