## 🌀 **DC Motors: The Basics**

### ⚙️ What is a DC Motor?

A DC (Direct Current) motor converts electrical energy into rotational motion. They're **simple**, **cheap**, and found in everything from toys to robots.

### 🧵 Wiring

Most hobby-grade DC motors have just **two wires**:

- **Red (or +)**: Connects to positive voltage
- **Black (or -)**: Connects to ground

### 🔁 Reversing Direction

Switching the polarity (swapping + and -) makes the motor spin the opposite way.

### 🕹️ Speed Control

You can control speed using:

- **Voltage**: Lower voltage = slower speed
- **PWM (Pulse Width Modulation)**: A digital method to "fake" variable voltage using ON/OFF pulses

---

## 🧪 Quick Lab Idea: “Free Spin Test”

**Objective**: Make a motor spin in both directions using a 9V battery (or lab power supply)

**Materials**:

- DC motor
- Power source (battery or 5–9V regulated)
- Alligator clips or jumper wires

**Steps**:

1. Connect red to +, black to - → motor spins forward
2. Reverse the wires → motor spins backward

> Note: Motors will get hot or wear out if stalled (physically blocked), so avoid forcing resistance while powered.

---

## 🛑 Why We _Don’t_ Hook DC Motors Directly to a Microcontroller

Microcontrollers (like Arduino) can only supply a small amount of current (typically ~40 mA per pin). DC motors often draw:

- **Idle**: 100–300 mA
- **Stalled or loaded**: 500 mA to 2 A

Directly powering them from an Arduino risks:

- Burning out I/O pins
- Brownouts/resets due to voltage dips

> I discovered this when my `L9110` motor controller started melting 🔥 Then I had to switch to a tougher controller, the `L298N`. Stll not sure if I had some wiring wrong, but I don't think I did. (But I probably did.)

---

## 🔍 Summary

| Concept           | Description                                     |
| ----------------- | ----------------------------------------------- |
| Motion Type       | Continuous rotation                             |
| Control Method    | Voltage or PWM                                  |
| Direction Control | Swap polarity                                   |
| Why Use Driver?   | To safely power & control from microcontrollers |
