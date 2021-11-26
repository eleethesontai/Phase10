import SwiftUI

class ApplicationViewModel: ObservableObject {
    @Published var games: [Game] = [] {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(self.games) {
            UserDefaults.standard.set(encodedData, forKey: "GAMES_LIST")
        }
    }
    
    func load() {
        guard
            let data = UserDefaults.standard.data(forKey: "GAMES_LIST"),
            let decoded = try? JSONDecoder().decode([Game].self, from: data)
        else { return }
        
        self.games = decoded
    }
    
    func refresh() {
        self.objectWillChange.send()
        print("refresh")
    }
    
}
