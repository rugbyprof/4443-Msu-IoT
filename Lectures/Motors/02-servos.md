## 🧠 Overview: Servo Motors

### ✅ What is a Servo Motor?

A **servo motor** is a type of motor with:

- Built-in **position feedback**
- A control board
- A limited **range of motion** (typically **0°–180°**)

> You send a **PWM signal** that represents the target angle, and the servo moves to that angle and holds its position.

---

### 🧰 How It’s Controlled

| Signal            | Description                                      |
| ----------------- | ------------------------------------------------ |
| PWM (Pulse Width) | Pulse every 20 ms, with width between 0.5–2.5 ms |
| 0.5 ms pulse →    | ~0° angle                                        |
| 1.5 ms pulse →    | ~90° (center)                                    |
| 2.5 ms pulse →    | ~180° angle                                      |

### 📦 Arduino Handles All This with the `Servo` Library

---

### 🧪 Typical Servo Wiring

| Servo Wire Color | Connects To                      |
| ---------------- | -------------------------------- |
| **Red**          | +5V (Arduino or external source) |
| **Brown/Black**  | GND                              |
| **Orange/White** | Signal (e.g., D6)                |

> For standard hobby servos, power can come from Arduino 5V for light-duty applications. For stronger servos: use an external 5V power supply with **common ground**.

---

## 🧪 Example: IR-Controlled Steering Servo

Let’s use your **Elegoo IR remote** + **IR receiver (VS1838)** to control a **steering servo**.

---

### ✅ What It Does

- Press `"4"`: Turn servo left (e.g., 45°)
- Press `"6"`: Turn right (e.g., 135°)
- Press `"5"`: Center (90°)

---

### 🧰 Wiring Summary

| Component       | Pin                                      |
| --------------- | ---------------------------------------- |
| IR Receiver OUT | D2                                       |
| Servo Signal    | D6                                       |
| 5V              | IR VCC + Servo V+                        |
| GND             | Shared ground for Arduino, IR, and servo |

---

### 💻 Code Example

```cpp
#include <IRremote.h>
#include <Servo.h>

const int IR_PIN = 2;
const int SERVO_PIN = 6;

Servo steering;

void setup() {
  Serial.begin(9600);
  IrReceiver.begin(IR_PIN);
  steering.attach(SERVO_PIN);
  steering.write(90); // Center on start
}

void loop() {
  if (IrReceiver.decode()) {
    uint8_t command = IrReceiver.decodedIRData.command;
    Serial.println(command, HEX);

    switch (command) {
      case 0x8:  // "4" button on Elegoo remote
        steering.write(45); // Left
        break;
      case 0x5A: // "6" button
        steering.write(135); // Right
        break;
      case 0x1C: // "5" button (center)
        steering.write(90);
        break;
    }

    IrReceiver.resume();
  }
}
```

> 🧠 Tip: Use the Serial Monitor to find out what command values your remote sends if yours are different.

---

## 🧰 Optional Lab Extensions

- Add more angles for finer control (e.g. "1" = 0°, "3" = 180°)
- Add a **potentiometer override**
- Use the servo to control a real steering knuckle in a mini vehicle
'