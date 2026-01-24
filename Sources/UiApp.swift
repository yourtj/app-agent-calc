import SwiftUI

struct CalculatorButton: View {
    let title: String
    let type: ButtonType
    let action: () -> Void
    
    enum ButtonType {
        case number
        case operation
        case special
        case clear
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(foregroundColor)
                .frame(width: buttonWidth, height: buttonHeight)
                .background(backgroundColor)
                .cornerRadius(buttonCornerRadius)
        }
    }
    
    // MARK: - Private Properties (Stubs)
    
    private var buttonWidth: CGFloat {
        // TODO: Implement dynamic width calculation
        80
    }
    
    private var buttonHeight: CGFloat {
        // TODO: Implement dynamic height calculation
        80
    }
    
    private var buttonCornerRadius: CGFloat {
        // TODO: Implement corner radius calculation
        10
    }
    
    private var backgroundColor: Color {
        // TODO: Implement color scheme based on button type
        switch type {
        case .number:
            return .gray
        case .operation:
            return .orange
        case .special:
            return .blue
        case .clear:
            return .red
        }
    }
    
    private var foregroundColor: Color {
        // TODO: Implement text color based on button type
        .white
    }
}

// MARK: - Preview

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CalculatorButton(title: "1", type: .number) {
                // TODO: Implement action
            }
            
            CalculatorButton(title: "+", type: .operation) {
                // TODO: Implement action
            }
            
            CalculatorButton(title: "AC", type: .clear) {
                // TODO: Implement action
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
