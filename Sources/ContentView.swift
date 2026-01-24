import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        VStack(spacing: 1) {
            // Display
            HStack {
                Spacer()
                Text(viewModel.display)
                    .font(displayFont)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding()
            .frame(height: 100)
            .background(Color.black)
            
            // Button Grid
            VStack(spacing: 1) {
                // Row 1: C, ±, %, ÷
                HStack(spacing: 1) {
                    CalculatorButton(title: "C", color: .gray, textColor: .black) {
                        viewModel.clear()
                    }
                    CalculatorButton(title: "±", color: .gray, textColor: .black) {
                        // Plus/minus functionality (placeholder)
                    }
                    CalculatorButton(title: "%", color: .gray, textColor: .black) {
                        // Percentage functionality (placeholder)
                    }
                    CalculatorButton(title: "÷", color: .orange) {
                        viewModel.inputOperation(.divide)
                    }
                }
                
                // Row 2: 7, 8, 9, ×
                HStack(spacing: 1) {
                    CalculatorButton(title: "7", color: .darkGray) {
                        viewModel.inputNumber("7")
                    }
                    CalculatorButton(title: "8", color: .darkGray) {
                        viewModel.inputNumber("8")
                    }
                    CalculatorButton(title: "9", color: .darkGray) {
                        viewModel.inputNumber("9")
                    }
                    CalculatorButton(title: "×", color: .orange) {
                        viewModel.inputOperation(.multiply)
                    }
                }
                
                // Row 3: 4, 5, 6, −
                HStack(spacing: 1) {
                    CalculatorButton(title: "4", color: .darkGray) {
                        viewModel.inputNumber("4")
                    }
                    CalculatorButton(title: "5", color: .darkGray) {
                        viewModel.inputNumber("5")
                    }
                    CalculatorButton(title: "6", color: .darkGray) {
                        viewModel.inputNumber("6")
                    }
                    CalculatorButton(title: "−", color: .orange) {
                        viewModel.inputOperation(.subtract)
                    }
                }
                
                // Row 4: 1, 2, 3, +
                HStack(spacing: 1) {
                    CalculatorButton(title: "1", color: .darkGray) {
                        viewModel.inputNumber("1")
                    }
                    CalculatorButton(title: "2", color: .darkGray) {
                        viewModel.inputNumber("2")
                    }
                    CalculatorButton(title: "3", color: .darkGray) {
                        viewModel.inputNumber("3")
                    }
                    CalculatorButton(title: "+", color: .orange) {
                        viewModel.inputOperation(.add)
                    }
                }
                
                // Row 5: 0, ., =
                HStack(spacing: 1) {
                    CalculatorButton(title: "0", color: .darkGray, isWide: true) {
                        viewModel.inputNumber("0")
                    }
                    CalculatorButton(title: ".", color: .darkGray) {
                        viewModel.inputDecimal()
                    }
                    CalculatorButton(title: "=", color: .orange) {
                        viewModel.performCalculation()
                    }
                }
            }
        }
        .background(Color.black)
    }
    
    private var displayFont: Font {
        if viewModel.shouldUseSmallerFont() {
            return .system(size: 32, weight: .thin, design: .default)
        } else {
            return .system(size: 48, weight: .thin, design: .default)
        }
    }
}

extension Color {
    static let darkGray = Color(red: 0.2, green: 0.2, blue: 0.2)
    static let gray = Color(red: 0.6, green: 0.6, blue: 0.6)
}

#Preview {
    ContentView()
}
