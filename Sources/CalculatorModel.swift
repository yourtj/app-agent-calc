import Foundation

class CalculatorModel: ObservableObject {
    @Published var displayValue: String = "0"
    
    private var accumulator: Double = 0
    private var pendingBinaryOperation: PendingBinaryOperation?
    private var isTypingNumber: Bool = false
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    // MARK: - Number Input
    
    func addDigit(_ digit: String) {
        if displayValue.count >= 8 && isTypingNumber {
            return // Enforce 8-digit maximum
        }
        
        if isTypingNumber {
            if displayValue.count < 8 {
                displayValue += digit
            }
        } else {
            displayValue = digit
            isTypingNumber = true
        }
    }
    
    func addDecimalPoint() {
        if displayValue.contains(".") {
            return // Prevent multiple decimal points
        }
        
        if !isTypingNumber {
            displayValue = "0."
            isTypingNumber = true
        } else {
            if displayValue.count < 8 {
                displayValue += "."
            }
        }
    }
    
    // MARK: - Operations
    
    func performOperation(_ symbol: String) {
        switch symbol {
        case "C":
            clear()
        case "=":
            performPendingBinaryOperation()
        case "+":
            performBinaryOperation { $0 + $1 }
        case "-":
            performBinaryOperation { $0 - $1 }
        case "×":
            performBinaryOperation { $0 * $1 }
        case "÷":
            performBinaryOperation { $1 == 0 ? Double.nan : $0 / $1 }
        default:
            break
        }
    }
    
    private func performBinaryOperation(_ operation: @escaping (Double, Double) -> Double) {
        if let value = Double(displayValue) {
            accumulator = value
        }
        
        performPendingBinaryOperation()
        
        pendingBinaryOperation = PendingBinaryOperation(
            function: operation,
            firstOperand: accumulator
        )
        
        isTypingNumber = false
    }
    
    private func performPendingBinaryOperation() {
        if let pending = pendingBinaryOperation, let value = Double(displayValue) {
            let result = pending.perform(with: value)
            
            if result.isNaN || result.isInfinite {
                displayValue = "Error"
                clear()
                return
            }
            
            accumulator = result
            displayValue = formatResult(result)
            pendingBinaryOperation = nil
        }
    }
    
    private func clear() {
        displayValue = "0"
        accumulator = 0
        pendingBinaryOperation = nil
        isTypingNumber = false
    }
    
    private func formatResult(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 8
        formatter.minimumFractionDigits = 0
        
        let result = formatter.string(from: NSNumber(value: value)) ?? "0"
        
        // Ensure result doesn't exceed 8 characters
        if result.count > 8 {
            return String(result.prefix(8))
        }
        
        return result
    }
}
