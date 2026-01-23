import Foundation

struct CalculatorModel {
    enum Operation: String, CaseIterable {
        case add = "+"
        case subtract = "-"
        case multiply = "×"
        case divide = "÷"
        
        func perform(_ lhs: Double, _ rhs: Double) -> Double {
            switch self {
            case .add:
                return lhs + rhs
            case .subtract:
                return lhs - rhs
            case .multiply:
                return lhs * rhs
            case .divide:
                return rhs != 0 ? lhs / rhs : Double.nan
            }
        }
    }
    
    static func formatNumber(_ value: Double) -> String {
        if value.isNaN || value.isInfinite {
            return "Error"
        }
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 8
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .decimal
        
        let formattedString = formatter.string(from: NSNumber(value: value)) ?? "0"
        
        // Ensure maximum 8 digits
        if formattedString.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "").count > 8 {
            formatter.maximumSignificantDigits = 8
            return formatter.string(from: NSNumber(value: value)) ?? "Error"
        }
        
        return formattedString
    }
    
    static func toggleSign(_ value: Double) -> Double {
        return -value
    }
    
    static func calculatePercent(_ value: Double) -> Double {
        return value / 100
    }
}
