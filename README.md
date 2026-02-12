# RFID Systems Intelligence Dashboard

A premium, real-time RFID card management dashboard with advanced UI/UX interactions, built for laboratory-grade operations.

![Dashboard Preview](https://img.shields.io/badge/Status-Live-success)
![Version](https://img.shields.io/badge/Version-2.0-blue)

## 🌐 Live Demo

**Access the dashboard at:** [http://157.173.101.159:9257/dashboard.html](http://157.173.101.159:9257/dashboard.html)

## ✨ Features

### 🎨 Premium Visual Design
- **Glassmorphism Effects**: Modern backdrop-blur UI with depth
- **Animated Background**: Dynamic floating mesh orbs
- **Day/Night Theme**: Seamless light/dark mode switching with localStorage persistence
- **Smooth Animations**: Entry animations, transitions, and micro-interactions

### 💳 RFID Card Management
- **Real-time Card Detection**: Visual RFID card representation with glow effects
- **Balance Display**: Animated counter showing current card balance
- **Auto-fill UID**: Automatically populates transaction form when card is scanned
- **Top-up Transactions**: Secure credit addition with validation

### 🔔 Advanced UI/UX Interactions
- **Toast Notifications**: Color-coded success/error/warning/info messages
- **Confirmation Dialogs**: Prevents accidental destructive actions
- **Real-time Input Validation**: Inline error messages with visual feedback
- **Loading States**: Spinner animations during async operations
- **Smart Button States**: Enable/disable based on form validity

### 📊 System Monitoring
- **WebSocket Status**: Real-time connection monitoring (Connecting/Online/Offline)
- **MQTT Broker Status**: Live broker connection state
- **Active Sessions**: Current connected client count
- **Operational Audit Trail**: Color-coded, timestamped event logs

### ♿ Accessibility
- **ARIA Labels**: Full screen reader support
- **Keyboard Navigation**: Tab through all controls, Escape to close dialogs
- **Focus Indicators**: Visible outlines on interactive elements
- **Live Regions**: Dynamic content announced to assistive technologies

## 🛠️ Technology Stack

- **Frontend**: Pure HTML5, CSS3, JavaScript (ES6+)
- **Styling**: Custom CSS with CSS Variables for theming
- **Typography**: Google Fonts (Outfit)
- **Communication**: WebSocket API for real-time updates
- **Backend Integration**: RESTful API (`/topup`, `/health`)
- **Protocol**: MQTT for IoT messaging

## 📋 Prerequisites

- Modern web browser (Chrome, Firefox, Safari, Edge)
- WebSocket server running on the backend
- MQTT broker configured and accessible
- Node.js backend server (for `/topup` and `/health` endpoints)

## 🚀 Getting Started

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/rfid-dashboard.git
   cd rfid-dashboard
   ```

2. **Open the dashboard**
   - Simply open `dashboard.html` in your browser
   - Or use a local server:
     ```bash
     python -m http.server 8000
     # Navigate to http://localhost:8000/dashboard.html
     ```

3. **Configure Backend**
   - Ensure your WebSocket server is running
   - Update the `WS_URL` in the script if needed (defaults to same origin)

### Deployment

The dashboard is currently deployed at:
```
http://157.173.101.159:9257/dashboard.html
```

To deploy to your own server:
```bash
# Copy dashboard.html to your web server
scp dashboard.html user@your-server:/var/www/html/

# Or use the provided deploy script
chmod +x Deploy.sh
./Deploy.sh
```

## 📖 Usage Guide

### Scanning RFID Cards
1. Place an RFID card near the reader
2. Card UID and balance will display automatically
3. The card visual will glow green upon detection

### Top-up Transaction
1. Enter the card UID (or wait for auto-fill after scanning)
2. Enter the credit amount (minimum 1 RWF)
3. Click "Execute Transaction"
4. Wait for confirmation toast notification

### Viewing Logs
- All system events appear in the Operational Audit Trail
- Color-coded by type: Blue (system), Green (success), Red (error), Cyan (info)
- Click "Purge Logs" to clear (requires confirmation)

### Theme Switching
- Click the sun/moon icon in the top-right corner
- Theme preference is saved automatically

## 🎯 API Endpoints

### POST `/topup`
Add credit to an RFID card.

**Request:**
```json
{
  "uid": "A1 B2 C3 D4",
  "amount": 100
}
```

**Response:**
```json
{
  "success": true,
  "new_balance": 100
}
```

### GET `/health`
Check system health status.

**Response:**
```json
{
  "mqtt_connected": true,
  "websocket_clients": 3
}
```

## 🔧 Configuration

### WebSocket Connection
The dashboard automatically connects to the WebSocket server at the same origin. To use a different server:

```javascript
// In dashboard.html, modify:
const WS_URL = 'ws://your-server:port';
```

### Theme Customization
Modify CSS variables in the `:root` selector:

```css
:root {
    --primary: #8b5cf6;
    --secondary: #3b82f6;
    --accent: #10b981;
    /* ... more variables */
}
```

## 📁 Project Structure

```
rfid-dashboard/
├── dashboard.html          # Main dashboard file (self-contained)
├── UI_UX_DESIGN.md        # Detailed UI/UX interaction documentation
├── Deploy.sh              # Deployment script
└── README.md              # This file
```

## 👥 Team

**Team Darius_Divine_Louise**

## 📄 License

This project is part of an IoT Architecture Framework laboratory assignment.

## 🙏 Acknowledgments

- **Instructor**: Gabriel Baziramwabo
- **Framework**: IoT Architecture Framework v2.4
- **Protocol**: Real-time Publish-Subscribe via MQTT & WebSocket

## 🐛 Troubleshooting

### WebSocket Connection Issues
- Ensure the backend server is running
- Check firewall settings
- Verify the WebSocket URL is correct

### MQTT Not Connecting
- Confirm MQTT broker is accessible
- Check broker credentials and permissions
- Review backend server logs

### Card Not Detected
- Verify RFID reader is connected
- Check backend RFID processing service
- Review WebSocket message format

## 📞 Support

For issues or questions, please open an issue on GitHub or contact the development team.

---

**Built with ❤️ for IoT Architecture & Real-time Systems**
