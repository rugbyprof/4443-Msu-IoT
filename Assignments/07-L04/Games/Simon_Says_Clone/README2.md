Perfect — let’s jump into **Game 3**: a classic made classroom-friendly.

---

# 🧠 Game 3: Simon Says – Memory Challenge

🎮 _Repeat the growing sequence of lights and sounds, or lose!_

---

## 🧠 Concept

Simon Says is a memory and pattern-recognition game. The device flashes a sequence of lights and sounds (each with a unique color and tone). The player must repeat the sequence using buttons. Each round, the pattern grows — and the speed may increase with difficulty.

Great for teaching input handling, tone generation, game state logic, and managing sequences in memory.

---

## 🔧 Hardware Requirements

| Component                      | Qty | Notes                                   |
| ------------------------------ | --- | --------------------------------------- |
| ESP32 (or Arduino)             | 1   | ESP32 preferred for more memory and I/O |
| SSD1306 OLED (128x64, I2C)     | 1   | For intro screen, score, and feedback   |
| LEDs: Red, Green, Yellow, Blue | 4   | One per color/button combo              |
| Resistors (220Ω)               | 4   | One per LED                             |
| Buttons                        | 4   | One per color                           |
| Optional 10kΩ pull-downs       | 4   | Or use `INPUT_PULLUP` mode              |
| Passive Buzzer                 | 1   | For tones associated with each color    |
| Breadboard + Jumpers           | —   | Recommended                             |

---

## 🕹 Gameplay Rules

1. On startup, OLED prompts user to select difficulty.
2. The game plays a sequence of tones/lights.
3. The player must repeat the sequence correctly.
4. Each round adds 1–2 more steps, and may increase speed.
5. On mistake, game ends and OLED shows score.

---

## 💻 Starter Code (ESP32-Compatible, OLED Version)

```cpp
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

const int ledPins[4] = {4, 5, 6, 7};         // Red, Green, Yellow, Blue
const int buttonPins[4] = {8, 9, 10, 11};
const int buzzerPin = 3;
const int tones[4] = {261, 329, 392, 523};   // C4, E4, G4, C5

int pattern[100];             // Max sequence length
int patternLength = 0;
int currentLevel = 0;
bool playing = false;

// Difficulty settings
int delays[]       = {800, 600, 400, 200};  // delay between flashes
int levelStart[]   = {3, 4, 5, 6};          // starting pattern length
int growthRates[]  = {1, 1, 2, 2};          // pattern growth per round

void setup() {
  for (int i = 0; i < 4; i++) {
    pinMode(ledPins[i], OUTPUT);
    pinMode(buttonPins[i], INPUT_PULLUP);
  }
  pinMode(buzzerPin, OUTPUT);

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.clearDisplay();
  display.display();
  showStartup();
}

void loop() {
  if (!playing) {
    selectLevel();
    delay(500);
    startGame();
  }

  showPattern();
  if (!getPlayerInput()) {
    showGameOver();
    playing = false;
  } else {
    patternLength += growthRates[currentLevel];
    delay(1000);
  }
}
```

---

## 🔁 Core Functions

```cpp
void showStartup() {
  display.clearDisplay();
  display.setTextSize(1);
  display.setCursor(10, 10);
  display.println("Simon Says");
  display.setCursor(10, 30);
  display.println("Press RED to Start");
  display.display();
}

void selectLevel() {
  currentLevel = 0;
  while (digitalRead(buttonPins[0]) != LOW) {
    display.clearDisplay();
    display.setCursor(10, 20);
    display.print("Difficulty: ");
    display.println(currentLevel == 0 ? "Easy" :
                    currentLevel == 1 ? "Medium" :
                    currentLevel == 2 ? "Hard" : "Insane");
    display.setCursor(10, 40);
    display.println("Blue = Cycle, Red = Start");
    display.display();
    delay(200);
    if (digitalRead(buttonPins[3]) == LOW) {
      currentLevel = (currentLevel + 1) % 4;
      delay(300);
    }
  }
  while (digitalRead(buttonPins[0]) == LOW);
}

void startGame() {
  patternLength = levelStart[currentLevel];
  for (int i = 0; i < 100; i++) pattern[i] = random(0, 4);
  playing = true;
}

void showPattern() {
  for (int i = 0; i < patternLength; i++) {
    int color = pattern[i];
    digitalWrite(ledPins[color], HIGH);
    tone(buzzerPin, tones[color], delays[currentLevel] / 2);
    delay(delays[currentLevel]);
    digitalWrite(ledPins[color], LOW);
    delay(delays[currentLevel] / 2);
  }
}

bool getPlayerInput() {
  for (int i = 0; i < patternLength; i++) {
    int input = waitForButton();
    if (input != pattern[i]) return false;
  }
  return true;
}

int waitForButton() {
  while (true) {
    for (int i = 0; i < 4; i++) {
      if (digitalRead(buttonPins[i]) == LOW) {
        tone(buzzerPin, tones[i], 150);
        digitalWrite(ledPins[i], HIGH);
        delay(300);
        digitalWrite(ledPins[i], LOW);
        while (digitalRead(buttonPins[i]) == LOW);
        return i;
      }
    }
  }
}

void showGameOver() {
  display.clearDisplay();
  display.setTextSize(2);
  display.setCursor(20, 20);
  display.println("Game Over");
  display.setTextSize(1);
  display.setCursor(20, 50);
  display.print("Score: ");
  display.print(patternLength - growthRates[currentLevel]);
  display.display();
  delay(3000);
}
```

---

## 🧪 Possible Enhancements

| Type        | Ideas                                        |
| ----------- | -------------------------------------------- |
| 🎵 Sound    | Add intro jingle, win/lose tones             |
| 📈 Progress | Show current round number on OLED            |
| 🔄 Mode     | Challenge mode: randomize LED/sound mapping  |
| 💾 Save     | Store high score in EEPROM or flash          |
| 🕹 Input Alt | Use joystick or capacitive touch buttons     |
| ⏱ Timeout   | Add countdown timer to enter each step       |
| 📦 Build    | 3D print enclosure with diffused light pipes |

---

## 📦 Versions

| Version           | Status                                |
| ----------------- | ------------------------------------- |
| ✅ OLED Version   | ✔️                                    |
| 🔲 LED-Only       | (could be created easily)             |
| 🔲 Joystick-Based | Planned                               |
| 🔲 Wireless Link  | Possible (ESP-NOW or BLE multiplayer) |
