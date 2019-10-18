import SwiftUI

struct PremiseView: View {
    
    @Binding var choice: Int
    @Binding var shouldWin: Bool
    
    var choiceStr: String {
        ContentView.moves[choice]
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Apps choice").font(.title)
            Image(choiceStr)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
            Text(choiceStr)
                .font(.subheadline)
            Text("Player shoud \(shouldWin ? "win" : "lose")")
        }
    }
}

struct PremiseView_Previews: PreviewProvider {
    static var previews: some View {
        PremiseView(choice: .constant(0), shouldWin: .constant(true))
    }
}
