import SwiftUI

struct Player: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    init(name: String) {
        self.name = name
        
        for _ in 0...50 {
            self.rounds.append(Round())
        }
        
    }
    
    var name: String
    var rounds: Array<Round> = []
    
}

extension Player {
    var score: Int {
        return self.rounds.map({$0.earnedPoints}).reduce(0, +)
    }
}
