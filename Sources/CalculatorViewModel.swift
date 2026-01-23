import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var displayText: String = "0"
    
    private var currentValue: Double = 0
    private var previousValue: Double = 0
    private var operation: CalculatorModel.Operation?
    private var isNewNumber: Bool = true
    
    func numberPressed(_ number: String) {
        if isNewNumber {
            displayText = number
            isNewNumber = false
        } else {
            // Check if adding digit would exceed 8 digits
            let newText = displayText + number
            let digitCount = newText.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "").count
            
            if digitCount <= 8 {
                displayText = newText
            }
        }
        currentValue = Double(displayText) ?? 0
    }
    
    func decimalPressed() {
        if isNewNumber {
            displayText = "0."
            isNewNumber = false
        } else if !displayText.contains(".") {
            displayText += "."
        }
    }
    
    func operationPressed(_ op: CalculatorModel.Operation) {
        if !isNewNumber {
            equalsPressed()
        }
        
        operation = op
        previousValue = currentValue
        isNewNumber = true
    }
    
    func equalsPressed() {
        guard let operation = operation else { return }
        
        let result = operation.perform(previousValue, currentValue)
        currentValue = result
        displayText = CalculatorModel.formatNumber(result)
        
        self.operation = nil
        isNewNumber = true
    }
    
    func clearPressed() {
        displayText = "0"
        currentValue = 0
        previousValue = 0
        operation = nil
        isNewNumber = true
    }
    
    func plusMinusPressed() {
        currentValue = CalculatorModel.toggleSign(currentValue)
        displayText = CalculatorModel.formatNumber(currentValue)
    }
    
    func percentPressed() {
        currentValue = CalculatorModel.calculatePercent(currentValue)
        displayText = CalculatorModel.formatNumber(currentValue)
    }
}
