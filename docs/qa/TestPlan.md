# TestPlan.md

## Test Plan for Simple iOS Calculator App

### Test Scope
This test plan covers all features and requirements specified in the PRD for the Simple iOS Calculator App.

---

## 1. Basic Arithmetic Operations Tests

### 1.1 Addition Tests
**TC001**: Basic Addition
- **Steps**: Enter "5", tap "+", enter "3", tap "="
- **Expected**: Display shows "8"

**TC002**: Multiple Additions
- **Steps**: Enter "2", tap "+", enter "3", tap "+", enter "4", tap "="
- **Expected**: Display shows "9"

**TC003**: Addition with Decimals
- **Steps**: Enter "1.5", tap "+", enter "2.5", tap "="
- **Expected**: Display shows "4"

### 1.2 Subtraction Tests
**TC004**: Basic Subtraction
- **Steps**: Enter "10", tap "-", enter "3", tap "="
- **Expected**: Display shows "7"

**TC005**: Negative Result
- **Steps**: Enter "5", tap "-", enter "8", tap "="
- **Expected**: Display shows "-3"

**TC006**: Subtraction with Decimals
- **Steps**: Enter "5.5", tap "-", enter "2.2", tap "="
- **Expected**: Display shows "3.3"

### 1.3 Multiplication Tests
**TC007**: Basic Multiplication
- **Steps**: Enter "4", tap "×", enter "5", tap "="
- **Expected**: Display shows "20"

**TC008**: Multiplication by Zero
- **Steps**: Enter "7", tap "×", enter "0", tap "="
- **Expected**: Display shows "0"

**TC009**: Multiplication with Decimals
- **Steps**: Enter "2.5", tap "×", enter "4", tap "="
- **Expected**: Display shows "10"

### 1.4 Division Tests
**TC010**: Basic Division
- **Steps**: Enter "15", tap "÷", enter "3", tap "="
- **Expected**: Display shows "5"

**TC011**: Division by Zero
- **Steps**: Enter "10", tap "÷", enter "0", tap "="
- **Expected**: Display shows "Error"

**TC012**: Division with Decimals
- **Steps**: Enter "7.5", tap "÷", enter "2.5", tap "="
- **Expected**: Display shows "3"

---

## 2. Essential Functions Tests

### 2.1 Number Input Tests (0-9)
**TC013**: Single Digit Input
- **Steps**: Tap "7"
- **Expected**: Display shows "7"

**TC014**: Multi-Digit Input
- **Steps**: Tap "1", "2", "3"
- **Expected**: Display shows "123"

**TC015**: Leading Zero Handling
- **Steps**: Tap "0", "5"
- **Expected**: Display shows "5" (not "05")

### 2.2 Decimal Point Tests
**TC016**: Basic Decimal Input
- **Steps**: Tap "3", ".", "1", "4"
- **Expected**: Display shows "3.14"

**TC017**: Decimal Without Leading Number
- **Steps**: Tap ".", "5"
- **Expected**: Display shows "0.5"

**TC018**: Multiple Decimal Points
- **Steps**: Tap "3", ".", "1", ".", "4"
- **Expected**: Display shows "3.1" (second decimal ignored)

### 2.3 Clear Function Tests
**TC019**: Clear Current Number
- **Steps**: Enter "123", tap "C"
- **Expected**: Display shows "0"

**TC020**: Clear During Operation
- **Steps**: Enter "5", tap "+", enter "3", tap "C"
- **Expected**: Display shows "0", previous operation cleared

**TC021**: Clear After Calculation
- **Steps**: Enter "5", tap "+", "3", tap "=", tap "C"
- **Expected**: Display shows "0"

### 2.4 Equals Function Tests
**TC022**: Basic Equals Operation
- **Steps**: Enter "6", tap "+", "4", tap "="
- **Expected**: Display shows "10"

**TC023**: Consecutive Equals
- **Steps**: Enter "5", tap "+", "3", tap "=", tap "="
- **Expected**: First "=" shows "8", second "=" shows "11"

**TC024**: Equals Without Operation
- **Steps**: Enter "42", tap "="
- **Expected**: Display shows "42"

---

## 3. Display Tests

### 3.1 8-Digit Display Limit
**TC025**: Maximum Digit Display
- **Steps**: Enter "12345678"
- **Expected**: Display shows "12345678"

**TC026**: Exceed 8-Digit Input
- **Steps**: Enter "123456789"
- **Expected**: Display shows "12345678" (9th digit ignored)

**TC027**: 8-Digit Result
- **Steps**: Enter "9999", tap "×", "9999", tap "="
- **Expected**: Display shows truncated result within 8 digits

### 3.2 Auto-Resize Text
**TC028**: Text Resize on Long Numbers
- **Steps**: Enter "12345678"
- **Expected**: Text automatically resizes to fit within display width

**TC029**: Text Size Reset on Short Numbers
- **Steps**: Enter "12345678", tap "C", enter "5"
- **Expected**: Text returns to normal size for single digit

### 3.3 Display Formatting
**TC030**: Right-Aligned Display
- **Steps**: Enter any number
- **Expected**: Number appears right-aligned in display

**TC031**: Monospaced Font
- **Steps**: Enter "11111" then "22222"
- **Expected**: Both numbers have consistent character spacing

---

## 4. User Interface Tests

### 4.1 Portrait Orientation
**TC032**: Portrait Mode Lock
- **Steps**: Rotate device to landscape
- **Expected**: App remains in portrait orientation

### 4.2 Button Layout Tests
**TC033**: 4x5 Grid Layout
- **Steps**: Launch app
- **Expected**: 20 buttons arranged in 4 columns, 5 rows

**TC034**: Button Tap Responsiveness
- **Steps**: Tap each button rapidly
- **Expected**: All buttons respond immediately to taps

**TC035**: Large Tappable Buttons
- **Steps**: Tap buttons with finger
- **Expected**: Buttons are easily tappable, no missed taps

### 4.3 Styling Tests
**TC036**: High Contrast Colors
- **Steps**: View app in normal lighting
- **Expected**: Button text clearly visible against button backgrounds

**TC037**: System Font Usage
- **Steps**: Compare with other iOS apps
- **Expected**: App uses standard iOS system fonts

**TC038**: Standard iOS Calculator Styling
- **Steps**: Compare visual appearance
- **Expected**: Buttons and layout match iOS calculator aesthetic

---

## 5. Edge Cases and Error Handling

### 5.1 Division by Zero
**TC039**: Division by Zero Error
- **Steps**: Any number ÷ 0
- **Expected**: Display shows "Error"

**TC040**: Recovery from Error State
- **Steps**: Cause error, then tap "C"
- **Expected**: Display returns to "0", normal operation resumes

### 5.2 Overflow Handling
**TC041**: Large Number Multiplication
- **Steps**: "9999" × "9999"
- **Expected**: Result displayed within 8-digit constraint

**TC042**: Large Number Addition
- **Steps**: "99999999" + "1"
- **Expected**: Overflow handled gracefully

### 5.3 Operation Chaining
**TC043**: Multiple Operations
- **Steps**: "2" + "3" × "4"
- **Expected**: Operations processed left-to-right: ((2+3)×4) = 20

**TC044**: Operation Button Replacement
- **Steps**: "5" + "-" (immediately)
- **Expected**: Addition replaced with subtraction

---

## 6. Device Compatibility Tests

### 6.1 Screen Size Adaptation
**TC045**: iPhone SE Display
- **Steps**: Run on iPhone SE
- **Expected**: All buttons visible and properly sized

**TC046**: iPhone Pro Max Display
- **Steps**: Run on iPhone Pro Max
- **Expected**: Layout scales appropriately, buttons remain tappable

### 6.2 iOS Version Compatibility
**TC047**: iOS Version Support
- **Steps**: Test on supported iOS versions
- **Expected**: App functions identically across versions

---

## Test Environment
- **Devices**: iPhone SE, iPhone 14, iPhone 15 Pro Max
- **iOS Versions**: Latest supported versions
- **Test Data**: Various numeric inputs including edge cases
- **Prerequisites**: App installed and launched successfully

## Pass/Fail Criteria
- **PASS**: All specified functionality works as described in PRD
- **FAIL**: Any core feature missing or not working as specified
- **CRITICAL**: Division by zero handling, 8-digit limit, basic arithmetic operations