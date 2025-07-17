## Pcb Lab - Soldering a Sonic Led Level Meter

## Wiring with breadboard

<img src="https://images2.imgbox.com/65/12/pN5P1pMs_o.gif" width=400>

## Ultrasonic Distance Sensor

### 🦇 What It Is

> "Imagine yelling in a canyon. The longer it takes to hear your echo, the farther away the wall is. This sensor does the same thing, but in bat-squeak mode."

The **HC-SR04** is an **ultrasonic distance sensor** that works like echolocation:

1. It **emits** a high-frequency sound pulse (inaudible to humans).
2. It **waits** to receive the echo when the sound bounces off an object.
3. It calculates **distance based on time**:
   > Distance = (Speed of Sound × Time) ÷ 2  
   > (You divide by 2 because the sound goes _there and back_.)

---

### ⚡ Pin Overview (4 Pins)

```
 +-------------------------------------+
 |  [ VCC ]  [ TRIG ] [ ECHO ]  [ GND ]|
 +-------------------------------------+
```

#### 🧷 1. **VCC**

- **What it is:** Power supply
- **Voltage:** 5V (required, even if your microcontroller is 3.3V)
- **Connect to:** `5V` pin on Arduino or regulated 5V on Raspberry Pi

---

#### ⚙️ 2. **TRIG** (Trigger)

- **What it is:** **Input pin** – tells the sensor to fire
- **Signal:** You send a **HIGH pulse of at least 10 microseconds**
- **Action:** Starts the ultrasonic burst

```cpp
// Example:
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
```

---

#### 🎧 3. **ECHO**

- **What it is:** **Output pin** – reports how long the echo took
- **Signal:** Outputs a **pulse in microseconds**
- **Length of pulse** = round-trip travel time of the sound
- You measure this using something like `pulseIn(echoPin, HIGH);` in Arduino.

```cpp
long duration = pulseIn(echoPin, HIGH);
float distance_cm = duration * 0.034 / 2;
```

Why 0.034? Because **sound travels ~0.034 cm per µs**

---

#### 🪫 4. **GND**

- **Ground / 0V**
- Must be connected to your microcontroller’s GND or all bets are off.

---

### 📏 Typical Operating Range

| Range      | Value              |
| ---------- | ------------------ |
| Min        | ~2 cm              |
| Max        | ~400 cm (4 meters) |
| Accuracy   | ~±3 mm             |
| Cone width | ~15°               |

---


---

### 🧪 Quick Wiring Table

| Sensor Pin | Connects To (Arduino)  |
| ---------- | ---------------------- |
| VCC        | 5V                     |
| GND        | GND                    |
| TRIG       | Digital pin (e.g., 9)  |
| ECHO       | Digital pin (e.g., 10) |

---

### ✅ TL;DR

| Pin  | Type   | Description                              |
| ---- | ------ | ---------------------------------------- |
| VCC  | Power  | 5V power in                              |
| GND  | Power  | Ground                                   |
| TRIG | Input  | Send a short pulse to start measurement  |
| ECHO | Output | Outputs pulse duration based on distance |

---
