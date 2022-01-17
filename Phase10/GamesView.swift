import SwiftUI

struct GamesView: View {
    
    @EnvironmentObject var viewModel: ApplicationViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section("GAMES") {
                    ForEach(self.viewModel.games) { game in
                        
                    }
                    .onDelete(perform: onDelete)
                }
            }
            .navigationTitle("Phase 10")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(
                        action: {self.isPresented.toggle()},
                        label: {Image(systemName: "plus")}
                    )
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {}) {}
        }
    }
    
    func onDelete(at offsets: IndexSet) {
        self.viewModel.games.remove(atOffsets: offsets)
    }
    
}
