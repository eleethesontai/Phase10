import SwiftUI

class ApplicationViewModel: ObservableObject {
    @Published var games: [Game] = [] {
        didSet {
            print("avm.games.didSet")
        }
    }
    
    init() {
        loadDemo()
    }
    
    func loadDemo() {
        for g in 0...3 {
            var game = Game(name: "Demo Game #\(g)")
            for p in 0...3 {
                game.players.append(Player(name: "Player #\(p)"))
            }
            self.games.append(game)
        }
    }
    
}
