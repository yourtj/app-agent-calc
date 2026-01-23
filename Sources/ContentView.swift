import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    private let buttonSpacing: CGFloat = 12
    
    var body: some View {
        VStack(spacing: 0) {
            // Display Area
            displayArea
            
            // Button Grid
            buttonGrid
        }
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
    
    private var displayArea: some View {
        HStack {
            Spacer()
            Text(viewModel.displayText)
                .font(.system(size: displayFontSize, weight: .light, design: .monospaced))
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
        .frame(maxHeight: .infinity)
    }
    
    private var displayFontSize: CGFloat {
        let length = viewModel.displayText.count
        if length <= 6 {
            return 64
        } else if length == 7 {
            return 56
        } else {
            return 48
        }
    }
    
    private var buttonGrid: some View {
        VStack(spacing: buttonSpacing) {
            // Row 1: C, ±, %, ÷
            HStack(spacing: buttonSpacing) {
                CalculatorButton(title: "C", type: .function) {
                    viewModel.clearPressed()
                }
                CalculatorButton(title: "±", type: .function) {
                    viewModel.plusMinusPressed()
                }
                CalculatorButton(title: "%", type: .function) {
                    viewModel.percentPressed()
                }
                CalculatorButton(title: "÷", type: .operation) {
                    viewModel.operationPressed(.divide)
                }
            }
            
            // Row 2: 7, 8, 9, ×
            HStack(spacing: buttonSpacing) {
                CalculatorButton(title: "7", type: .number) {
                    viewModel.numberPressed("7")
                }
                CalculatorButton(title: "8", type: .number) {
                    viewModel.numberPressed("8")
                }
                CalculatorButton(title: "9", type: .number) {
                    viewModel.numberPressed("9")
                }
                CalculatorButton(title: "×", type: .operation) {
                    viewModel.operationPressed(.multiply)
                }
            }
            
            // Row 3: 4, 5, 6, -
            HStack(spacing: buttonSpacing) {
                CalculatorButton(title: "4", type: .number) {
                    viewModel.numberPressed("4")
                }
                CalculatorButton(title: "5", type: .number) {
                    viewModel.numberPressed("5")
                }
                CalculatorButton(title: "6", type: .number) {
                    viewModel.numberPressed("6")
                }
                CalculatorButton(title: "-", type: .operation) {
                    viewModel.operationPressed(.subtract)
                }
            }
            
            // Row 4: 1, 2, 3, +
            HStack(spacing: buttonSpacing) {
                CalculatorButton(title: "1", type: .number) {
                    viewModel.numberPressed("1")
                }
                CalculatorButton(title: "2", type: .number) {
                    viewModel.numberPressed("2")
                }
                CalculatorButton(title: "3", type: .number) {
                    viewModel.numberPressed("3")
                }
                CalculatorButton(title: "+", type: .operation) {
                    viewModel.operationPressed(.add)
                }
            }
            
            // Row 5: 0 (spans 2), ., =
            HStack(spacing: buttonSpacing) {
                // Zero button spans 2 columns
                CalculatorButton(title: "0", type: .number, isWide: true) {
                    viewModel.numberPressed("0")
                }
                
                CalculatorButton(title: ".", type: .number) {
                    viewModel.decimalPressed()
                }
                CalculatorButton(title: "=", type: .operation) {
                    viewModel.equalsPressed()
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
    }
}

struct CalculatorButton: View {
    enum ButtonType {
        case number
        case operation
        case function
    }
    
    let title: String
    let type: ButtonType
    let isWide: Bool
    let action: () -> Void
    
    init(title: String, type: ButtonType, isWide: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.type = type
        self.isWide = isWide
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(textColor)
                .frame(width: buttonWidth, height: 80)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
    
    private var buttonWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let totalSpacing: CGFloat = 48 + 36 // horizontal padding + button spacing
        let normalButtonWidth = (screenWidth - totalSpacing) / 4
        
        return isWide ? (normalButtonWidth * 2 + 12) : normalButtonWidth
    }
    
    private var backgroundColor: Color {
        switch type {
        case .number:
            return Color(red: 0.2, green: 0.2, blue: 0.2)
        case .operation:
            return Color.orange
        case .function:
            return Color(red: 0.6, green: 0.6, blue: 0.6)
        }
    }
    
    private var textColor: Color {
        switch type {
        case .number:
            return .white
        case .operation:
            return .white
        case .function:
            return .black
        }
    }
}

#Preview {
    ContentView()
}
