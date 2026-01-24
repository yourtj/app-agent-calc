import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        VStack(spacing: 1) {
            // Display Area
            HStack {
                Spacer()
                Text(viewModel.displayText)
                    .font(.system(size: 64, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(Color.black)
            
            // Button Grid - 4x5 layout (20 buttons total)
            VStack(spacing: 1) {
                // Row 1: [C] [÷] [×] [-]
                HStack(spacing: 1) {
                    CalculatorButton(title: "C", type: .function) {
                        viewModel.clear()
                    }
                    CalculatorButton(title: "÷", type: .operation) {
                        viewModel.setOperation(.divide)
                    }
                    CalculatorButton(title: "×", type: .operation) {
                        viewModel.setOperation(.multiply)
                    }
                    CalculatorButton(title: "-", type: .operation) {
                        viewModel.setOperation(.subtract)
                    }
                }
                
                // Row 2: [7] [8] [9] [+]
                HStack(spacing: 1) {
                    CalculatorButton(title: "7", type: .number) {
                        viewModel.inputNumber(7)
                    }
                    CalculatorButton(title: "8", type: .number) {
                        viewModel.inputNumber(8)
                    }
                    CalculatorButton(title: "9", type: .number) {
                        viewModel.inputNumber(9)
                    }
                    CalculatorButton(title: "+", type: .operation) {
                        viewModel.setOperation(.add)
                    }
                }
                
                // Row 3: [4] [5] [6] [+]
                HStack(spacing: 1) {
                    CalculatorButton(title: "4", type: .number) {
                        viewModel.inputNumber(4)
                    }
                    CalculatorButton(title: "5", type: .number) {
                        viewModel.inputNumber(5)
                    }
                    CalculatorButton(title: "6", type: .number) {
                        viewModel.inputNumber(6)
                    }
                    CalculatorButton(title: "+", type: .operation) {
                        viewModel.setOperation(.add)
                    }
                }
                
                // Row 4: [1] [2] [3] [=]
                HStack(spacing: 1) {
                    CalculatorButton(title: "1", type: .number) {
                        viewModel.inputNumber(1)
                    }
                    CalculatorButton(title: "2", type: .number) {
                        viewModel.inputNumber(2)
                    }
                    CalculatorButton(title: "3", type: .number) {
                        viewModel.inputNumber(3)
                    }
                    CalculatorButton(title: "=", type: .function) {
                        viewModel.calculate()
                    }
                }
                
                // Row 5: [0] [0] [.] [=]
                HStack(spacing: 1) {
                    CalculatorButton(title: "0", type: .number) {
                        viewModel.inputNumber(0)
                    }
                    CalculatorButton(title: "0", type: .number) {
                        viewModel.inputNumber(0)
                    }
                    CalculatorButton(title: ".", type: .function) {
                        viewModel.inputDecimal()
                    }
                    CalculatorButton(title: "=", type: .function) {
                        viewModel.calculate()
                    }
                }
            }
            .background(Color.black)
        }
        .background(Color.black)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    ContentView()
}
