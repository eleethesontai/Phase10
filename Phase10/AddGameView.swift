import SwiftUI

struct AddGameView: View {
    
    @Binding var games: [Game]
    @Binding var isPresented: Bool
    
    @State var availablePlayers: [String]
    
    @State var title: String
    @State var isMasters: Bool = false
    @State var selectedPlayers: [String] = ["William", "Olivia", "Sophia"]
    @State var newPlayer: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("") {
                    TextField("Game Title", text: $title)
                    Toggle("Is Masters Edition", isOn: $isMasters)
                }
                Section(header: Text("PLAYERS")) {
                    TextField("New Player", text: $newPlayer)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "plus")
                                    .onTapGesture {onTapGesture1()}
                            }
                        )
                    ForEach(self.availablePlayers, id: \.self) { player in
                        HStack {
                            Text(player)
                            Spacer()
                            if self.selectedPlayers.contains(player) {
                                Image(systemName: "checkmark")
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {onTapGesture2(player: player)}
                    }
                }
            }
            .navigationTitle("New Game")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: {onButtonClick()}, label: {Image(systemName: "checkmark")})
                }
            }
        }

    }
    
    func onButtonClick() {
        
        var game = Game(name: self.title)
        
        for player in self.selectedPlayers {
            game.players.append(Player(name: player))
        }
        
        self.games.append(game)
        self.isPresented.toggle()
        
    }
    
    func onTapGesture1() {
        addPlayer(name: newPlayer)
        togglePlayer(name: newPlayer)
        self.newPlayer = ""
    }
    
    func onTapGesture2(player: String) {
        togglePlayer(name: player)
    }
    
    func addPlayer(name: String) {
        if name != "" {
            if !self.availablePlayers.contains(name) {
                self.availablePlayers.insert(name, at: 0)
            }
        }
    }
    func togglePlayer(name: String) {
        if self.selectedPlayers.contains(name) {
            if let index = self.selectedPlayers.firstIndex(of: name) {
                self.selectedPlayers.remove(at: index)
            }
        } else {
            self.selectedPlayers.append(name)
        }
    }
    
}
