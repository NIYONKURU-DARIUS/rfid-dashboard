# User Interface Interaction and Control Design

**RFID Systems Intelligence Laboratory Dashboard**

---

## 1. Buttons Design and Behavior

### 1.1 General Button Design

All buttons in the dashboard follow a consistent visual and functional standard to ensure predictability and safety.

**Visual Characteristics:**
- Rectangular shape with softly rounded corners
- Solid fill color with no heavy borders
- Clear text labels using a sans-serif font
- Icon support for critical actions (e.g., execute, purge)

**Button States:**
- **Default**: Visible and clickable
- **Hover**: Slight brightness increase to indicate interactivity
- **Active**: Temporary visual press effect when clicked
- **Disabled**: Reduced opacity when action is unavailable
- **Loading**: Spinner replaces text during processing

This design prevents accidental actions and clearly communicates system status.

### 1.2 Execute Transaction Button

The **Execute Transaction** button is the most critical action control in the system.

**Design Characteristics:**
- Prominent placement within the Top-Up Transaction panel
- Primary color to distinguish it from secondary actions
- Lock or confirmation icon to represent secure execution

**Behavior:**
- Disabled by default
- Enabled only when:
  - A valid UID is entered
  - A credit amount ≥ 1 RWF is provided
  - The system is connected to WebSocket and MQTT
- Displays a loading indicator while processing
- Shows success or failure feedback after execution

This ensures transaction integrity and prevents invalid operations.

### 1.3 Purge Logs Button

The **Purge Logs** button is treated as a high-risk administrative action.

**Design Characteristics:**
- Styled using a warning or danger color
- Positioned away from primary transaction controls
- Requires explicit user attention

**Behavior:**
- Triggers a confirmation dialog before execution
- Disabled for unauthorized users (if access control is enabled)
- Displays a confirmation message upon completion

---

## 2. Input Fields Design

### 2.1 UID Input Field

**Design:**
- Monospaced font to improve character distinction
- Uppercase formatting for consistency
- Placeholder example (e.g., `A1 B2 C3 D4`)

**Behavior:**
- Accepts only valid alphanumeric characters
- Automatically trims invalid input
- Displays inline error message for invalid UID formats

### 2.2 Credit Amount Input Field

**Design:**
- Numeric-only input
- Right-aligned text for financial readability
- Currency indicator (RWF) displayed beside the field

**Behavior:**
- Minimum value enforced (≥ 1 RWF)
- Prevents non-numeric input
- Shows validation feedback if amount is below minimum

---

## 3. Status Indicators

### 3.1 WebSocket Status Indicator

**Design:**
- Circular indicator with label text
- Color-coded state representation

**States:**
- **Green**: Connected
- **Yellow**: Connecting
- **Red**: Disconnected

**Behavior:**
- Updates automatically in real time
- Pulses gently when in connecting state

### 3.2 MQTT Broker Status Indicator

**Design:**
- Similar visual style to WebSocket indicator for consistency

**Behavior:**
- Updates based on broker connection state
- Displays "Offline" when connection is unavailable

---

## 4. System Overview Cards

Each system overview card presents a single metric.

**Design Characteristics:**
- Flat card design with subtle shadow
- Large numeric value for quick scanning
- Descriptive label below the value

**Behavior:**
- Updates dynamically without page reload
- Animates value changes smoothly
- Displays placeholder values when data is unavailable

---

## 5. Real-Time Data Streams

### 5.1 WebSocket Stream Panel

**Design:**
- Terminal-style panel with dark background
- Monospaced font for readability

**Behavior:**
- Auto-scrolls as new messages arrive
- Displays timestamps for each message
- Supports pause and resume of auto-scrolling

### 5.2 MQTT Message Panel

**Design:**
- Similar layout to WebSocket panel
- Topic and payload clearly separated

**Behavior:**
- Updates in real time
- Highlights critical messages using accent colors

---

## 6. Notifications and Feedback

**Types of Feedback:**
- Success notifications for completed transactions
- Error notifications for failed operations
- Warning notifications for system issues

**Design:**
- Toast-style notifications
- Positioned in the top-right corner
- Automatically dismiss after a short duration

---

## 7. Theme Toggle Control

**Design:**
- Icon-based button in the top-right corner of the header
- Sun icon (☀️) displayed in dark mode
- Moon icon (🌙) displayed in light mode

**Behavior:**
- Single click toggles between light and dark themes
- Preference saved to browser localStorage
- Smooth transition animation between themes
- All UI elements adapt colors automatically

**Theme Variants:**
- **Dark Mode**: Deep backgrounds with high-contrast text
- **Light Mode**: Clean white backgrounds with optimized readability

---

## 8. Accessibility and Usability Considerations

- Buttons have sufficient size for easy interaction
- Clear visual contrast between text and background
- Disabled controls clearly indicate unavailable actions
- Consistent design patterns reduce learning time
- Color-blind friendly status indicators with labels
- Keyboard navigation support for all interactive elements

---

## 9. Interaction Design Justification

This interaction design ensures:

✓ **Safe execution** of financial transactions  
✓ **Clear system state awareness**  
✓ **Reduced risk of user error**  
✓ **Professional laboratory-grade usability**  
✓ **Consistent visual language** across all components  
✓ **Accessible interface** for diverse user needs

---

## 10. Current Asset Card

**Design:**
- Physical RFID card visual representation
- Gradient background with glassmorphism effect
- Chip graphic for authenticity
- Monospaced UID display
- Large balance display with currency

**Behavior:**
- Glows/changes color when card is detected
- Balance animates smoothly when updated
- Shows "WAITING..." state when no card is present
- Auto-fills UID in transaction form when card is scanned

---

## 11. Operational Audit Trail

**Design:**
- Terminal-style log window
- Color-coded log entries by type:
  - **Blue**: System events
  - **Green**: Success operations
  - **Red**: Error messages
  - **Cyan**: Informational messages
- Timestamp for each entry
- Monospaced font for alignment

**Behavior:**
- New entries appear at the top
- Slide-in animation for new logs
- Auto-scrolls to show latest entries
- Maintains history until manually purged
- Maximum height with internal scrolling

---

*Document Version: 1.0*  
*Last Updated: 2026-02-12*
