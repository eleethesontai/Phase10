import SwiftUI

struct Player: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    init(name: String) {
        self.name = name
    }
    
    var name: String
    var rounds: Array<Round> = Array(repeating: Round(), count: 100)
    
}

extension Player {
    var score: Int {
        return self.rounds.map({$0.earnedPoints}).reduce(0, +)
    }
}
