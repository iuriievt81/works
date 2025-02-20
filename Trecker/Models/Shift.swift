import Foundation

struct Shift: Identifiable, Codable {
    let id: String
    let employeeId: String
    let startTime: Date
    let endTime: Date?
    var locations: [Location]
    
    var duration: TimeInterval {
        let end = endTime ?? Date()
        return end.timeIntervalSince(startTime)
    }
    
    var formattedDuration: String {
        let hours = Int(duration) / 3600
        let minutes = Int(duration) / 60 % 60
        return "\(hours)h \(minutes)m"
    }
} 