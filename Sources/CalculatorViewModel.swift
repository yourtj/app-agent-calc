import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var display: String = "0"
    @Published var isResultDisplayed: Bool = false
    
    private var firstOperand: Double?
    private var currentOperation: Operation?
    private var waitingForOperand: Bool = false
    
    enum Operation: String, CaseIterable {
        case add = "+"
        case subtract = "−"
        case multiply = "×"
        case divide = "÷"
        
        func calculate(_ lhs: Double, _ rhs: Double) -> Double {
            switch self {
            case .add:
                return lhs + rhs
            case .subtract:
                return lhs - rhs
            case .multiply:
                return lhs * rhs
            case .divide:
                return rhs != 0 ? lhs / rhs : 0
            }
        }
    }
    
    func inputDigit(_ digit: Int) {
        if isResultDisplayed {
            display = String(digit)
            isResultDisplayed = false
        } else if display == "0" || waitingForOperand {
            display = String(digit)
            waitingForOperand = false
        } else {
            display += String(digit)
        }
    }
    
    func inputDecimal() {
        if isResultDisplayed {
            display = "0."
            isResultDisplayed = false
        } else if waitingForOperand {
            display = "0."
            waitingForOperand = false
        } else if !display.contains(".") {
            display += "."
        }
    }
    
    func performOperation(_ operation: Operation) {
        let currentValue = Double(display) ?? 0
        
        if let firstOperand = firstOperand, let currentOperation = currentOperation, !waitingForOperand {
            let result = currentOperation.calculate(firstOperand, currentValue)
            display = formatResult(result)
            self.firstOperand = result
            isResultDisplayed = true
        } else {
            firstOperand = currentValue
        }
        
        currentOperation = operation
        waitingForOperand = true
    }
    
    func calculate() {
        guard let firstOperand = firstOperand,
              let operation = currentOperation,
              let secondOperand = Double(display) else {
            return
        }
        
        let result = operation.calculate(firstOperand, secondOperand)
        display = formatResult(result)
        
        // Reset state after calculation
        self.firstOperand = nil
        currentOperation = nil
        waitingForOperand = false
        isResultDisplayed = true
    }
    
    func clear() {
        display = "0"
        firstOperand = nil
        currentOperation = nil
        waitingForOperand = false
        isResultDisplayed = false
    }
    
    private func formatResult(_ value: Double) -> String {
        // Remove unnecessary decimal places
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        } else {
            return String(value)
        }
    }
}
