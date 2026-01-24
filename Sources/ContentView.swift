import SwiftUI

struct ContentView: View {
    @StateObject private var calculator = CalculatorViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            // Display Area
            VStack {
                HStack {
                    Spacer()
                    Text(calculator.display)
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 30)
            }
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(Color.black)
            
            // Button Grid
            VStack(spacing: 12) {
                // Row 1: Clear, +/-, %, ÷
                HStack(spacing: 12) {
                    CalculatorButton(title: "C", type: .function) {
                        calculator.clear()
                    }
                    CalculatorButton(title: "±", type: .function) {
                        calculator.toggleSign()
                    }
                    CalculatorButton(title: "%", type: .function) {
                        calculator.percentage()
                    }
                    CalculatorButton(title: "÷", type: .operation) {
                        calculator.performOperation(.divide)
                    }
                }
                
                // Row 2: 7, 8, 9, ×
                HStack(spacing: 12) {
                    CalculatorButton(title: "7", type: .number) {
                        calculator.inputNumber(7)
                    }
                    CalculatorButton(title: "8", type: .number) {
                        calculator.inputNumber(8)
                    }
                    CalculatorButton(title: "9", type: .number) {
                        calculator.inputNumber(9)
                    }
                    CalculatorButton(title: "×", type: .operation) {
                        calculator.performOperation(.multiply)
                    }
                }
                
                // Row 3: 4, 5, 6, -
                HStack(spacing: 12) {
                    CalculatorButton(title: "4", type: .number) {
                        calculator.inputNumber(4)
                    }
                    CalculatorButton(title: "5", type: .number) {
                        calculator.inputNumber(5)
                    }
                    CalculatorButton(title: "6", type: .number) {
                        calculator.inputNumber(6)
                    }
                    CalculatorButton(title: "−", type: .operation) {
                        calculator.performOperation(.subtract)
                    }
                }
                
                // Row 4: 1, 2, 3, +
                HStack(spacing: 12) {
                    CalculatorButton(title: "1", type: .number) {
                        calculator.inputNumber(1)
                    }
                    CalculatorButton(title: "2", type: .number) {
                        calculator.inputNumber(2)
                    }
                    CalculatorButton(title: "3", type: .number) {
                        calculator.inputNumber(3)
                    }
                    CalculatorButton(title: "+", type: .operation) {
                        calculator.performOperation(.add)
                    }
                }
                
                // Row 5: 0 (wide), ., =
                HStack(spacing: 12) {
                    CalculatorButton(title: "0", type: .number, isWide: true) {
                        calculator.inputNumber(0)
                    }
                    CalculatorButton(title: ".", type: .number) {
                        calculator.inputDecimal()
                    }
                    CalculatorButton(title: "=", type: .equals) {
                        calculator.calculateResult()
                    }
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .background(Color.black)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    ContentView()
}
