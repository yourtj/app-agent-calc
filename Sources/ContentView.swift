import SwiftUI

struct ContentView: View {
    @State private var displayText = "0"
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            // Display area
            HStack {
                Spacer()
                Text(displayText)
                    .font(.system(size: displayFontSize(), weight: .light, design: .monospaced))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal, 24)
            }
            .frame(height: 100)
            .background(Color.black.opacity(0.1))
            
            // Button grid - Exactly 4x5 layout as specified in PRD
            VStack(spacing: 12) {
                // Row 1: [C] [÷] [×] [-]
                HStack(spacing: 12) {
                    CalculatorButton(title: "C", backgroundColor: .gray) {
                        displayText = "0"
                    }
                    CalculatorButton(title: "÷", backgroundColor: .orange) {
                        // Operation logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "×", backgroundColor: .orange) {
                        // Operation logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "−", backgroundColor: .orange) {
                        // Operation logic to be implemented in later tasks
                    }
                }
                
                // Row 2: [7] [8] [9] [+]
                HStack(spacing: 12) {
                    CalculatorButton(title: "7", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "8", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "9", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "+", backgroundColor: .orange) {
                        // Operation logic to be implemented in later tasks
                    }
                }
                
                // Row 3: [4] [5] [6] [+] (+ button spans 2 rows)
                HStack(spacing: 12) {
                    CalculatorButton(title: "4", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "5", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "6", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    // Plus button continues from row 2
                    Color.clear.frame(height: 80)
                }
                
                // Row 4: [1] [2] [3] [=]
                HStack(spacing: 12) {
                    CalculatorButton(title: "1", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "2", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "3", backgroundColor: .init(white: 0.2)) {
                        // Number input logic to be implemented in later tasks
                    }
                    CalculatorButton(title: "=", backgroundColor: .orange) {
                        // Equals logic to be implemented in later tasks
                    }
                }
                
                // Row 5: [0] [0] [.] [=] (0 spans 2 columns, = spans 2 rows)
                HStack(spacing: 12) {
                    // Zero button spans 2 columns
                    Button(action: {
                        // Number input logic to be implemented in later tasks
                    }) {
                        Text("0")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(width: 172, height: 80)
                            .background(Color(white: 0.2))
                            .clipShape(Capsule())
                    }
                    
                    CalculatorButton(title: ".", backgroundColor: .init(white: 0.2)) {
                        // Decimal logic to be implemented in later tasks
                    }
                    
                    // Equals button continues from row 4
                    Color.clear.frame(height: 80)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .background(Color.black)
    }
    
    private func displayFontSize() -> CGFloat {
        let length = displayText.count
        if length > 6 {
            return 36
        } else if length > 4 {
            return 48
        } else {
            return 64
        }
    }
}

struct CalculatorButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(foregroundColor)
                .frame(width: 80, height: 80)
                .background(backgroundColor)
                .clipShape(Circle())
        }
    }
    
    private var foregroundColor: Color {
        if backgroundColor == .orange {
            return .white
        } else if backgroundColor == .gray {
            return .black
        } else {
            return .white
        }
    }
}

#Preview {
    ContentView()
}
