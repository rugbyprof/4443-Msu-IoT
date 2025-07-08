# 🌀 IoT Lab 2: Smart Fan Controller

**Course:** Intro to IoT Systems  
**Instructor:** Dr. Terry Griffin  
**Lab Title:** Simulated Smart Fan with Manual and Automatic Modes  
**Lab Level:** Beginner/Intermediate  
**Estimated Time:** 1.5–2 hours

---

## 🎯 Learning Objectives

By the end of this lab, students will:

- Control a DC motor using digital output
- Use buttons to toggle modes
- Simulate sensor input using a potentiometer
- Design logic for manual vs automatic control modes

---

## 🧰 Materials Needed

| Component                            | Quantity                  |
| ------------------------------------ | ------------------------- |
| Arduino Uno (or compatible)          | 1                         |
| Breadboard                           | 1                         |
| Jumper wires                         | ~8                        |
| DC motor or small fan                | 1                         |
| Transistor (e.g., 2N2222 or PN2222A) | 1                         |
| Diode (e.g., 1N4001)                 | 1 (flyback protection)    |
| 220Ω resistor (for button)           | 1                         |
| Pushbutton                           | 1                         |
| Potentiometer                        | 1                         |
| External power (optional for motor)  | 1 battery or bench supply |

---

## ⚡ Circuit Description

- Use a **transistor switch** to control the motor from a digital pin.
- Use a **flyback diode** across the motor terminals to protect your transistor.
- Button on digital pin toggles between **manual** and **auto** mode.
- Potentiometer on A0 acts as a **simulated temperature sensor**.

---

## 🔧 Starter Code: `fan_controller.ino`

```cpp
const int motorPin = 9;
const int buttonPin = 2;
const int potPin = A0;

bool autoMode = false;
bool lastButtonState = LOW;

void setup() {
  pinMode(motorPin, OUTPUT);
  pinMode(buttonPin, INPUT_PULLUP);
  Serial.begin(9600);
}

void loop() {
  bool buttonState = digitalRead(buttonPin);

  if (buttonState == LOW && lastButtonState == HIGH) {
    autoMode = !autoMode;
    Serial.println(autoMode ? "Auto Mode" : "Manual Mode");
    delay(200); // debounce
  }

  lastButtonState = buttonState;

  if (autoMode) {
    int sensorValue = analogRead(potPin);
    if (sensorValue > 512) {
      digitalWrite(motorPin, HIGH);
    } else {
      digitalWrite(motorPin, LOW);
    }
  } else {
    digitalWrite(motorPin, HIGH); // Always on in manual mode
  }

  delay(50);
}
```

---

## 🧠 Reflection Questions

1. What is the purpose of the transistor and why not drive the motor directly from the pin?
2. What is the flyback diode protecting and how?
3. How could you improve the "auto" logic to avoid abrupt on/off behavior?
4. What sensor could replace the potentiometer in a real-world fan controller?

---

## 🧪 Bonus Challenge

- Add an RGB LED that shows fan status:
  - Green = off
  - Yellow = manual
  - Red = auto + active
- Add serial output that logs the potentiometer value every second

---

## 📝 Deliverables

- `.ino` file of your final working sketch
- Breadboard photo
- Reflection answers

---

**End of Lab 2**
