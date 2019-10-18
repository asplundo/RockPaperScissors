import SwiftUI

struct ContentView: View {
    
    static let moves = ["Rock", "Paper", "Scissors"]
    @State private var appsChoice: Int = Int.random(in: 0...2)
    @State private var playerShouldWin: Bool = Bool.random()
    @State private var score: Int = 0
    @State private var runs: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                PremiseView(choice: $appsChoice, shouldWin: $playerShouldWin)
                HStack {
                    ForEach(ContentView.moves, id: \.self) { move in
                        Button(move, action: {
                            self.calculateScore(for: move)
                            self.runs += 1
                            self.reset()
                        }).disabled(self.runs >= 10)
                            .padding(.horizontal)
                    }
                }
                Spacer()
                if runs >= 10 {
                    Button(action: {
                        self.reset()
                        self.score = 0
                        self.runs = 0
                    }) {
                        Text("Play again")
                    }
                }
                Text("Score: \(score)")
            }.navigationBarTitle("R P S")
        }
    }
    
    func calculateScore(for move: String) {
        guard let index = ContentView.moves.firstIndex(of: move) else {
            fatalError("How did another string get in there?")
        }
        
        var playerWins: Bool = false
        if playerShouldWin {
            if index == 0 {
                playerWins = appsChoice == ContentView.moves.count - 1
            } else {
                playerWins = appsChoice == index - 1
            }
        } else {
            if index == ContentView.moves.count - 1 {
                playerWins = appsChoice == 0
            } else {
                playerWins = appsChoice == index + 1
            }
        }
        
        if playerWins {
            score += 1
        } else if score > 0 {
            score -= 1
        }
    }
    
    func reset() {
        appsChoice = Int.random(in: 0...2)
        playerShouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
