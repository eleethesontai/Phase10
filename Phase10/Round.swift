import SwiftUI

struct Round: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    var earnedPoints: Int = 0
    var selectedPhase: Int = 1
    var completedPhase: Bool = false
    
}
