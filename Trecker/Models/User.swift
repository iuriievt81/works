import Foundation

enum UserType: String, Codable {
    case employee
    case employer
}

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let userType: UserType
    var isOnShift: Bool
}

struct Location: Codable {
    let latitude: Double
    let longitude: Double
    let timestamp: Date
} 