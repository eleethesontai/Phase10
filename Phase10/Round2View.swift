import SwiftUI

struct Round2View: View {
    
    @Binding var player: Player
    @Binding var round: Round
    
    init(player: Binding<Player>, currentRound: Int) {
        _player = player
        _round = player.rounds[currentRound-1]
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text(player.name).font(.title)
            Divider()
            Group {
                Stepper("# of Points: \(self.round.earnedPoints)", value: self.$round.earnedPoints, in: 0...250, step: 5)
                Stepper("Selected Phase: \(self.round.selectedPhase)", value: self.$round.selectedPhase, in: 1...10)
                Toggle("Completed Phase", isOn: self.$round.completedPhase)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
    
}
