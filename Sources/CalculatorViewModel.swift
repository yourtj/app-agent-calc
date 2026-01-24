import Foundation
import Combine

class CalculatorViewModel: ObservableObject {
    @Published var display: String = "0"
    @Published var previousValue: Double = 0
    @Published var currentOperation: Operation?
    @Published var shouldResetDisplay = false
    
    private let maxDigits = 8
    
    enum Operation: String, CaseIterable {
        case add = "+"
        case subtract = "−"
        case multiply = "×"
        case divide = "÷"
        case equals = "="
        
        func calculate(_ a: Double, _ b: Double) -> Double {
            switch self {
            case .add:
                return a + b
            case .subtract:
                return a - b
            case .multiply:
                return a * b
            case .divide:
                return b != 0 ? a / b : 0
            case .equals:
                return b
            }
        }
    }
    
    func inputNumber(_ number: String) {
        if shouldResetDisplay {
            display = number
            shouldResetDisplay = false
        } else {
            if display == "0" {
                display = number
            } else {
                // Check if adding this digit would exceed the limit
                let newDisplay = display + number
                if newDisplay.replacingOccurrences(of: ".", with: "").count <= maxDigits {
                    display = newDisplay
                }
            }
        }
    }
    
    func inputDecimal() {
        if shouldResetDisplay {
            display = "0."
            shouldResetDisplay = false
        } else if !display.contains(".") {
            // Check if adding decimal point would exceed limit
            let newDisplay = display + "."
            if newDisplay.replacingOccurrences(of: ".", with: "").count <= maxDigits {
                display = newDisplay
            }
        }
    }
    
    func inputOperation(_ operation: Operation) {
        if let currentOp = currentOperation, !shouldResetDisplay {
            performCalculation()
        } else {
            previousValue = Double(display) ?? 0
        }
        
        currentOperation = operation
        shouldResetDisplay = true
    }
    
    func performCalculation() {
        guard let operation = currentOperation else { return }
        
        let currentValue = Double(display) ?? 0
        let result = operation.calculate(previousValue, currentValue)
        
        // Format result to fit within 8 digits
        display = formatResult(result)
        
        previousValue = result
        currentOperation = nil
        shouldResetDisplay = true
    }
    
    func clear() {
        display = "0"
        previousValue = 0
        currentOperation = nil
        shouldResetDisplay = false
    }
    
    private func formatResult(_ value: Double) -> String {
        // Handle special cases
        if value.isInfinite {
            return "Error"
        }
        if value.isNaN {
            return "Error"
        }
        
        let absValue = abs(value)
        let isNegative = value < 0
        let availableDigits = maxDigits - (isNegative ? 1 : 0)
        
        // For very large numbers, use scientific notation
        if absValue >= pow(10, Double(availableDigits)) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .scientific
            formatter.maximumSignificantDigits = availableDigits - 3 // Account for "E+XX"
            return formatter.string(from: NSNumber(value: value)) ?? "Error"
        }
        
        // For regular numbers, remove unnecessary decimal places
        if value == floor(value) && absValue < pow(10, Double(availableDigits)) {
            return String(Int(value))
        }
        
        // For decimal numbers, limit decimal places to fit
        let integerPart = String(Int(absValue))
        let availableDecimalPlaces = availableDigits - integerPart.count - 1 // -1 for decimal point
        
        if availableDecimalPlaces > 0 {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = availableDecimalPlaces
            formatter.minimumFractionDigits = 0
            return formatter.string(from: NSNumber(value: value)) ?? String(value)
        }
        
        return String(Int(value))
    }
    
    // Helper function to determine if display should use smaller font
    func shouldUseSmallerFont() -> Bool {
        return display.count > 6
    }
}
