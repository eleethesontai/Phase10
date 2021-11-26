import SwiftUI

struct Game: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    init(name: String) {
        self.name = name
    }
    
    var name: String
    var currentRound: Int = 1
    var players: [Player] = []
    
}
