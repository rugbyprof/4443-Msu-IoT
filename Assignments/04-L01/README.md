# 🔌 IoT Lab 1: LED Fundamentals

**Course:** Intro to IoT Systems  
**Instructor:** Dr. Terry Griffin  
**Lab Title:** Blinking, Dimming, and Color Control with LEDs  
**Lab Level:** Beginner  
**Estimated Time:** 1.5–2 hours

---

## 🎯 Learning Objectives

By the end of this lab, students will:

- Understand how to control digital outputs using Arduino
- Use `delay()` and basic timing concepts
- Read analog input from a potentiometer
- Control an RGB LED to represent states visually

---

## 🧰 Materials Needed

| Component                          | Quantity |
| ---------------------------------- | -------- |
| Arduino Uno (or compatible)        | 1        |
| Breadboard                         | 1        |
| Jumper wires                       | ~6       |
| LED (Red or any single color)      | 1        |
| RGB LED (Common cathode preferred) | 1        |
| 220Ω resistors                     | 3–4      |
| Potentiometer                      | 1        |

---

## LED Background

I put this in because it's still an issue with me.
It's the classic **“Which leg goes where?”** (pos vs neg) confusion. Happens to _literally everyone_ when learning electronics.

---

### 💡 First Things First: LED Anatomy 101

<a href="https://images2.imgbox.com/3e/58/c24h8W84_o.png">
<img src="https://images2.imgbox.com/3e/58/c24h8W84_o.png" width=200>
</a>

| Part                              | Description                                                            |
| --------------------------------- | ---------------------------------------------------------------------- |
| **Anode**                         | The **positive** side of the LED (where current _enters_)              |
| **Cathode**                       | The **negative** side (where current _exits_)                          |
| **Longer leg**                    | Typically the **anode** (positive)                                     |
| **Shorter leg**                   | Typically the **cathode** (negative)                                   |
| **Flat edge on base**             | Marks the **cathode** side                                             |
| **Bent leg in diagrams**          | Often artistic license, but usually bent = **cathode** in common usage |
| **Internal schematic (if shown)** | An arrow with a line: arrow = **anode**, flat bar = **cathode**        |

---

### ⚡ Resistor: Does It Matter Which Side?

Do we place the the resistor on the `Anode` or `Cathode` side of the circuit??

**Short answer:** **Nope.** Functionally, it does **not matter** if the resistor is on the anode or cathode side of the LED.

> Current flows in one direction (from + to –), and the resistor's job is just to **limit the current**, not control direction.

#### ✅ Valid options:

```plaintext
+5V ---[resistor]---|>|--- GND
+5V -------|>[resistor]-- GND
```

Both work the same. Pick whichever is easier for your wiring layout or breadboard sanity.

---

### 🔥 What Happens If You Reverse the LED?

- LED won’t light up. No damage unless you're _really_ over-volting it (we're talking 12V+).
- It’s a **diode** — it blocks current in the wrong direction.

---

### ✅ TL;DR Cheat Sheet

| Feature                  | Anode (+)       | Cathode (–) |
| ------------------------ | --------------- | ----------- |
| Leg length               | Longer          | Shorter     |
| Body shape               | Rounded         | Flat edge   |
| Schematic side           | Arrow           | Bar         |
| Where current flows      | Into anode      | Out cathode |
| Which side for resistor? | Doesn’t matter! |             |

---

## More Background

Look at the image below:

<a href="https://images2.imgbox.com/c6/73/ewvrpgJ5_o.png">
<img src="https://images2.imgbox.com/c6/73/ewvrpgJ5_o.png" width=200>
</a>

Where's the 5 volts (power)? Did you see one wire tapping the 5V? No, what you see is a wire coming out of pin 5. So where's the power? It comes from the command `digitalWrite` which you will use in the next section. But for now let's discuss introduce `digitalWrite` and a breakdown of the code you will use in part 1.

### 🔌 When You Do a `digitalWrite(pin, HIGH)`, What’s Actually Happening?

#### ✅ **YES** — That pin acts like a **+5V source** (well, ~4.8–5V on a 5V board).

So if you write:

```cpp
digitalWrite(ledPin, HIGH);
```

Then `ledPin` is **outputting +5V** (relative to ground), meaning:

- It can **source current** into something like the anode of an LED
- And it acts kind of like a poor man's power supply

---

### 🧠 So to light an LED, you have **two popular choices**:

#### 💡 Option 1: **Source Mode**

```plaintext
digitalWrite(pin, HIGH);   // pin = +5V
LED anode → pin
LED cathode → resistor → GND
```

```cpp
pinMode(pin, OUTPUT);
digitalWrite(pin, HIGH);  // Turn LED on
```

✅ Easy to understand: you're "feeding" the LED +5V  
❌ Some boards source less current reliably than they can sink

---

#### 💡 Option 2: **Sink Mode (Often Preferred in Practice)**

```plaintext
LED anode → +5V
LED cathode → resistor → pin
digitalWrite(pin, LOW);    // pin = 0V (grounded)
```

```cpp
pinMode(pin, OUTPUT);
digitalWrite(pin, LOW);  // Turn LED on (current flows to pin)
```

✅ Arduino can **sink more current** than it can source (~40mA vs 20–25mA typical)  
✅ Cathode is "pulled low" by the pin  
✅ This is why in many designs, people light LEDs using `digitalWrite(pin, LOW)`  
❌ Feels a little backward to newbies

---

### 🧪 Example With `digitalWrite`

```cpp
const int ledPin = 7;

void setup() {
  pinMode(ledPin, OUTPUT);
}

void loop() {
  digitalWrite(ledPin, HIGH); // Turns LED on if in source config
  delay(500);
  digitalWrite(ledPin, LOW);  // Turns LED off
  delay(500);
}
```

Or flipped logic, if you're doing a **sink-style LED circuit**.

---

### 🔍 TL;DR:

| `digitalWrite(pin, HIGH)` | Pin is **+5V**, acts as power source |
| ------------------------- | ------------------------------------ |
| `digitalWrite(pin, LOW)`  | Pin is **0V**, acts like ground      |

- So yes — **a pin written HIGH is like +5V**, and can be treated that way when powering simple things like LEDs.
- Just keep in mind **current limits** — usually **20–40 mA max per pin** (check your board’s specs!).

## 💡 Part 1: Powering one LED

### 📝 Instructions

- Connect power to your breadboard from your Arduino (or from any 5v source would work).
  - (This means connect a wire (usually red) from the 5v)
- Place a `220Ω` resistor

<a href="https://images2.imgbox.com/c6/73/ewvrpgJ5_o.png">
<img src="https://images2.imgbox.com/c6/73/ewvrpgJ5_o.png" width=200>
</a>

## 💡 Part 2: Powering two LED's

<a href="https://images2.imgbox.com/bc/9b/Mh0AXLqQ_o.png">
<img src="https://images2.imgbox.com/bc/9b/Mh0AXLqQ_o.png" width=200>
</a>

## 🧪 Part 2: Blinking LED

### 📝 Instructions

1. Connect a **single-color LED** to digital **pin 11** (or any digital pin).
2. Use a `220Ω` resistor in series with the LED.
3. Write a sketch that blinks the LED on and off every 1 second.

### 🧠 Concepts Introduced

- `pinMode`, `digitalWrite`
- `delay` for timing
- Basic setup/loop structure in Arduino

---

### Positive and Negative on LED

Long leg = Anode (+)
Short leg = Cathode (–) ⟂ flat edge

---

## 🔧 Starter Code: `basic_blink.ino`

```cpp
void setup() {
  pinMode(11, OUTPUT);
}

void loop() {
  digitalWrite(11, HIGH);
  delay(1000);
  digitalWrite(11, LOW);
  delay(1000);
}
```

---

## 🪝 Part 3: Potentiometer-Controlled Blink Rate

### 📝 Instructions

1. Connect a potentiometer to analog pin A0.
2. Modify your blink code to read the potentiometer and adjust the delay.
   - Higher pot value = slower blink
   - Lower pot value = faster blink

<a href="https://images2.imgbox.com/cf/14/BxjAU3PC_o.png">
<img src="https://images2.imgbox.com/cf/14/BxjAU3PC_o.png" width=200>
</a>

### 🧠 Concepts Introduced

- `analogRead`
- Mapping analog input to a delay interval

---

### 🔧 Starter Code: `blink_with_pot.ino`

```cpp
void setup() {
  pinMode(13, OUTPUT);
}

void loop() {
  int potValue = analogRead(A0); // Read potentiometer
  int blinkDelay = map(potValue, 0, 1023, 100, 1000); // Map to 100ms–1s

  digitalWrite(13, HIGH);
  delay(blinkDelay);
  digitalWrite(13, LOW);
  delay(blinkDelay);
}
```

---

## 🌈 Part 4: RGB LED Control

<a href="https://images2.imgbox.com/1a/4c/yWIdGLi8_o.png">
<img src="https://images2.imgbox.com/1a/4c/yWIdGLi8_o.png" width=200>
</a>
### Option A: RGB Blink Like a Single LED

- Replace the red LED with the **red pin** of an RGB LED
- Use the same blink code as before

### Option B: Fade or cycle through colors (extension)

### Wiring Notes:

- Connect R, G, B pins each through a 220Ω resistor to digital pins
- Connect the **common cathode** (longest leg) to GND

---

## 🔧 Starter Code: `rgb_blink.ino`

```cpp
int redPin = 9;
int greenPin = 10;
int bluePin = 11;

void setup() {
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
}

void loop() {
  digitalWrite(redPin, HIGH);
  digitalWrite(greenPin, LOW);
  digitalWrite(bluePin, LOW);
  delay(1000);

  digitalWrite(redPin, LOW);
  digitalWrite(greenPin, HIGH);
  delay(1000);

  digitalWrite(greenPin, LOW);
  digitalWrite(bluePin, HIGH);
  delay(1000);

  digitalWrite(bluePin, LOW);
}
```

---

## 🧠 Reflection Questions

1. What happens if you reduce the delay to 10ms?
2. Why do we use resistors with LEDs?
3. What challenges would arise using an RGB LED as a signal light?
4. How would you add a pushbutton to toggle blinking on/off?

---

## 🧪 Bonus Challenge

Modify your potentiometer sketch to control the color of the RGB LED:

- Low = red
- Medium = green
- High = blue

Hint: use `analogRead` + `if/else` or `map()` into PWM output values.

---

## 📝 Deliverables

- Submit your final `.ino` file for all three parts
- Take a photo of your working breadboard for each
- Answer the reflection questions in a markdown file

---

**End of Lab 1**

### 🧠 Code in Question:

```cpp
int potValue = analogRead(A0); // Read potentiometer
int blinkDelay = map(potValue, 0, 1023, 100, 1000); // Map to 100ms–1s
```

---

### 🔍 Line-by-Line Breakdown:

#### ✅ Line 1:

```cpp
int potValue = analogRead(A0); // Read potentiometer
```

- `analogRead(A0)`:  
  This reads the voltage at analog pin **A0** (usually connected to the middle leg of a potentiometer).

  - On most Arduino boards, analog input ranges from **0V (0)** to **5V (1023)**.
  - The function returns a value **between 0 and 1023**, representing that voltage.

- `int potValue = ...`:  
  We store that number in a variable called `potValue` so we can use it later. Think of this as saying,  
  _“How far is the knob turned?”_ — where `0` is all the way left and `1023` is all the way right.

- **Student analogy**:  
  If this were a volume knob, this line is saying:  
  _“Read how loud the volume is set.”_

---

#### ✅ Line 2:

```cpp
int blinkDelay = map(potValue, 0, 1023, 100, 1000); // Map to 100ms–1s
```

- `map(...)` is a function that **converts a number from one range into another**.

- Parameters here:

  - `potValue`: the input value (from 0–1023)
  - `0, 1023`: the original input range (from `analogRead`)
  - `100, 1000`: the target range you want to map to — in this case, milliseconds of delay

- So:

  - When `potValue == 0`, `blinkDelay == 100` ms
  - When `potValue == 1023`, `blinkDelay == 1000` ms
  - Values in between are scaled proportionally

- **Why 100 to 1000?**  
  This sets how fast something should blink (like an LED).

  - 100ms is fast (10 blinks/sec)
  - 1000ms is slow (1 blink/sec)  
    So the knob now controls blink speed!

- **Student analogy**:  
  _“Take the knob reading and convert it into a time to wait between blinks.”_  
  It’s like saying:  
  _“If the knob is low, blink fast. If it’s high, blink slow.”_

---

### 🧪 Visual Summary:

| Knob Position | `potValue` | `blinkDelay` |
| ------------- | ---------- | ------------ |
| Far Left      | 0          | 100 ms       |
| Middle        | ~512       | ~550 ms      |
| Far Right     | 1023       | 1000 ms      |

---

### 🧠 Big Concept Takeaway:

These two lines let you control **how fast something happens (like an LED blink)** using a **physical input (the knob)**.

It’s a classic example of reading from the real world and adjusting your program’s behavior based on that — perfect for helping students understand **analog input** and **parameter scaling**.

Let me know if you want a follow-up explanation showing how that `blinkDelay` would be used in `delay(blinkDelay)` within `loop()`, or if you want an HTMX form that does this with sliders for web-based IoT control 😄
