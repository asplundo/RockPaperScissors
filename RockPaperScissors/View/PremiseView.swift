import SwiftUI

struct PremiseView: View {
    
    @Binding var choice: Int
    @Binding var shouldWin: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Apps choice: ")
                Text(ContentView.moves[choice])
            }
            HStack {
                Text("Player shoud \(shouldWin ? "win" : "lose")")
            }
        }.font(.title)
    }
}

struct PremiseView_Previews: PreviewProvider {
    static var previews: some View {
        PremiseView(choice: .constant(0), shouldWin: .constant(true))
    }
}
