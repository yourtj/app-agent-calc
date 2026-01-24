# TestPlan.md

## Test Plan for Simple iOS Calculator App

### Test Scope
Testing the iOS Calculator App as defined in the PRD to verify all core features, UI requirements, and specified functionality.

### Test Environment
- iOS Simulator/Device
- Various iPhone screen sizes
- Portrait orientation only

## Test Categories

### 1. Basic Arithmetic Operations

**TC-001: Addition Operation**
- **Precondition**: App is launched and display shows "0"
- **Steps**: 
  1. Tap "5"
  2. Tap "+"
  3. Tap "3"
  4. Tap "="
- **Expected Result**: Display shows "8"

**TC-002: Subtraction Operation**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap "9"
  2. Tap "-"
  3. Tap "4"
  4. Tap "="
- **Expected Result**: Display shows "5"

**TC-003: Multiplication Operation**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap "6"
  2. Tap "×"
  3. Tap "7"
  4. Tap "="
- **Expected Result**: Display shows "42"

**TC-004: Division Operation**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap "8"
  2. Tap "÷"
  3. Tap "2"
  4. Tap "="
- **Expected Result**: Display shows "4"

**TC-005: Division by Zero**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap "5"
  2. Tap "÷"
  3. Tap "0"
  4. Tap "="
- **Expected Result**: Display shows error indication (not specified in PRD, but should handle gracefully)

### 2. Essential Functions

**TC-006: Clear Function**
- **Precondition**: Display shows any number (e.g., "123")
- **Steps**:
  1. Tap "C"
- **Expected Result**: Display shows "0" and calculation is reset

**TC-007: Number Input (0-9)**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap each digit button 0-9 sequentially
- **Expected Result**: Each digit appears correctly on display

**TC-008: Decimal Point Support**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap "5"
  2. Tap "."
  3. Tap "2"
- **Expected Result**: Display shows "5.2"

**TC-009: Multiple Decimal Points Prevention**
- **Precondition**: Display shows "5.2"
- **Steps**:
  1. Tap "."
- **Expected Result**: No additional decimal point is added (display remains "5.2")

### 3. Display Requirements

**TC-010: Maximum 8-Digit Display**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap digits to input "12345678"
- **Expected Result**: Display shows "12345678" (8 digits)

**TC-011: Exceed 8-Digit Input Handling**
- **Precondition**: Display shows "12345678"
- **Steps**:
  1. Tap "9"
- **Expected Result**: Display should handle overflow appropriately (either reject input or show truncated result)

**TC-012: Auto-Resize Text**
- **Precondition**: Display shows "12345678" (8 digits)
- **Steps**:
  1. Observe text size
- **Expected Result**: Text should auto-resize to fit within display width

**TC-013: Single Line Display**
- **Precondition**: App is running
- **Steps**:
  1. Input any number or perform any calculation
- **Expected Result**: All display text appears on a single line

### 4. User Interface

**TC-014: Portrait Orientation Only**
- **Precondition**: App is running in portrait mode
- **Steps**:
  1. Rotate device to landscape
- **Expected Result**: App remains in portrait orientation or handles rotation appropriately

**TC-015: Button Layout Verification**
- **Precondition**: App is launched
- **Steps**:
  1. Observe button layout
- **Expected Result**: 4x5 grid layout with 20 buttons total as specified in PRD

**TC-016: Large Tappable Buttons**
- **Precondition**: App is launched
- **Steps**:
  1. Tap each button
- **Expected Result**: All buttons are easily tappable and respond to touch

**TC-017: High Contrast Colors**
- **Precondition**: App is launched
- **Steps**:
  1. Observe button styling
- **Expected Result**: Buttons display with high contrast colors for good visibility

**TC-018: System Font Usage**
- **Precondition**: App is launched
- **Steps**:
  1. Observe text fonts
- **Expected Result**: App uses system font throughout interface

**TC-019: Standard iOS Calculator Button Styling**
- **Precondition**: App is launched
- **Steps**:
  1. Compare button appearance to standard iOS calculator
- **Expected Result**: Buttons follow standard iOS calculator styling patterns

### 5. Calculation Workflow

**TC-020: Sequential Operations**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap "2"
  2. Tap "+"
  3. Tap "3"
  4. Tap "×"
  5. Tap "4"
  6. Tap "="
- **Expected Result**: Display shows "20" (following standard calculator precedence)

**TC-021: Decimal Calculations**
- **Precondition**: App is launched and display shows "0"
- **Steps**:
  1. Tap "2"
  2. Tap "."
  3. Tap "5"
  4. Tap "+"
  5. Tap "1"
  6. Tap "."
  7. Tap "5"
  8. Tap "="
- **Expected Result**: Display shows "4" or "4.0"

### 6. Different iPhone Screen Sizes

**TC-022: Small Screen Compatibility**
- **Precondition**: App running on smaller iPhone screen
- **Steps**:
  1. Verify all buttons are visible and accessible
  2. Test basic calculator operations
- **Expected Result**: App functions correctly with appropriate sizing

**TC-023: Large Screen Compatibility**
- **Precondition**: App running on larger iPhone screen
- **Steps**:
  1. Verify layout scales appropriately
  2. Test basic calculator operations
- **Expected Result**: App functions correctly with appropriate sizing

### Test Execution Priority
- **Priority 1**: Basic arithmetic operations (TC-001 to TC-004)
- **Priority 2**: Essential functions (TC-006 to TC-009)
- **Priority 3**: Display requirements (TC-010 to TC-013)
- **Priority 4**: UI verification (TC-014 to TC-019)
- **Priority 5**: Advanced workflows (TC-020 to TC-023)

### Success Criteria
- All Priority 1 and Priority 2 tests must pass
- No crashes during normal calculator operations
- UI is responsive and follows iOS design standards
- App functions correctly on different iPhone screen sizes