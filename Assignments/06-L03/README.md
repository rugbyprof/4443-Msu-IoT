# Pcb Lab - Soldering a Sonic Led Level Meter

## Wiring with breadboard

<a href="https://images2.imgbox.com/fc/8f/KC7Wtp0I_o.gif"><img src="https://images2.imgbox.com/fc/8f/KC7Wtp0I_o.gif" width=400></a>

> <sub>If the gif doesn't play correctly, click on it to see original.</sub>

## Ultrasonic Distance Sensor

### 🦇 What It Is

"Imagine yelling in a canyon. The longer it takes to hear your echo, the farther away the wall is. This sensor does the same thing, but in bat-squeak mode."

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

### Working Program for Sonic Sensor

Get the sonic sensor working on a breadboard before you start soldering stuff to the PCB.

```cpp
// Ultrasonic Distance Measurement with HC-SR04
// Author: Your Friendly AI (chat gpt)
// Platform: Arduino (Uno/Nano/Etc.)

const int trigPin = 11;   // TRIG pin of HC-SR04
const int echoPin = 12;  // ECHO pin of HC-SR04

void setup() {
  Serial.begin(9600);          // Start serial communication
  pinMode(trigPin, OUTPUT);    // TRIG is an output
  pinMode(echoPin, INPUT);     // ECHO is an input
}

void loop() {
  long duration;
  float distance_cm;

  // Clear the TRIG pin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  // Send a 10 microsecond pulse to TRIG
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Read the echo pulse duration (microseconds)
  duration = pulseIn(echoPin, HIGH);

  // Calculate the distance (cm)
  // Speed of sound = 343 m/s = 0.0343 cm/us
  distance_cm = (duration * 0.0343) / 2;

  // Print to Serial Monitor
  Serial.print("Distance: ");
  Serial.print(distance_cm);
  Serial.println(" cm");

  delay(500);  // Wait half a second before next measurement
}
```

### Get Led Meter Working

Once you get your program working with your sensor and you experiment with distances and its accuracy, then determine which distances will start to activate the leds. With 6 leds you could start at a distance of 100 and divide by 6: `100 / 6 = ~16` and use this as the amount as your value per led. This means green would light at 100, second green at 84, first yellow at 68, second yellow at 52, first red at 36 and second red at 20. This is just an EXAMPLE, you definitely can come up with your own thresholds.

In the gif at the top each led is attached to pins 2-7. So you could add something like this to your code:

```cpp
const int green1 = 2;
const int green2 = 3;
.
.
.
const int red2 = 7;

.
.
.

if(distance_cm < 11){
    digitalWrite(green1, HIGH);
    digitalWrite(green2, HIGH);
    digitalWrite(yellow1, HIGH);
    digitalWrite(yellow2, HIGH);
    digitalWrite(red1, HIGH);
    digitalWrite(red2, HIGH);
}
//OR
if(distance_cm < 11){
    for(int i=2;i<=7;i++){
        digitalWrite(i, HIGH);
    }
}

```

Obviously I kept out a bunch of logic on turning pins on and off. Thats part of the fun for you!

### Led Meter Working

After your leds are acting correctly on the breadboard, then you can start to plan soldering them to the PCB. I think we will discuss this more in class, so we can share ideas.
