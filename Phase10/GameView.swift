import SwiftUI

struct GameView: View {
   
    @EnvironmentObject var viewModel: ApplicationViewModel
    @Binding var game: Game
    @State var isPresented: Bool = false
    
    var body: some View {
        List {
            Section("PLAYERS") {
                ForEach(game.players) { player in
                    HStack {
                        Text(player.name)
                        Spacer()
                        Text("\(player.score)")
                    }
                }
            }
            Section("ROUNDS") {
                ForEach(1..<self.game.currentRound) { round in
                    Text("Round# \(round)")
                }
            }
        }
        .navigationTitle(game.name)
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Button(action: {self.isPresented.toggle()}, label: {Image(systemName: "plus")})
            }
        }
        .sheet(isPresented: self.$isPresented, onDismiss: {onDismiss()}) {
            Round1View(
                game: self.$game,
                isPresented: self.$isPresented
            )
        }
    }
    
    func onDismiss() {
        self.game.currentRound += 1
        self.viewModel.refresh()
    }
    
}
