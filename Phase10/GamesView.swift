import SwiftUI

struct GamesView: View {
    
    @EnvironmentObject var viewModel: ApplicationViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section("GAMES") {
                    ForEach(self.viewModel.games) { game in
                        
                        let gameBinding = Binding(
                            get: {game},
                            set: {
                                let found = self.viewModel.games.firstIndex(where: {$0.id == game.id})
                                self.viewModel.games[found ?? 0] = $0
                            }
                        )
                        
                        NavigationLink(destination: GameView(game: gameBinding).environmentObject(self.viewModel)) {
                            Text(game.name)
                        }
                        
                    }
                    .onDelete(perform: onDelete)
                }
            }
            .navigationTitle("Phase 10")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: {self.isPresented.toggle()}, label: {Image(systemName: "plus")})
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {}) {
                AddGameView(
                    games: self.$viewModel.games,
                    isPresented: self.$isPresented,
                    availablePlayers: ["William", "Olivia", "Sophia"],
                    title: self.randomName()
                )
            }
        }
    }
    
    func onDelete(at offsets: IndexSet) {
        self.viewModel.games.remove(atOffsets: offsets)
    }
    
    func randomName() -> String {
        
        let randomNames: [String] = [
            "Fishstick",
            "Coffee Time",
            "Spaghetti Tacos",
            "Chopsticks",
            "Caramel Latte",
            "Smoke a Bowl",
            "What the Fuck!",
            "Chicken Tenders",
            "Livi is the Best",
            "Fia is the Best",
            "William Smells",
            "Laser Lips",
            "Chocolate Orange",
            "Mele Kalikimaka",
            "Brownies",
            "Little Drummer Boy",
            "Pancakes for Dinner",
            "Gravy Stain",
            "Mushrooms",
            "Fre shAvacado",
            "Chocolate Spoon",
            "Magnets",
            "iPad",
            "iPhone",
            "iMac",
            "Macbook Pro",
            "Ninja Sister",
            "Turkey Bowl",
            "Biden is a Loser",
            "Trump 2024!",
            "Taco Bell",
            "Smoke a Joint",
            "Baked",
            "French Fries",
            "KFC",
            "Japan",
            "Tesla",
            "Cybertruck",
            "William can't Sing",
            "Your mama was a Snowblower",
            "Johny 5 is alive",
            "Walle",
            "Furry Baby",
            "Love you 3000",
            "White Christmas",
            "Texas for Christmas",
            "Adrina smells funny",
            "So Anyways!",
            "Chocolate Chips",
            "Popcorn",
            "Reverse Coloring Book",
            "Fidget Spinner",
            "Kittens",
            "Fox",
            "Squirrel",
            "Deer",
            "Chicken Liver",
            "Chicken & Waffles",
            "Burrito",
            "Chili Relleno",
            "Mashed Potatoes",
            "Pickles",
            "Cheese",
            "Juice Box",
            "Damn the Man",
            "Marvel",
            "Tony Stark",
            "Ironman",
            "Captain America",
            "Black Widow",
            "Hawkeye",
            "I can do this all Day",
            "Gyro",
            "Shish Kabob"
        ]
        
        return randomNames[Int.random(in: 0..<randomNames.count)]
        
    }
    
}
