import Foundation

class CalculatorModel: ObservableObject {
    @Published var display = "0"
    @Published var isTyping = false
    
    private var accumulator: Double = 0
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    // MARK: - Number Input
    func addDigit(_ digit: String) {
        if isTyping {
            if display.count < 9 { // Prevent overflow
                display += digit
            }
        } else {
            display = digit
            isTyping = true
        }
    }
    
    func addDecimalPoint() {
        if !display.contains(".") {
            if isTyping {
                display += "."
            } else {
                display = "0."
                isTyping = true
            }
        }
    }
    
    // MARK: - Operations
    func performOperation(_ symbol: String) {
        switch symbol {
        case "C":
            clear()
        case "±":
            toggleSign()
        case "%":
            percentage()
        case "=":
            performPendingBinaryOperation()
        case "+", "−", "×", "÷":
            performBinaryOperation(symbol)
        default:
            break
        }
    }
    
    private func performBinaryOperation(_ symbol: String) {
        if isTyping {
            accumulator = Double(display) ?? 0
            isTyping = false
        }
        
        performPendingBinaryOperation()
        
        switch symbol {
        case "+":
            pendingBinaryOperation = PendingBinaryOperation(function: +, firstOperand: accumulator)
        case "−":
            pendingBinaryOperation = PendingBinaryOperation(function: -, firstOperand: accumulator)
        case "×":
            pendingBinaryOperation = PendingBinaryOperation(function: *, firstOperand: accumulator)
        case "÷":
            pendingBinaryOperation = PendingBinaryOperation(function: /, firstOperand: accumulator)
        default:
            break
        }
    }
    
    private func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && isTyping {
            let currentValue = Double(display) ?? 0
            accumulator = pendingBinaryOperation!.perform(with: currentValue)
            display = formatNumber(accumulator)
            pendingBinaryOperation = nil
            isTyping = false
        }
    }
    
    // MARK: - Utility Operations
    private func clear() {
        display = "0"
        accumulator = 0
        pendingBinaryOperation = nil
        isTyping = false
    }
    
    private func toggleSign() {
        if isTyping {
            if display.hasPrefix("-") {
                display.removeFirst()
            } else if display != "0" {
                display = "-" + display
            }
        } else {
            accumulator = -accumulator
            display = formatNumber(accumulator)
        }
    }
    
    private func percentage() {
        let currentValue = Double(display) ?? 0
        let result = currentValue / 100
        accumulator = result
        display = formatNumber(result)
        isTyping = false
    }
    
    // MARK: - Formatting
    private func formatNumber(_ number: Double) -> String {
        // Handle division by zero
        if number.isInfinite || number.isNaN {
            return "Error"
        }
        
        // Check if it's a whole number
        if number == floor(number) && abs(number) < 1e9 {
            return String(Int(number))
        }
        
        // Format with up to 6 decimal places, removing trailing zeros
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 6
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: number)) ?? "0"
    }
}
