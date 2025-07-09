# 📜 List of Projects given Constraints

Below is a list of projects that will be challenging given the inventory Dr. Griffin currently has, but are conceived with an inventory that was subset of the new inventory.

| Tier | Project Name                  | Flavor       | Core Parts (per team)                                                                      | TL;DR                                                                                                                  |
| ---- | ----------------------------- | ------------ | ------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------- |
| T1   | **Reaction-Time Duel**        | 🎮 Gameified | 1× Piezo buzzer, 2× Push-buttons (from parts bin), 1× RGB LED, 1× 7-seg 4-digit, resistors | Race the LED; 7-seg shows winner’s ms. Stretch: log scores to SD card.                                                 |
| T1   | **Laser-Tag Lite**            | 🎮 Gameified | 1× IR TX/RX pair, 1× Piezo, assorted LEDs                                                  | “Tag” another team’s receiver; five hits = defeat. Stretch: OLED HUD with health bar.                                  |
| T1   | **Tilt-Maze Puzzle**          | 🎮 Gameified | Ball-switch tilt sensor, 4× LEDs, Piezo                                                    | Navigate a virtual labyrinth by tilting board; LEDs show position. Stretch: add timer + high-score EEPROM save.        |
| T2   | **Ultrasonic “Whack-a-Mole”** | 🎮 Gameified | 2× Ultrasonic sensors, SG90 servo, RGB LEDs                                                | Move target LED with servo arm; player “whacks” by hand-wave distance. Stretch: rotary encoder to change speed levels. |
| T2   | **Simon-Says Remix**          | 🎮 Gameified | 4× RGB LEDs, Piezo, Push-buttons                                                           | Classic memory game; plays tones + colors. Stretch: speed ramps with every round.                                      |
| T3   | **2-Axis “LED Pong”**         | 🎮 Gameified | 2× Rotary encoders, 8× LEDs, Piezo                                                         | Players rotate paddles; LED “ball” bounces. Stretch: add 7-seg score + IR link for inter-board play.                   |
| T1   | **Temp-&-Humid Logger**       | 🛠 Applied    | DHT11/22 sensor, SD-card reader, 128×64 OLED                                               | Log & display environmental data every minute. Stretch: graph on OLED.                                                 |
| T1   | **RGB Night-Light**           | 🛠 Applied    | PIR (small), RGB LED, light sensor                                                         | Turns on soft color when motion + darkness. Stretch: rotary encoder to pick palette.                                   |
| T2   | **Smart-Locker Latch**        | 🛠 Applied    | RFID reader, NPN transistor, stepper + driver                                              | Authenticate badge, twist stepper to unlock. Stretch: OLED status + SD audit log.                                      |
| T2   | **Parking-Assist Bar**        | 🛠 Applied    | Ultrasonic sensor, 5× LEDs, Piezo                                                          | LEDs go green→red as car approaches wall, beep at 20 cm. Stretch: 7-seg distance read-out.                             |
| T2   | **Stepper-Driven Turntable**  | 🛠 Applied    | Stepper + driver, gears kit, accelerometer (3-axis gyro)                                   | Constant-speed platform; gyro feedback keeps speed steady under load. Stretch: add OLED RPM display.                   |
| T3   | **DIY “Security Cam”**        | 🛠 Applied    | Arducam mini, PIR (large), SD-card, 5 V motor fan (optional)                               | PIR triggers still-image capture to SD. Stretch: motorized pan using servo.                                            |

---

## 🔧 Parts Available

| Item                                    | Safe Qty / team | Rationale                           |
| --------------------------------------- | --------------- | ----------------------------------- |
| SG90 servos                             | ≤2              | 10 in stock                         |
| Stepper w/ driver                       | 1               | 5 in stock                          |
| Ultrasonic                              | ≤2              | 10 in stock                         |
| PIR (any size)                          | 1               | 6 total                             |
| OLED or 7-seg                           | 1               | limited units                       |
| SD reader                               | 1               | 4 total — reserve for applied tiers |
| Remaining LEDs, resistors, push-buttons | _plentiful_     | let them scavenge                   |

It's not a challenge (unless you want it to be) between teams, so no fighting over parts. Also if more than two group up, I will be watching to make sure everyone physically participates (coding, poking wires,etc.).

---

## 🏗️ Scaffold & Assessment Tips

I don't think I want to make these full blown projects as listed below, but I promise you that the more work you put into learning the different components (like an NxN matrix of LEDS) that translate into other projects, my limit inventory shouldn't slow you down too much.

If we were to make it a larger project, then here is your work flow.

1. **Design Doc First** – a one-page of pin maps & state diagrams.
2. **Milestone Check-offs** – e.g., “sensor reads proper value” before moving on.
3. **Peer Demo Day** – each team shows off, other teams must _break_ it via QA.
4. **Reflection Paragraph** – “What made this harder than the early labs?”

---

## Bigger Inventory Ideas

Below is a fresh batch of **project kernels** assuming a new set of components. Each designed so you can snap the underlying modules into future builds. The ideas are tagged by **category** (🎮 Gamified, 🛠 Applied, 🚗 Mobility/Robotics, and 🧩 Skill-Builder) as well as the key components needed.

---

## 0️⃣ Pre-Work — Define the _Modular Blocks_

| Block                                                | Core Parts                     | Re-use Examples                                            |
| ---------------------------------------------------- | ------------------------------ | ---------------------------------------------------------- |
| **LED-Matrix Driver** (row/col scan, 1 resistor/row) | 25 LEDs, 10 × 220 Ω, 10 GPIO   | Used by _Tilt-Maze_, _Reaction Billboard_, _Robo-Eyes_     |
| **Motor H-Bridge Wrapper**                           | L298N + 2 DC motors or stepper | All chassis projects, conveyor game                        |
| **Sensor-Mux Layer**                                 | CD4051 or raw analog pins      | Funnel any 8 analog inputs (pots, LDRs, tilt) into one pin |
| **Score / Status HUD**                               | 4-digit 7-seg + shift-register | Drop into every game for time & score                      |
| **SD Logger Module**                                 | SD reader + Arduino SPI        | Re-used by _Black-Box Car_, _Weather Logger_               |
| **Comms Stub**                                       | HC-05 BT or IR pair            | Remote start, scoreboard sync                              |

Build each module once; students import the `.h`/`.ino` or Python code in later labs.

---

## 1️⃣ Gameified Ideas (🎮)

| Title                  | Parts per Team                       | Pitch                                                                                                      |
| ---------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| **Tilt-Maze Mk II**    | LED matrix module + ball-tilt switch | Navigate dot through maze; timer on 7-seg. Stretch = random maze generator stored on SD.                   |
| **Reaction Billboard** | 25-LED matrix + 2 buttons            | “Whack-the-Pixel”: random LED lights, first button slaps it. Matrix scanning lets 10 pins handle all LEDs. |
| **Gearbox Racer**      | Rotary encoder + piezo + LED bar     | Students “shift” encoder to stay near target RPM beep. Car-style minigame with math practice for Δω.       |

---

## 2️⃣ Applied Gadgets (🛠)

| Title                     | Parts                                                   | Pitch                                                                                      |
| ------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **Smart-Locker v2**       | Membrane 4×4 keypad + stepper/driver + limit switch     | Enter code → stepper rotates latch; wrong code locks × 30 s (LED matrix shows angry face). |
| **Weather-Totem**         | DHT sensor + SD + RGB LED                               | Logs T/H every 5 min; LED fades blue-red by temp; display daily max/min on 7-seg.          |
| **One-Resistor POV Wand** | WS2812 strip _if found_ (else 8 LED charlieplex) + gyro | Swing wand to display scrolling text via persistence-of-vision.                            |

---

## 3️⃣ Mobility / Robotics (🚗)

| Title                         | Parts                                                  | Pitch                                                                                           |
| ----------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| **Line-Follower “Stock Car”** | 2-chassis + L298N, 2 IR reflect sensors                | Classic black-tape course; optional lap timer on 7-seg.                                         |
| **Maze-Runner Bot**           | Ultrasonic sensor turret on chassis, LED matrix “eyes” | Explores classroom maze, logs left/right decisions to SD.                                       |
| **Sumo-Lite**                 | Two chassis, bumper switches                           | Push opponent off mat; uses gyro to detect tip-over; crowd can trigger power-ups via IR remote. |

---

## 4️⃣ Skill-Builder Micro-Labs (🧩)

Each is a 20-min recipe feeding the bigger projects.

| Micro-Lab                | Skills                           | Parts                           |
| ------------------------ | -------------------------------- | ------------------------------- |
| **Row/Col LED Scan**     | Timer interrupts, multiplex math | 10 pins + 10 resistors + 25 LED |
| **Keypad Debounce FSM**  | Finite-state machine             | 4×4 keypad                      |
| **H-Bridge Scope-Probe** | PWM vs motor current             | L298N + motor + clamp meter     |
| **I²C Bus Sniff**        | Logic-analyzer basics            | Any I²C sensor (gyro, OLED)     |

---

### 🏗️ Suggested Rollout (5 teams)

Not going to do a full blown project, however below is our new contingency plan if my parts don't show up.

1. **Week 1** – teams build **LED-Matrix Driver** + one Skill-Builder.
2. **Week 2–3** – each team chooses **one Gamified** _or_ **Applied** project; integrate modules.
3. **Week 4** – merge with **Mobility**: e.g., mount Tilt-Maze matrix as car “windshield” scoreboard → cross-team showcase.

---

## Some Good Notes

> **How do we physically wire the 5×5 with one resistor per row?**  
> Run a **solid jumper bus** along each row to a shared resistor → MCU row-select pin. Columns are switched high, rows low (or vice-versa). Only 10 resistors total.

> **Will breadboard space choke us?**  
> For the matrix, solder LEDs to a perfboard “shield” then plug via header; breadboard stays free for MCU & sensors.

> **How to keep code reusable?**  
> Force every module to expose a pair of functions: `init()` and a non-blocking `update()`. Game code just orchestrates.
