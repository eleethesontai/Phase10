import SwiftUI

struct Round1View: View {
    
    @Binding var game: Game
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            TabView {
                ForEach(game.players.indices) { player in
                    Round2View(
                        player: self.$game.players[player],
                        currentRound: self.game.currentRound
                    )
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .navigationTitle("Round #\(self.game.currentRound)")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(
                        action: {self.isPresented.toggle()},
                        label: {Image(systemName: "checkmark")}
                    )
                }
            }
        }
    }
    
}
