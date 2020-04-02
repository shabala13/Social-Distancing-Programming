//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateItemInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, name: String, searchCount: Int) {
    graphQLMap = ["id": id, "name": name, "searchCount": searchCount]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var searchCount: Int {
    get {
      return graphQLMap["searchCount"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "searchCount")
    }
  }
}

public struct ModelItemConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(name: ModelStringInput? = nil, searchCount: ModelIntInput? = nil, and: [ModelItemConditionInput?]? = nil, or: [ModelItemConditionInput?]? = nil, not: ModelItemConditionInput? = nil) {
    graphQLMap = ["name": name, "searchCount": searchCount, "and": and, "or": or, "not": not]
  }

  public var name: ModelStringInput? {
    get {
      return graphQLMap["name"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var searchCount: ModelIntInput? {
    get {
      return graphQLMap["searchCount"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "searchCount")
    }
  }

  public var and: [ModelItemConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelItemConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelItemConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelItemConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelItemConditionInput? {
    get {
      return graphQLMap["not"] as! ModelItemConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelStringInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public enum ModelAttributeTypes: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case binary
  case binarySet
  case bool
  case list
  case map
  case number
  case numberSet
  case string
  case stringSet
  case null
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "binary": self = .binary
      case "binarySet": self = .binarySet
      case "bool": self = .bool
      case "list": self = .list
      case "map": self = .map
      case "number": self = .number
      case "numberSet": self = .numberSet
      case "string": self = .string
      case "stringSet": self = .stringSet
      case "_null": self = .null
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .binary: return "binary"
      case .binarySet: return "binarySet"
      case .bool: return "bool"
      case .list: return "list"
      case .map: return "map"
      case .number: return "number"
      case .numberSet: return "numberSet"
      case .string: return "string"
      case .stringSet: return "stringSet"
      case .null: return "_null"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelAttributeTypes, rhs: ModelAttributeTypes) -> Bool {
    switch (lhs, rhs) {
      case (.binary, .binary): return true
      case (.binarySet, .binarySet): return true
      case (.bool, .bool): return true
      case (.list, .list): return true
      case (.map, .map): return true
      case (.number, .number): return true
      case (.numberSet, .numberSet): return true
      case (.string, .string): return true
      case (.stringSet, .stringSet): return true
      case (.null, .null): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelSizeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public struct ModelIntInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdateItemInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, name: String? = nil, searchCount: Int? = nil) {
    graphQLMap = ["id": id, "name": name, "searchCount": searchCount]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var searchCount: Int? {
    get {
      return graphQLMap["searchCount"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "searchCount")
    }
  }
}

public struct DeleteItemInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateEntryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
    graphQLMap = ["price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes]
  }

  public var price: Double {
    get {
      return graphQLMap["price"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  public var pictures: String {
    get {
      return graphQLMap["pictures"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pictures")
    }
  }

  public var location: String {
    get {
      return graphQLMap["location"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var timestamp: String {
    get {
      return graphQLMap["timestamp"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "timestamp")
    }
  }

  public var notes: String? {
    get {
      return graphQLMap["notes"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notes")
    }
  }
}

public struct ModelEntryConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(price: ModelFloatInput? = nil, pictures: ModelStringInput? = nil, location: ModelStringInput? = nil, timestamp: ModelStringInput? = nil, notes: ModelStringInput? = nil, and: [ModelEntryConditionInput?]? = nil, or: [ModelEntryConditionInput?]? = nil, not: ModelEntryConditionInput? = nil) {
    graphQLMap = ["price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes, "and": and, "or": or, "not": not]
  }

  public var price: ModelFloatInput? {
    get {
      return graphQLMap["price"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  public var pictures: ModelStringInput? {
    get {
      return graphQLMap["pictures"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pictures")
    }
  }

  public var location: ModelStringInput? {
    get {
      return graphQLMap["location"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var timestamp: ModelStringInput? {
    get {
      return graphQLMap["timestamp"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "timestamp")
    }
  }

  public var notes: ModelStringInput? {
    get {
      return graphQLMap["notes"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notes")
    }
  }

  public var and: [ModelEntryConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelEntryConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelEntryConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelEntryConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelEntryConditionInput? {
    get {
      return graphQLMap["not"] as! ModelEntryConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelFloatInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Double? = nil, eq: Double? = nil, le: Double? = nil, lt: Double? = nil, ge: Double? = nil, gt: Double? = nil, between: [Double?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Double? {
    get {
      return graphQLMap["ne"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Double? {
    get {
      return graphQLMap["eq"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Double? {
    get {
      return graphQLMap["le"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Double? {
    get {
      return graphQLMap["lt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Double? {
    get {
      return graphQLMap["ge"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Double? {
    get {
      return graphQLMap["gt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Double?]? {
    get {
      return graphQLMap["between"] as! [Double?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdateEntryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(price: Double? = nil, pictures: String? = nil, location: String? = nil, timestamp: String? = nil, notes: String? = nil) {
    graphQLMap = ["price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes]
  }

  public var price: Double? {
    get {
      return graphQLMap["price"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  public var pictures: String? {
    get {
      return graphQLMap["pictures"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pictures")
    }
  }

  public var location: String? {
    get {
      return graphQLMap["location"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var timestamp: String? {
    get {
      return graphQLMap["timestamp"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "timestamp")
    }
  }

  public var notes: String? {
    get {
      return graphQLMap["notes"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notes")
    }
  }
}

public struct DeleteEntryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, points: Int, levelName: String) {
    graphQLMap = ["id": id, "points": points, "levelName": levelName]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var points: Int {
    get {
      return graphQLMap["points"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var levelName: String {
    get {
      return graphQLMap["levelName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "levelName")
    }
  }
}

public struct ModelUserConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(points: ModelIntInput? = nil, levelName: ModelStringInput? = nil, and: [ModelUserConditionInput?]? = nil, or: [ModelUserConditionInput?]? = nil, not: ModelUserConditionInput? = nil) {
    graphQLMap = ["points": points, "levelName": levelName, "and": and, "or": or, "not": not]
  }

  public var points: ModelIntInput? {
    get {
      return graphQLMap["points"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var levelName: ModelStringInput? {
    get {
      return graphQLMap["levelName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "levelName")
    }
  }

  public var and: [ModelUserConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserConditionInput? {
    get {
      return graphQLMap["not"] as! ModelUserConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct UpdateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, points: Int? = nil, levelName: String? = nil) {
    graphQLMap = ["id": id, "points": points, "levelName": levelName]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var points: Int? {
    get {
      return graphQLMap["points"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var levelName: String? {
    get {
      return graphQLMap["levelName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "levelName")
    }
  }
}

public struct DeleteUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateRequestHistoryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(itemNames: String) {
    graphQLMap = ["itemNames": itemNames]
  }

  public var itemNames: String {
    get {
      return graphQLMap["itemNames"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "itemNames")
    }
  }
}

public struct ModelRequestHistoryConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(itemNames: ModelStringInput? = nil, and: [ModelRequestHistoryConditionInput?]? = nil, or: [ModelRequestHistoryConditionInput?]? = nil, not: ModelRequestHistoryConditionInput? = nil) {
    graphQLMap = ["itemNames": itemNames, "and": and, "or": or, "not": not]
  }

  public var itemNames: ModelStringInput? {
    get {
      return graphQLMap["itemNames"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "itemNames")
    }
  }

  public var and: [ModelRequestHistoryConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelRequestHistoryConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelRequestHistoryConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelRequestHistoryConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelRequestHistoryConditionInput? {
    get {
      return graphQLMap["not"] as! ModelRequestHistoryConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct UpdateRequestHistoryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(itemNames: String? = nil) {
    graphQLMap = ["itemNames": itemNames]
  }

  public var itemNames: String? {
    get {
      return graphQLMap["itemNames"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "itemNames")
    }
  }
}

public struct DeleteRequestHistoryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelItemFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, name: ModelStringInput? = nil, searchCount: ModelIntInput? = nil, and: [ModelItemFilterInput?]? = nil, or: [ModelItemFilterInput?]? = nil, not: ModelItemFilterInput? = nil) {
    graphQLMap = ["id": id, "name": name, "searchCount": searchCount, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: ModelStringInput? {
    get {
      return graphQLMap["name"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var searchCount: ModelIntInput? {
    get {
      return graphQLMap["searchCount"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "searchCount")
    }
  }

  public var and: [ModelItemFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelItemFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelItemFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelItemFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelItemFilterInput? {
    get {
      return graphQLMap["not"] as! ModelItemFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public struct ModelEntryFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(price: ModelFloatInput? = nil, pictures: ModelStringInput? = nil, location: ModelStringInput? = nil, timestamp: ModelStringInput? = nil, notes: ModelStringInput? = nil, and: [ModelEntryFilterInput?]? = nil, or: [ModelEntryFilterInput?]? = nil, not: ModelEntryFilterInput? = nil) {
    graphQLMap = ["price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes, "and": and, "or": or, "not": not]
  }

  public var price: ModelFloatInput? {
    get {
      return graphQLMap["price"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  public var pictures: ModelStringInput? {
    get {
      return graphQLMap["pictures"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pictures")
    }
  }

  public var location: ModelStringInput? {
    get {
      return graphQLMap["location"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var timestamp: ModelStringInput? {
    get {
      return graphQLMap["timestamp"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "timestamp")
    }
  }

  public var notes: ModelStringInput? {
    get {
      return graphQLMap["notes"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notes")
    }
  }

  public var and: [ModelEntryFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelEntryFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelEntryFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelEntryFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelEntryFilterInput? {
    get {
      return graphQLMap["not"] as! ModelEntryFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelUserFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, points: ModelIntInput? = nil, levelName: ModelStringInput? = nil, and: [ModelUserFilterInput?]? = nil, or: [ModelUserFilterInput?]? = nil, not: ModelUserFilterInput? = nil) {
    graphQLMap = ["id": id, "points": points, "levelName": levelName, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var points: ModelIntInput? {
    get {
      return graphQLMap["points"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var levelName: ModelStringInput? {
    get {
      return graphQLMap["levelName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "levelName")
    }
  }

  public var and: [ModelUserFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserFilterInput? {
    get {
      return graphQLMap["not"] as! ModelUserFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelRequestHistoryFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(itemNames: ModelStringInput? = nil, and: [ModelRequestHistoryFilterInput?]? = nil, or: [ModelRequestHistoryFilterInput?]? = nil, not: ModelRequestHistoryFilterInput? = nil) {
    graphQLMap = ["itemNames": itemNames, "and": and, "or": or, "not": not]
  }

  public var itemNames: ModelStringInput? {
    get {
      return graphQLMap["itemNames"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "itemNames")
    }
  }

  public var and: [ModelRequestHistoryFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelRequestHistoryFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelRequestHistoryFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelRequestHistoryFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelRequestHistoryFilterInput? {
    get {
      return graphQLMap["not"] as! ModelRequestHistoryFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public final class CreateItemMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateItem($input: CreateItemInput!, $condition: ModelItemConditionInput) {\n  createItem(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    searchCount\n    entry {\n      __typename\n      price\n      pictures\n      location\n      timestamp\n      notes\n    }\n  }\n}"

  public var input: CreateItemInput
  public var condition: ModelItemConditionInput?

  public init(input: CreateItemInput, condition: ModelItemConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createItem", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createItem: CreateItem? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createItem": createItem.flatMap { $0.snapshot }])
    }

    public var createItem: CreateItem? {
      get {
        return (snapshot["createItem"] as? Snapshot).flatMap { CreateItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createItem")
      }
    }

    public struct CreateItem: GraphQLSelectionSet {
      public static let possibleTypes = ["Item"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("searchCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("entry", type: .list(.nonNull(.object(Entry.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, searchCount: Int, entry: [Entry]? = nil) {
        self.init(snapshot: ["__typename": "Item", "id": id, "name": name, "searchCount": searchCount, "entry": entry.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var searchCount: Int {
        get {
          return snapshot["searchCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "searchCount")
        }
      }

      public var entry: [Entry]? {
        get {
          return (snapshot["entry"] as? [Snapshot]).flatMap { $0.map { Entry(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "entry")
        }
      }

      public struct Entry: GraphQLSelectionSet {
        public static let possibleTypes = ["Entry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
          self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var price: Double {
          get {
            return snapshot["price"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var pictures: String {
          get {
            return snapshot["pictures"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pictures")
          }
        }

        public var location: String {
          get {
            return snapshot["location"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        public var notes: String? {
          get {
            return snapshot["notes"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "notes")
          }
        }
      }
    }
  }
}

public final class UpdateItemMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateItem($input: UpdateItemInput!, $condition: ModelItemConditionInput) {\n  updateItem(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    searchCount\n    entry {\n      __typename\n      price\n      pictures\n      location\n      timestamp\n      notes\n    }\n  }\n}"

  public var input: UpdateItemInput
  public var condition: ModelItemConditionInput?

  public init(input: UpdateItemInput, condition: ModelItemConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateItem", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateItem: UpdateItem? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateItem": updateItem.flatMap { $0.snapshot }])
    }

    public var updateItem: UpdateItem? {
      get {
        return (snapshot["updateItem"] as? Snapshot).flatMap { UpdateItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateItem")
      }
    }

    public struct UpdateItem: GraphQLSelectionSet {
      public static let possibleTypes = ["Item"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("searchCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("entry", type: .list(.nonNull(.object(Entry.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, searchCount: Int, entry: [Entry]? = nil) {
        self.init(snapshot: ["__typename": "Item", "id": id, "name": name, "searchCount": searchCount, "entry": entry.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var searchCount: Int {
        get {
          return snapshot["searchCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "searchCount")
        }
      }

      public var entry: [Entry]? {
        get {
          return (snapshot["entry"] as? [Snapshot]).flatMap { $0.map { Entry(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "entry")
        }
      }

      public struct Entry: GraphQLSelectionSet {
        public static let possibleTypes = ["Entry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
          self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var price: Double {
          get {
            return snapshot["price"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var pictures: String {
          get {
            return snapshot["pictures"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pictures")
          }
        }

        public var location: String {
          get {
            return snapshot["location"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        public var notes: String? {
          get {
            return snapshot["notes"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "notes")
          }
        }
      }
    }
  }
}

public final class DeleteItemMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteItem($input: DeleteItemInput!, $condition: ModelItemConditionInput) {\n  deleteItem(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    searchCount\n    entry {\n      __typename\n      price\n      pictures\n      location\n      timestamp\n      notes\n    }\n  }\n}"

  public var input: DeleteItemInput
  public var condition: ModelItemConditionInput?

  public init(input: DeleteItemInput, condition: ModelItemConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteItem", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteItem: DeleteItem? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteItem": deleteItem.flatMap { $0.snapshot }])
    }

    public var deleteItem: DeleteItem? {
      get {
        return (snapshot["deleteItem"] as? Snapshot).flatMap { DeleteItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteItem")
      }
    }

    public struct DeleteItem: GraphQLSelectionSet {
      public static let possibleTypes = ["Item"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("searchCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("entry", type: .list(.nonNull(.object(Entry.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, searchCount: Int, entry: [Entry]? = nil) {
        self.init(snapshot: ["__typename": "Item", "id": id, "name": name, "searchCount": searchCount, "entry": entry.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var searchCount: Int {
        get {
          return snapshot["searchCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "searchCount")
        }
      }

      public var entry: [Entry]? {
        get {
          return (snapshot["entry"] as? [Snapshot]).flatMap { $0.map { Entry(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "entry")
        }
      }

      public struct Entry: GraphQLSelectionSet {
        public static let possibleTypes = ["Entry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
          self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var price: Double {
          get {
            return snapshot["price"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var pictures: String {
          get {
            return snapshot["pictures"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pictures")
          }
        }

        public var location: String {
          get {
            return snapshot["location"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        public var notes: String? {
          get {
            return snapshot["notes"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "notes")
          }
        }
      }
    }
  }
}

public final class CreateEntryMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateEntry($input: CreateEntryInput!, $condition: ModelEntryConditionInput) {\n  createEntry(input: $input, condition: $condition) {\n    __typename\n    price\n    pictures\n    location\n    timestamp\n    notes\n  }\n}"

  public var input: CreateEntryInput
  public var condition: ModelEntryConditionInput?

  public init(input: CreateEntryInput, condition: ModelEntryConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createEntry", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateEntry.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createEntry: CreateEntry? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createEntry": createEntry.flatMap { $0.snapshot }])
    }

    public var createEntry: CreateEntry? {
      get {
        return (snapshot["createEntry"] as? Snapshot).flatMap { CreateEntry(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createEntry")
      }
    }

    public struct CreateEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["Entry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("price", type: .nonNull(.scalar(Double.self))),
        GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("notes", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
        self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var price: Double {
        get {
          return snapshot["price"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "price")
        }
      }

      public var pictures: String {
        get {
          return snapshot["pictures"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pictures")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      public var notes: String? {
        get {
          return snapshot["notes"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "notes")
        }
      }
    }
  }
}

public final class UpdateEntryMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateEntry($input: UpdateEntryInput!, $condition: ModelEntryConditionInput) {\n  updateEntry(input: $input, condition: $condition) {\n    __typename\n    price\n    pictures\n    location\n    timestamp\n    notes\n  }\n}"

  public var input: UpdateEntryInput
  public var condition: ModelEntryConditionInput?

  public init(input: UpdateEntryInput, condition: ModelEntryConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateEntry", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateEntry.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateEntry: UpdateEntry? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateEntry": updateEntry.flatMap { $0.snapshot }])
    }

    public var updateEntry: UpdateEntry? {
      get {
        return (snapshot["updateEntry"] as? Snapshot).flatMap { UpdateEntry(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateEntry")
      }
    }

    public struct UpdateEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["Entry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("price", type: .nonNull(.scalar(Double.self))),
        GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("notes", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
        self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var price: Double {
        get {
          return snapshot["price"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "price")
        }
      }

      public var pictures: String {
        get {
          return snapshot["pictures"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pictures")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      public var notes: String? {
        get {
          return snapshot["notes"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "notes")
        }
      }
    }
  }
}

public final class DeleteEntryMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteEntry($input: DeleteEntryInput!, $condition: ModelEntryConditionInput) {\n  deleteEntry(input: $input, condition: $condition) {\n    __typename\n    price\n    pictures\n    location\n    timestamp\n    notes\n  }\n}"

  public var input: DeleteEntryInput
  public var condition: ModelEntryConditionInput?

  public init(input: DeleteEntryInput, condition: ModelEntryConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteEntry", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteEntry.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteEntry: DeleteEntry? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteEntry": deleteEntry.flatMap { $0.snapshot }])
    }

    public var deleteEntry: DeleteEntry? {
      get {
        return (snapshot["deleteEntry"] as? Snapshot).flatMap { DeleteEntry(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteEntry")
      }
    }

    public struct DeleteEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["Entry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("price", type: .nonNull(.scalar(Double.self))),
        GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("notes", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
        self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var price: Double {
        get {
          return snapshot["price"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "price")
        }
      }

      public var pictures: String {
        get {
          return snapshot["pictures"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pictures")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      public var notes: String? {
        get {
          return snapshot["notes"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "notes")
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUser($input: CreateUserInput!, $condition: ModelUserConditionInput) {\n  createUser(input: $input, condition: $condition) {\n    __typename\n    id\n    points\n    levelName\n    requestHistory {\n      __typename\n      itemNames\n    }\n  }\n}"

  public var input: CreateUserInput
  public var condition: ModelUserConditionInput?

  public init(input: CreateUserInput, condition: ModelUserConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUser: CreateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUser": createUser.flatMap { $0.snapshot }])
    }

    public var createUser: CreateUser? {
      get {
        return (snapshot["createUser"] as? Snapshot).flatMap { CreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("levelName", type: .nonNull(.scalar(String.self))),
        GraphQLField("requestHistory", type: .list(.nonNull(.object(RequestHistory.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, points: Int, levelName: String, requestHistory: [RequestHistory]? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "points": points, "levelName": levelName, "requestHistory": requestHistory.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var levelName: String {
        get {
          return snapshot["levelName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "levelName")
        }
      }

      public var requestHistory: [RequestHistory]? {
        get {
          return (snapshot["requestHistory"] as? [Snapshot]).flatMap { $0.map { RequestHistory(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "requestHistory")
        }
      }

      public struct RequestHistory: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestHistory"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(itemNames: String) {
          self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var itemNames: String {
          get {
            return snapshot["itemNames"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "itemNames")
          }
        }
      }
    }
  }
}

public final class UpdateUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUser($input: UpdateUserInput!, $condition: ModelUserConditionInput) {\n  updateUser(input: $input, condition: $condition) {\n    __typename\n    id\n    points\n    levelName\n    requestHistory {\n      __typename\n      itemNames\n    }\n  }\n}"

  public var input: UpdateUserInput
  public var condition: ModelUserConditionInput?

  public init(input: UpdateUserInput, condition: ModelUserConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUser": updateUser.flatMap { $0.snapshot }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (snapshot["updateUser"] as? Snapshot).flatMap { UpdateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("levelName", type: .nonNull(.scalar(String.self))),
        GraphQLField("requestHistory", type: .list(.nonNull(.object(RequestHistory.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, points: Int, levelName: String, requestHistory: [RequestHistory]? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "points": points, "levelName": levelName, "requestHistory": requestHistory.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var levelName: String {
        get {
          return snapshot["levelName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "levelName")
        }
      }

      public var requestHistory: [RequestHistory]? {
        get {
          return (snapshot["requestHistory"] as? [Snapshot]).flatMap { $0.map { RequestHistory(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "requestHistory")
        }
      }

      public struct RequestHistory: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestHistory"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(itemNames: String) {
          self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var itemNames: String {
          get {
            return snapshot["itemNames"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "itemNames")
          }
        }
      }
    }
  }
}

public final class DeleteUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUser($input: DeleteUserInput!, $condition: ModelUserConditionInput) {\n  deleteUser(input: $input, condition: $condition) {\n    __typename\n    id\n    points\n    levelName\n    requestHistory {\n      __typename\n      itemNames\n    }\n  }\n}"

  public var input: DeleteUserInput
  public var condition: ModelUserConditionInput?

  public init(input: DeleteUserInput, condition: ModelUserConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUser", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUser: DeleteUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUser": deleteUser.flatMap { $0.snapshot }])
    }

    public var deleteUser: DeleteUser? {
      get {
        return (snapshot["deleteUser"] as? Snapshot).flatMap { DeleteUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUser")
      }
    }

    public struct DeleteUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("levelName", type: .nonNull(.scalar(String.self))),
        GraphQLField("requestHistory", type: .list(.nonNull(.object(RequestHistory.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, points: Int, levelName: String, requestHistory: [RequestHistory]? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "points": points, "levelName": levelName, "requestHistory": requestHistory.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var levelName: String {
        get {
          return snapshot["levelName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "levelName")
        }
      }

      public var requestHistory: [RequestHistory]? {
        get {
          return (snapshot["requestHistory"] as? [Snapshot]).flatMap { $0.map { RequestHistory(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "requestHistory")
        }
      }

      public struct RequestHistory: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestHistory"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(itemNames: String) {
          self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var itemNames: String {
          get {
            return snapshot["itemNames"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "itemNames")
          }
        }
      }
    }
  }
}

public final class CreateRequestHistoryMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateRequestHistory($input: CreateRequestHistoryInput!, $condition: ModelRequestHistoryConditionInput) {\n  createRequestHistory(input: $input, condition: $condition) {\n    __typename\n    itemNames\n  }\n}"

  public var input: CreateRequestHistoryInput
  public var condition: ModelRequestHistoryConditionInput?

  public init(input: CreateRequestHistoryInput, condition: ModelRequestHistoryConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createRequestHistory", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateRequestHistory.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createRequestHistory: CreateRequestHistory? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createRequestHistory": createRequestHistory.flatMap { $0.snapshot }])
    }

    public var createRequestHistory: CreateRequestHistory? {
      get {
        return (snapshot["createRequestHistory"] as? Snapshot).flatMap { CreateRequestHistory(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createRequestHistory")
      }
    }

    public struct CreateRequestHistory: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestHistory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemNames: String) {
        self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemNames: String {
        get {
          return snapshot["itemNames"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "itemNames")
        }
      }
    }
  }
}

public final class UpdateRequestHistoryMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateRequestHistory($input: UpdateRequestHistoryInput!, $condition: ModelRequestHistoryConditionInput) {\n  updateRequestHistory(input: $input, condition: $condition) {\n    __typename\n    itemNames\n  }\n}"

  public var input: UpdateRequestHistoryInput
  public var condition: ModelRequestHistoryConditionInput?

  public init(input: UpdateRequestHistoryInput, condition: ModelRequestHistoryConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateRequestHistory", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateRequestHistory.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateRequestHistory: UpdateRequestHistory? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateRequestHistory": updateRequestHistory.flatMap { $0.snapshot }])
    }

    public var updateRequestHistory: UpdateRequestHistory? {
      get {
        return (snapshot["updateRequestHistory"] as? Snapshot).flatMap { UpdateRequestHistory(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateRequestHistory")
      }
    }

    public struct UpdateRequestHistory: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestHistory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemNames: String) {
        self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemNames: String {
        get {
          return snapshot["itemNames"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "itemNames")
        }
      }
    }
  }
}

public final class DeleteRequestHistoryMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteRequestHistory($input: DeleteRequestHistoryInput!, $condition: ModelRequestHistoryConditionInput) {\n  deleteRequestHistory(input: $input, condition: $condition) {\n    __typename\n    itemNames\n  }\n}"

  public var input: DeleteRequestHistoryInput
  public var condition: ModelRequestHistoryConditionInput?

  public init(input: DeleteRequestHistoryInput, condition: ModelRequestHistoryConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteRequestHistory", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteRequestHistory.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteRequestHistory: DeleteRequestHistory? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteRequestHistory": deleteRequestHistory.flatMap { $0.snapshot }])
    }

    public var deleteRequestHistory: DeleteRequestHistory? {
      get {
        return (snapshot["deleteRequestHistory"] as? Snapshot).flatMap { DeleteRequestHistory(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteRequestHistory")
      }
    }

    public struct DeleteRequestHistory: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestHistory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemNames: String) {
        self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemNames: String {
        get {
          return snapshot["itemNames"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "itemNames")
        }
      }
    }
  }
}

public final class GetItemQuery: GraphQLQuery {
  public static let operationString =
    "query GetItem($id: ID!) {\n  getItem(id: $id) {\n    __typename\n    id\n    name\n    searchCount\n    entry {\n      __typename\n      price\n      pictures\n      location\n      timestamp\n      notes\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getItem", arguments: ["id": GraphQLVariable("id")], type: .object(GetItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getItem: GetItem? = nil) {
      self.init(snapshot: ["__typename": "Query", "getItem": getItem.flatMap { $0.snapshot }])
    }

    public var getItem: GetItem? {
      get {
        return (snapshot["getItem"] as? Snapshot).flatMap { GetItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getItem")
      }
    }

    public struct GetItem: GraphQLSelectionSet {
      public static let possibleTypes = ["Item"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("searchCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("entry", type: .list(.nonNull(.object(Entry.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, searchCount: Int, entry: [Entry]? = nil) {
        self.init(snapshot: ["__typename": "Item", "id": id, "name": name, "searchCount": searchCount, "entry": entry.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var searchCount: Int {
        get {
          return snapshot["searchCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "searchCount")
        }
      }

      public var entry: [Entry]? {
        get {
          return (snapshot["entry"] as? [Snapshot]).flatMap { $0.map { Entry(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "entry")
        }
      }

      public struct Entry: GraphQLSelectionSet {
        public static let possibleTypes = ["Entry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
          self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var price: Double {
          get {
            return snapshot["price"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var pictures: String {
          get {
            return snapshot["pictures"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pictures")
          }
        }

        public var location: String {
          get {
            return snapshot["location"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        public var notes: String? {
          get {
            return snapshot["notes"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "notes")
          }
        }
      }
    }
  }
}

public final class ListItemsQuery: GraphQLQuery {
  public static let operationString =
    "query ListItems($filter: ModelItemFilterInput, $limit: Int, $nextToken: String) {\n  listItems(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      searchCount\n      entry {\n        __typename\n        price\n        pictures\n        location\n        timestamp\n        notes\n      }\n    }\n    nextToken\n  }\n}"

  public var filter: ModelItemFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelItemFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listItems", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listItems: ListItem? = nil) {
      self.init(snapshot: ["__typename": "Query", "listItems": listItems.flatMap { $0.snapshot }])
    }

    public var listItems: ListItem? {
      get {
        return (snapshot["listItems"] as? Snapshot).flatMap { ListItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listItems")
      }
    }

    public struct ListItem: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelItemConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Item"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("searchCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("entry", type: .list(.nonNull(.object(Entry.selections)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, searchCount: Int, entry: [Entry]? = nil) {
          self.init(snapshot: ["__typename": "Item", "id": id, "name": name, "searchCount": searchCount, "entry": entry.flatMap { $0.map { $0.snapshot } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var searchCount: Int {
          get {
            return snapshot["searchCount"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "searchCount")
          }
        }

        public var entry: [Entry]? {
          get {
            return (snapshot["entry"] as? [Snapshot]).flatMap { $0.map { Entry(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "entry")
          }
        }

        public struct Entry: GraphQLSelectionSet {
          public static let possibleTypes = ["Entry"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("price", type: .nonNull(.scalar(Double.self))),
            GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
            GraphQLField("location", type: .nonNull(.scalar(String.self))),
            GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
            GraphQLField("notes", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
            self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var price: Double {
            get {
              return snapshot["price"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "price")
            }
          }

          public var pictures: String {
            get {
              return snapshot["pictures"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "pictures")
            }
          }

          public var location: String {
            get {
              return snapshot["location"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "location")
            }
          }

          public var timestamp: String {
            get {
              return snapshot["timestamp"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "timestamp")
            }
          }

          public var notes: String? {
            get {
              return snapshot["notes"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "notes")
            }
          }
        }
      }
    }
  }
}

public final class GetEntryQuery: GraphQLQuery {
  public static let operationString =
    "query GetEntry($id: ID!) {\n  getEntry(id: $id) {\n    __typename\n    price\n    pictures\n    location\n    timestamp\n    notes\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getEntry", arguments: ["id": GraphQLVariable("id")], type: .object(GetEntry.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getEntry: GetEntry? = nil) {
      self.init(snapshot: ["__typename": "Query", "getEntry": getEntry.flatMap { $0.snapshot }])
    }

    public var getEntry: GetEntry? {
      get {
        return (snapshot["getEntry"] as? Snapshot).flatMap { GetEntry(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getEntry")
      }
    }

    public struct GetEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["Entry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("price", type: .nonNull(.scalar(Double.self))),
        GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("notes", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
        self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var price: Double {
        get {
          return snapshot["price"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "price")
        }
      }

      public var pictures: String {
        get {
          return snapshot["pictures"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pictures")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      public var notes: String? {
        get {
          return snapshot["notes"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "notes")
        }
      }
    }
  }
}

public final class ListEntrysQuery: GraphQLQuery {
  public static let operationString =
    "query ListEntrys($filter: ModelEntryFilterInput, $limit: Int, $nextToken: String) {\n  listEntrys(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      price\n      pictures\n      location\n      timestamp\n      notes\n    }\n    nextToken\n  }\n}"

  public var filter: ModelEntryFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelEntryFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listEntrys", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListEntry.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listEntrys: ListEntry? = nil) {
      self.init(snapshot: ["__typename": "Query", "listEntrys": listEntrys.flatMap { $0.snapshot }])
    }

    public var listEntrys: ListEntry? {
      get {
        return (snapshot["listEntrys"] as? Snapshot).flatMap { ListEntry(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listEntrys")
      }
    }

    public struct ListEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelEntryConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelEntryConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Entry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
          self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var price: Double {
          get {
            return snapshot["price"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var pictures: String {
          get {
            return snapshot["pictures"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pictures")
          }
        }

        public var location: String {
          get {
            return snapshot["location"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        public var notes: String? {
          get {
            return snapshot["notes"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "notes")
          }
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  public static let operationString =
    "query GetUser($id: ID!) {\n  getUser(id: $id) {\n    __typename\n    id\n    points\n    levelName\n    requestHistory {\n      __typename\n      itemNames\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUser", arguments: ["id": GraphQLVariable("id")], type: .object(GetUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUser: GetUser? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUser": getUser.flatMap { $0.snapshot }])
    }

    public var getUser: GetUser? {
      get {
        return (snapshot["getUser"] as? Snapshot).flatMap { GetUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUser")
      }
    }

    public struct GetUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("levelName", type: .nonNull(.scalar(String.self))),
        GraphQLField("requestHistory", type: .list(.nonNull(.object(RequestHistory.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, points: Int, levelName: String, requestHistory: [RequestHistory]? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "points": points, "levelName": levelName, "requestHistory": requestHistory.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var levelName: String {
        get {
          return snapshot["levelName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "levelName")
        }
      }

      public var requestHistory: [RequestHistory]? {
        get {
          return (snapshot["requestHistory"] as? [Snapshot]).flatMap { $0.map { RequestHistory(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "requestHistory")
        }
      }

      public struct RequestHistory: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestHistory"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(itemNames: String) {
          self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var itemNames: String {
          get {
            return snapshot["itemNames"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "itemNames")
          }
        }
      }
    }
  }
}

public final class ListUsersQuery: GraphQLQuery {
  public static let operationString =
    "query ListUsers($filter: ModelUserFilterInput, $limit: Int, $nextToken: String) {\n  listUsers(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      points\n      levelName\n      requestHistory {\n        __typename\n        itemNames\n      }\n    }\n    nextToken\n  }\n}"

  public var filter: ModelUserFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelUserFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUsers", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUsers: ListUser? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUsers": listUsers.flatMap { $0.snapshot }])
    }

    public var listUsers: ListUser? {
      get {
        return (snapshot["listUsers"] as? Snapshot).flatMap { ListUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listUsers")
      }
    }

    public struct ListUser: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelUserConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("levelName", type: .nonNull(.scalar(String.self))),
          GraphQLField("requestHistory", type: .list(.nonNull(.object(RequestHistory.selections)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, points: Int, levelName: String, requestHistory: [RequestHistory]? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "points": points, "levelName": levelName, "requestHistory": requestHistory.flatMap { $0.map { $0.snapshot } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var points: Int {
          get {
            return snapshot["points"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "points")
          }
        }

        public var levelName: String {
          get {
            return snapshot["levelName"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "levelName")
          }
        }

        public var requestHistory: [RequestHistory]? {
          get {
            return (snapshot["requestHistory"] as? [Snapshot]).flatMap { $0.map { RequestHistory(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "requestHistory")
          }
        }

        public struct RequestHistory: GraphQLSelectionSet {
          public static let possibleTypes = ["RequestHistory"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(itemNames: String) {
            self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var itemNames: String {
            get {
              return snapshot["itemNames"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "itemNames")
            }
          }
        }
      }
    }
  }
}

public final class GetRequestHistoryQuery: GraphQLQuery {
  public static let operationString =
    "query GetRequestHistory($id: ID!) {\n  getRequestHistory(id: $id) {\n    __typename\n    itemNames\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getRequestHistory", arguments: ["id": GraphQLVariable("id")], type: .object(GetRequestHistory.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getRequestHistory: GetRequestHistory? = nil) {
      self.init(snapshot: ["__typename": "Query", "getRequestHistory": getRequestHistory.flatMap { $0.snapshot }])
    }

    public var getRequestHistory: GetRequestHistory? {
      get {
        return (snapshot["getRequestHistory"] as? Snapshot).flatMap { GetRequestHistory(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getRequestHistory")
      }
    }

    public struct GetRequestHistory: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestHistory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemNames: String) {
        self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemNames: String {
        get {
          return snapshot["itemNames"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "itemNames")
        }
      }
    }
  }
}

public final class ListRequestHistorysQuery: GraphQLQuery {
  public static let operationString =
    "query ListRequestHistorys($filter: ModelRequestHistoryFilterInput, $limit: Int, $nextToken: String) {\n  listRequestHistorys(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      itemNames\n    }\n    nextToken\n  }\n}"

  public var filter: ModelRequestHistoryFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelRequestHistoryFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listRequestHistorys", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListRequestHistory.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listRequestHistorys: ListRequestHistory? = nil) {
      self.init(snapshot: ["__typename": "Query", "listRequestHistorys": listRequestHistorys.flatMap { $0.snapshot }])
    }

    public var listRequestHistorys: ListRequestHistory? {
      get {
        return (snapshot["listRequestHistorys"] as? Snapshot).flatMap { ListRequestHistory(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listRequestHistorys")
      }
    }

    public struct ListRequestHistory: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelRequestHistoryConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelRequestHistoryConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestHistory"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(itemNames: String) {
          self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var itemNames: String {
          get {
            return snapshot["itemNames"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "itemNames")
          }
        }
      }
    }
  }
}

public final class OnCreateItemSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateItem {\n  onCreateItem {\n    __typename\n    id\n    name\n    searchCount\n    entry {\n      __typename\n      price\n      pictures\n      location\n      timestamp\n      notes\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateItem", type: .object(OnCreateItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateItem: OnCreateItem? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateItem": onCreateItem.flatMap { $0.snapshot }])
    }

    public var onCreateItem: OnCreateItem? {
      get {
        return (snapshot["onCreateItem"] as? Snapshot).flatMap { OnCreateItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateItem")
      }
    }

    public struct OnCreateItem: GraphQLSelectionSet {
      public static let possibleTypes = ["Item"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("searchCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("entry", type: .list(.nonNull(.object(Entry.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, searchCount: Int, entry: [Entry]? = nil) {
        self.init(snapshot: ["__typename": "Item", "id": id, "name": name, "searchCount": searchCount, "entry": entry.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var searchCount: Int {
        get {
          return snapshot["searchCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "searchCount")
        }
      }

      public var entry: [Entry]? {
        get {
          return (snapshot["entry"] as? [Snapshot]).flatMap { $0.map { Entry(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "entry")
        }
      }

      public struct Entry: GraphQLSelectionSet {
        public static let possibleTypes = ["Entry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
          self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var price: Double {
          get {
            return snapshot["price"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var pictures: String {
          get {
            return snapshot["pictures"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pictures")
          }
        }

        public var location: String {
          get {
            return snapshot["location"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        public var notes: String? {
          get {
            return snapshot["notes"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "notes")
          }
        }
      }
    }
  }
}

public final class OnUpdateItemSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateItem {\n  onUpdateItem {\n    __typename\n    id\n    name\n    searchCount\n    entry {\n      __typename\n      price\n      pictures\n      location\n      timestamp\n      notes\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateItem", type: .object(OnUpdateItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateItem: OnUpdateItem? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateItem": onUpdateItem.flatMap { $0.snapshot }])
    }

    public var onUpdateItem: OnUpdateItem? {
      get {
        return (snapshot["onUpdateItem"] as? Snapshot).flatMap { OnUpdateItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateItem")
      }
    }

    public struct OnUpdateItem: GraphQLSelectionSet {
      public static let possibleTypes = ["Item"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("searchCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("entry", type: .list(.nonNull(.object(Entry.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, searchCount: Int, entry: [Entry]? = nil) {
        self.init(snapshot: ["__typename": "Item", "id": id, "name": name, "searchCount": searchCount, "entry": entry.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var searchCount: Int {
        get {
          return snapshot["searchCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "searchCount")
        }
      }

      public var entry: [Entry]? {
        get {
          return (snapshot["entry"] as? [Snapshot]).flatMap { $0.map { Entry(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "entry")
        }
      }

      public struct Entry: GraphQLSelectionSet {
        public static let possibleTypes = ["Entry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
          self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var price: Double {
          get {
            return snapshot["price"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var pictures: String {
          get {
            return snapshot["pictures"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pictures")
          }
        }

        public var location: String {
          get {
            return snapshot["location"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        public var notes: String? {
          get {
            return snapshot["notes"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "notes")
          }
        }
      }
    }
  }
}

public final class OnDeleteItemSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteItem {\n  onDeleteItem {\n    __typename\n    id\n    name\n    searchCount\n    entry {\n      __typename\n      price\n      pictures\n      location\n      timestamp\n      notes\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteItem", type: .object(OnDeleteItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteItem: OnDeleteItem? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteItem": onDeleteItem.flatMap { $0.snapshot }])
    }

    public var onDeleteItem: OnDeleteItem? {
      get {
        return (snapshot["onDeleteItem"] as? Snapshot).flatMap { OnDeleteItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteItem")
      }
    }

    public struct OnDeleteItem: GraphQLSelectionSet {
      public static let possibleTypes = ["Item"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("searchCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("entry", type: .list(.nonNull(.object(Entry.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, searchCount: Int, entry: [Entry]? = nil) {
        self.init(snapshot: ["__typename": "Item", "id": id, "name": name, "searchCount": searchCount, "entry": entry.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var searchCount: Int {
        get {
          return snapshot["searchCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "searchCount")
        }
      }

      public var entry: [Entry]? {
        get {
          return (snapshot["entry"] as? [Snapshot]).flatMap { $0.map { Entry(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "entry")
        }
      }

      public struct Entry: GraphQLSelectionSet {
        public static let possibleTypes = ["Entry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
          self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var price: Double {
          get {
            return snapshot["price"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var pictures: String {
          get {
            return snapshot["pictures"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "pictures")
          }
        }

        public var location: String {
          get {
            return snapshot["location"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var timestamp: String {
          get {
            return snapshot["timestamp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timestamp")
          }
        }

        public var notes: String? {
          get {
            return snapshot["notes"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "notes")
          }
        }
      }
    }
  }
}

public final class OnCreateEntrySubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateEntry {\n  onCreateEntry {\n    __typename\n    price\n    pictures\n    location\n    timestamp\n    notes\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateEntry", type: .object(OnCreateEntry.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateEntry: OnCreateEntry? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateEntry": onCreateEntry.flatMap { $0.snapshot }])
    }

    public var onCreateEntry: OnCreateEntry? {
      get {
        return (snapshot["onCreateEntry"] as? Snapshot).flatMap { OnCreateEntry(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateEntry")
      }
    }

    public struct OnCreateEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["Entry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("price", type: .nonNull(.scalar(Double.self))),
        GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("notes", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
        self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var price: Double {
        get {
          return snapshot["price"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "price")
        }
      }

      public var pictures: String {
        get {
          return snapshot["pictures"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pictures")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      public var notes: String? {
        get {
          return snapshot["notes"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "notes")
        }
      }
    }
  }
}

public final class OnUpdateEntrySubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateEntry {\n  onUpdateEntry {\n    __typename\n    price\n    pictures\n    location\n    timestamp\n    notes\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateEntry", type: .object(OnUpdateEntry.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateEntry: OnUpdateEntry? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateEntry": onUpdateEntry.flatMap { $0.snapshot }])
    }

    public var onUpdateEntry: OnUpdateEntry? {
      get {
        return (snapshot["onUpdateEntry"] as? Snapshot).flatMap { OnUpdateEntry(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateEntry")
      }
    }

    public struct OnUpdateEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["Entry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("price", type: .nonNull(.scalar(Double.self))),
        GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("notes", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
        self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var price: Double {
        get {
          return snapshot["price"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "price")
        }
      }

      public var pictures: String {
        get {
          return snapshot["pictures"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pictures")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      public var notes: String? {
        get {
          return snapshot["notes"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "notes")
        }
      }
    }
  }
}

public final class OnDeleteEntrySubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteEntry {\n  onDeleteEntry {\n    __typename\n    price\n    pictures\n    location\n    timestamp\n    notes\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteEntry", type: .object(OnDeleteEntry.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteEntry: OnDeleteEntry? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteEntry": onDeleteEntry.flatMap { $0.snapshot }])
    }

    public var onDeleteEntry: OnDeleteEntry? {
      get {
        return (snapshot["onDeleteEntry"] as? Snapshot).flatMap { OnDeleteEntry(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteEntry")
      }
    }

    public struct OnDeleteEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["Entry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("price", type: .nonNull(.scalar(Double.self))),
        GraphQLField("pictures", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.scalar(String.self))),
        GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
        GraphQLField("notes", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(price: Double, pictures: String, location: String, timestamp: String, notes: String? = nil) {
        self.init(snapshot: ["__typename": "Entry", "price": price, "pictures": pictures, "location": location, "timestamp": timestamp, "notes": notes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var price: Double {
        get {
          return snapshot["price"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "price")
        }
      }

      public var pictures: String {
        get {
          return snapshot["pictures"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "pictures")
        }
      }

      public var location: String {
        get {
          return snapshot["location"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var timestamp: String {
        get {
          return snapshot["timestamp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }

      public var notes: String? {
        get {
          return snapshot["notes"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "notes")
        }
      }
    }
  }
}

public final class OnCreateUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateUser {\n  onCreateUser {\n    __typename\n    id\n    points\n    levelName\n    requestHistory {\n      __typename\n      itemNames\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateUser", type: .object(OnCreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateUser: OnCreateUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateUser": onCreateUser.flatMap { $0.snapshot }])
    }

    public var onCreateUser: OnCreateUser? {
      get {
        return (snapshot["onCreateUser"] as? Snapshot).flatMap { OnCreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateUser")
      }
    }

    public struct OnCreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("levelName", type: .nonNull(.scalar(String.self))),
        GraphQLField("requestHistory", type: .list(.nonNull(.object(RequestHistory.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, points: Int, levelName: String, requestHistory: [RequestHistory]? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "points": points, "levelName": levelName, "requestHistory": requestHistory.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var levelName: String {
        get {
          return snapshot["levelName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "levelName")
        }
      }

      public var requestHistory: [RequestHistory]? {
        get {
          return (snapshot["requestHistory"] as? [Snapshot]).flatMap { $0.map { RequestHistory(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "requestHistory")
        }
      }

      public struct RequestHistory: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestHistory"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(itemNames: String) {
          self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var itemNames: String {
          get {
            return snapshot["itemNames"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "itemNames")
          }
        }
      }
    }
  }
}

public final class OnUpdateUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateUser {\n  onUpdateUser {\n    __typename\n    id\n    points\n    levelName\n    requestHistory {\n      __typename\n      itemNames\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateUser", type: .object(OnUpdateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateUser: OnUpdateUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateUser": onUpdateUser.flatMap { $0.snapshot }])
    }

    public var onUpdateUser: OnUpdateUser? {
      get {
        return (snapshot["onUpdateUser"] as? Snapshot).flatMap { OnUpdateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateUser")
      }
    }

    public struct OnUpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("levelName", type: .nonNull(.scalar(String.self))),
        GraphQLField("requestHistory", type: .list(.nonNull(.object(RequestHistory.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, points: Int, levelName: String, requestHistory: [RequestHistory]? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "points": points, "levelName": levelName, "requestHistory": requestHistory.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var levelName: String {
        get {
          return snapshot["levelName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "levelName")
        }
      }

      public var requestHistory: [RequestHistory]? {
        get {
          return (snapshot["requestHistory"] as? [Snapshot]).flatMap { $0.map { RequestHistory(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "requestHistory")
        }
      }

      public struct RequestHistory: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestHistory"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(itemNames: String) {
          self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var itemNames: String {
          get {
            return snapshot["itemNames"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "itemNames")
          }
        }
      }
    }
  }
}

public final class OnDeleteUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteUser {\n  onDeleteUser {\n    __typename\n    id\n    points\n    levelName\n    requestHistory {\n      __typename\n      itemNames\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteUser", type: .object(OnDeleteUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteUser: OnDeleteUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteUser": onDeleteUser.flatMap { $0.snapshot }])
    }

    public var onDeleteUser: OnDeleteUser? {
      get {
        return (snapshot["onDeleteUser"] as? Snapshot).flatMap { OnDeleteUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteUser")
      }
    }

    public struct OnDeleteUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("levelName", type: .nonNull(.scalar(String.self))),
        GraphQLField("requestHistory", type: .list(.nonNull(.object(RequestHistory.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, points: Int, levelName: String, requestHistory: [RequestHistory]? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "points": points, "levelName": levelName, "requestHistory": requestHistory.flatMap { $0.map { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var levelName: String {
        get {
          return snapshot["levelName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "levelName")
        }
      }

      public var requestHistory: [RequestHistory]? {
        get {
          return (snapshot["requestHistory"] as? [Snapshot]).flatMap { $0.map { RequestHistory(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "requestHistory")
        }
      }

      public struct RequestHistory: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestHistory"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(itemNames: String) {
          self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var itemNames: String {
          get {
            return snapshot["itemNames"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "itemNames")
          }
        }
      }
    }
  }
}

public final class OnCreateRequestHistorySubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateRequestHistory {\n  onCreateRequestHistory {\n    __typename\n    itemNames\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateRequestHistory", type: .object(OnCreateRequestHistory.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateRequestHistory: OnCreateRequestHistory? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateRequestHistory": onCreateRequestHistory.flatMap { $0.snapshot }])
    }

    public var onCreateRequestHistory: OnCreateRequestHistory? {
      get {
        return (snapshot["onCreateRequestHistory"] as? Snapshot).flatMap { OnCreateRequestHistory(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateRequestHistory")
      }
    }

    public struct OnCreateRequestHistory: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestHistory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemNames: String) {
        self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemNames: String {
        get {
          return snapshot["itemNames"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "itemNames")
        }
      }
    }
  }
}

public final class OnUpdateRequestHistorySubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateRequestHistory {\n  onUpdateRequestHistory {\n    __typename\n    itemNames\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateRequestHistory", type: .object(OnUpdateRequestHistory.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateRequestHistory: OnUpdateRequestHistory? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateRequestHistory": onUpdateRequestHistory.flatMap { $0.snapshot }])
    }

    public var onUpdateRequestHistory: OnUpdateRequestHistory? {
      get {
        return (snapshot["onUpdateRequestHistory"] as? Snapshot).flatMap { OnUpdateRequestHistory(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateRequestHistory")
      }
    }

    public struct OnUpdateRequestHistory: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestHistory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemNames: String) {
        self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemNames: String {
        get {
          return snapshot["itemNames"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "itemNames")
        }
      }
    }
  }
}

public final class OnDeleteRequestHistorySubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteRequestHistory {\n  onDeleteRequestHistory {\n    __typename\n    itemNames\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteRequestHistory", type: .object(OnDeleteRequestHistory.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteRequestHistory: OnDeleteRequestHistory? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteRequestHistory": onDeleteRequestHistory.flatMap { $0.snapshot }])
    }

    public var onDeleteRequestHistory: OnDeleteRequestHistory? {
      get {
        return (snapshot["onDeleteRequestHistory"] as? Snapshot).flatMap { OnDeleteRequestHistory(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteRequestHistory")
      }
    }

    public struct OnDeleteRequestHistory: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestHistory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("itemNames", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemNames: String) {
        self.init(snapshot: ["__typename": "RequestHistory", "itemNames": itemNames])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemNames: String {
        get {
          return snapshot["itemNames"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "itemNames")
        }
      }
    }
  }
}