# Design.md

## iOS Calculator App - Architecture Design

### Core Architecture

**Pattern**: MVVM (Model-View-ViewModel)
- **Model**: CalculatorModel - Pure business logic for arithmetic operations
- **View**: SwiftUI Views - UI components and layout
- **ViewModel**: CalculatorViewModel - ObservableObject managing state and user interactions

### Data Flow

```
User Input → ViewModel → Model → ViewModel → View Update
```

### State Management

**CalculatorViewModel** manages:
- `displayText`: Current display string (max 8 digits)
- `currentValue`: Current numeric value
- `previousValue`: Previous value for operations
- `operation`: Current selected operation
- `isNewNumber`: Flag for number input state

### UI Architecture

**ContentView Structure**:
- VStack container
- Display area (Text view with dynamic font sizing)
- Button grid (LazyVGrid with 4 columns, 5 rows)
- 20 total buttons as specified in PRD

**Button Layout** (4x5 grid):
```
Row 1: [C] [÷] [×] [-]
Row 2: [7] [8] [9] [+]
Row 3: [4] [5] [6] [+]
Row 4: [1] [2] [3] [=]
Row 5: [0] [0] [.] [=]
```

Note: Zero button spans 2 columns, Plus and Equals buttons span 2 rows

### Button Types

**NumberButton**: 0-9 digits
**OperationButton**: +, -, ×, ÷
**FunctionButton**: C (Clear), = (Equals), . (Decimal)

### Display Logic

- Maximum 8-digit display
- Dynamic font sizing when text exceeds width
- Right-aligned text
- Monospaced font for consistent spacing

### Business Logic

**CalculatorModel** handles:
- Arithmetic operations (add, subtract, multiply, divide)
- Number formatting and validation
- Decimal point handling
- Clear functionality

### Error Handling

- Division by zero returns "Error"
- Invalid operations maintain current display
- Overflow beyond 8 digits shows truncated result

### Styling

- High contrast button colors
- Standard iOS calculator appearance
- Portrait orientation lock
- Responsive button sizing
- System fonts with appropriate weights