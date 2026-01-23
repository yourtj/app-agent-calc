import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            // Display
            HStack {
                Spacer()
                Text("0")
                    .font(.system(size: 64, weight: .light, design: .monospaced))
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
            .padding(.horizontal, 24)
            .frame(height: 100)
            .background(Color.black)
            
            // Button Grid - 4 columns, 5 rows = 20 buttons total
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 12) {
                // Row 1
                CalculatorButton(title: "C", backgroundColor: .gray)
                CalculatorButton(title: "÷", backgroundColor: .orange)
                CalculatorButton(title: "×", backgroundColor: .orange)
                CalculatorButton(title: "−", backgroundColor: .orange)
                
                // Row 2
                CalculatorButton(title: "7", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "8", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "9", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "+", backgroundColor: .orange)
                
                // Row 3
                CalculatorButton(title: "4", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "5", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "6", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "+", backgroundColor: .orange)
                
                // Row 4
                CalculatorButton(title: "1", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "2", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "3", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "=", backgroundColor: .orange)
                
                // Row 5
                CalculatorButton(title: "0", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "0", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: ".", backgroundColor: .init(white: 0.2))
                CalculatorButton(title: "=", backgroundColor: .orange)
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
}

struct CalculatorButton: View {
    let title: String
    let backgroundColor: Color
    
    var body: some View {
        Button(action: {
            // Button action - will be implemented in later tasks
        }) {
            Text(title)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(backgroundColor == .orange ? .white : .white)
                .frame(width: 80, height: 80)
                .background(backgroundColor)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ContentView()
}
