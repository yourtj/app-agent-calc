import SwiftUI

enum ButtonType {
    case number
    case operation
    case equals
    case clear
}

struct CalculatorButton: View {
    let title: String
    let type: ButtonType
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(foregroundColor)
                .frame(width: buttonWidth, height: buttonHeight)
                .background(backgroundColor)
                .cornerRadius(buttonHeight / 2)
        }
    }
    
    private var buttonWidth: CGFloat {
        switch type {
        case .number, .operation, .equals, .clear:
            return 70
        }
    }
    
    private var buttonHeight: CGFloat {
        return 70
    }
    
    private var backgroundColor: Color {
        switch type {
        case .number:
            return Color(.systemGray2)
        case .operation:
            return Color(.systemOrange)
        case .equals:
            return Color(.systemOrange)
        case .clear:
            return Color(.systemGray)
        }
    }
    
    private var foregroundColor: Color {
        switch type {
        case .number:
            return .primary
        case .operation, .equals:
            return .white
        case .clear:
            return .primary
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        HStack(spacing: 10) {
            CalculatorButton(title: "7", type: .number) { }
            CalculatorButton(title: "+", type: .operation) { }
            CalculatorButton(title: "=", type: .equals) { }
            CalculatorButton(title: "C", type: .clear) { }
        }
    }
    .padding()
}
