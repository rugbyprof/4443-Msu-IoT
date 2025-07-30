## 🧠 Stepper Motor Overview

### 🧱 What is a Stepper Motor?

A **stepper motor** rotates in precise, fixed **increments ("steps")** instead of spinning freely. You control it by **pulsing a sequence of coils** — each pulse moves the shaft by a fixed angle (e.g. 1.8° per step).

---

### 🔍 Key Characteristics

| Feature            | Description                                 |
| ------------------ | ------------------------------------------- |
| **Motion**         | Rotates in steps, not continuously          |
| **Control**        | Deterministic (you tell it how far to move) |
| **Feedback**       | Usually open-loop (no sensor needed)        |
| **Precision**      | Excellent for controlled positioning        |
| **Holding Torque** | Can maintain position when stopped          |

---

### 🔌 Common Types

| Type         | Description                                                                           |
| ------------ | ------------------------------------------------------------------------------------- |
| **28BYJ-48** | Cheap, 5-wire geared stepper (slow but strong)                                        |
| **NEMA 17**  | Standard for 3D printers & CNC (faster, stronger, needs driver like A4988 or DRV8825) |

---

### 🧰 Control Hardware

| Motor Type | Driver Needed   | Control Method         |
| ---------- | --------------- | ---------------------- |
| 28BYJ-48   | ULN2003 board   | 4 digital pins (IN1–4) |
| NEMA 17    | A4988 / DRV8825 | DIR + STEP pins        |

---

## 🧪 Applications in Your Project

You're working with:

- **IR remote**
- **DC motors** (tank drive / propulsion)
- **Servo for steering**

---

### ✅ Stepper Ideas That Fit Your System:

| Application                                  | How Stepper Helps                              |
| -------------------------------------------- | ---------------------------------------------- |
| **Pan/tilt control** (for sensors or camera) | Smooth, exact angles with repeatability        |
| **Sensor sweep (e.g. distance/IR scan)**     | Turn slowly in increments and scan environment |
| **Rotating turret / platform**               | Precise control for targeting or selection     |
| **Gate or arm mechanism**                    | Rotate something to exact angle and hold       |
| **Crude display dial or meter**              | Show numerical value using pointer             |

> ⚙️ You could use an IR remote to “step” left/right through positions on a turret or dial.

---

### 🚫 Not Ideal For

- Replacing drive motors (unless you want to build a CNC tank 😎)
- Replacing servo steering (harder to center accurately without feedback)
- High-speed movement — steppers are **precise**, not fast

---

Hooking up a **stepper motor (28BYJ-48)** with its **ULN2003 driver board**, and control its rotation **left, right, and stop** using an **IR remote** (e.g., Elegoo remote).

---

## 🧰 What You Need

- **28BYJ-48** stepper motor
- **ULN2003 driver board** (with IN1–IN4 pins)
- **IR receiver** (e.g. VS1838)
- **Arduino (Uno, Nano, etc.)**
- 5V power (Arduino or external for motor)
- Elegoo IR remote

---

## 🧠 Wiring Diagram

### 🪛 Stepper (ULN2003) Connections

| ULN2003 Pin | Connects To Arduino |
| ----------- | ------------------- |
| IN1         | D8                  |
| IN2         | D9                  |
| IN3         | D10                 |
| IN4         | D11                 |
| VCC         | 5V                  |
| GND         | GND                 |

### 🛠 IR Receiver

| IR Pin | Arduino Pin |
| ------ | ----------- |
| OUT    | D2          |
| VCC    | 5V          |
| GND    | GND         |

---

## 💻 Arduino Code

```cpp
#include <IRremote.h>
#include <Stepper.h>

const int stepsPerRevolution = 2048;  // 28BYJ-48 motor full rotation

// Connect stepper IN1-IN4 to pins 8–11
Stepper myStepper(stepsPerRevolution, 8, 10, 9, 11);

// IR receiver pin
const int IR_PIN = 2;

void setup() {
  Serial.begin(9600);
  IrReceiver.begin(IR_PIN);
  myStepper.setSpeed(10);  // RPM
}

void loop() {
  if (IrReceiver.decode()) {
    uint8_t cmd = IrReceiver.decodedIRData.command;
    Serial.print("IR Code: ");
    Serial.println(cmd, HEX);

    switch (cmd) {
      case 0x8:  // "4" button
        Serial.println("Left");
        myStepper.step(-100); // Step left
        break;
      case 0x5A: // "6" button
        Serial.println("Right");
        myStepper.step(100); // Step right
        break;
      case 0x1C: // "5" button (center)
        Serial.println("Stop");
        // Do nothing (motor holds or releases depending on driver)
        break;
    }

    IrReceiver.resume();
  }
}
```

---

## 🧪 What It Does

- Press **"4"**: rotates left (counter-clockwise)
- Press **"6"**: rotates right (clockwise)
- Press **"5"**: stops (actually just does nothing; motor remains idle or holding)

---

## 🧠 Notes

- **Speed**: keep `myStepper.setSpeed()` below ~15 RPM for reliable stepping on 28BYJ-48
- **Steps**: `2048` = full 360° (with built-in gearbox)
- You can replace `.step(100)` with `.step(stepsPerRevolution / 4)` for 90° moves, etc.
