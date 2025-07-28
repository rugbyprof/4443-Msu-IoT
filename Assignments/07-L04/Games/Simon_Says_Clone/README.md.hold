## **Simon Says Clone**

- 🎮 Gameplay: Light/sound patterns + button input
- 🎨 Colored LEDs: Red, Green, Yellow, Blue
- 🔊 Buzzer tones per LED
- 📺 Small OLED (0.96") for intro screens, level selection, and feedback
- 🎚️ Difficulty levels: Easy → Insane
- 🧠 Memory + input timing + scalable logic

---

## 🧰 Parts List

| Qty | Component                                    | Notes                                    |
| --- | -------------------------------------------- | ---------------------------------------- |
| 1   | Arduino Uno/Nano/ESP32                       | Any standard microcontroller will work   |
| 4   | LEDs (Red, Green, Yellow, Blue)              | Visual feedback for the pattern          |
| 4   | 220Ω Resistors                               | For each LED                             |
| 4   | Pushbuttons                                  | Player input                             |
| 4   | 10kΩ Resistors (if not using `INPUT_PULLUP`) | Button pull-down resistors               |
| 1   | Passive Buzzer                               | Sound for each color                     |
| 1   | 0.96" I2C OLED (SSD1306)                     | For level select, game over, score, etc. |
| 1   | Breadboard + jumper wires                    | Prototyping                              |
| 1   | Optional Enclosure                           | 3D-printed or laser-cut box              |

---

## 🎮 Gameplay Flow

1. **Startup screen** on OLED → prompt to select difficulty
2. Player chooses level using a button (e.g., cycle left/right)
3. Display counts down → starts level
4. Game plays a pattern (increasing length and speed per level)
5. Player repeats the pattern using buttons
6. Game gives feedback:
   - Correct: continue with longer pattern
   - Wrong: display game over and score

---

## 💡 LED and Tone Mapping

| Color  | Pin (Example) | Tone (Hz) |
| ------ | ------------- | --------- |
| Red    | D4            | 261 (C4)  |
| Green  | D5            | 329 (E4)  |
| Yellow | D6            | 392 (G4)  |
| Blue   | D7            | 523 (C5)  |

---

## 🧠 Difficulty Settings

| Level  | Pattern Start Length | Speed Delay | Growth |
| ------ | -------------------- | ----------- | ------ |
| Easy   | 3                    | 800 ms      | +1     |
| Medium | 4                    | 600 ms      | +1     |
| Hard   | 5                    | 400 ms      | +2     |
| Insane | 6                    | 200 ms      | +2     |

You can tweak these easily in code.

---

## 🧾 Code: Simon Says Clone (Part 1 — Setup and Main Loop)

> Split into two messages for readability

```cpp
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Pins
const int ledPins[4] = {4, 5, 6, 7};         // R G Y B
const int buttonPins[4] = {8, 9, 10, 11};
const int buzzerPin = 3;

// Tones for each color
const int tones[4] = {261, 329, 392, 523};

// Game config
int pattern[100];
int patternLength = 0;
int currentLevel = 0;
bool playing = false;

// Difficulty settings (ms delay between steps)
int delays[] = {800, 600, 400, 200}; // Easy → Insane
int levelLengths[] = {3, 4, 5, 6};
int growthRates[] = {1, 1, 2, 2};

void setup() {
  for (int i = 0; i < 4; i++) {
    pinMode(ledPins[i], OUTPUT);
    pinMode(buttonPins[i], INPUT_PULLUP);
  }
  pinMode(buzzerPin, OUTPUT);

  Serial.begin(9600);
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
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

## 🧾 Part 2 — Functions: Startup, Display, Game Logic

```cpp
void showStartup() {
  display.clearDisplay();
  display.setTextSize(1);
  display.setCursor(10, 10);
  display.println("Simon Says");
  display.setCursor(10, 30);
  display.println("Press to Select Level");
  display.display();
}

void selectLevel() {
  currentLevel = 0;
  while (digitalRead(buttonPins[0]) != LOW) {
    display.clearDisplay();
    display.setCursor(10, 20);
    display.print("Difficulty: ");
    switch (currentLevel) {
      case 0: display.println("Easy"); break;
      case 1: display.println("Medium"); break;
      case 2: display.println("Hard"); break;
      case 3: display.println("Insane"); break;
    }
    display.setCursor(10, 40);
    display.println("Press RED to select");
    display.display();
    delay(200);
    if (digitalRead(buttonPins[3]) == LOW) {  // Blue cycles level
      currentLevel = (currentLevel + 1) % 4;
      delay(300);
    }
  }
  while (digitalRead(buttonPins[0]) == LOW); // wait for release
}

void startGame() {
  patternLength = levelLengths[currentLevel];
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

## 🧪 Suggestions for Extension

- 🔁 **Save high score** using EEPROM
- 📈 Show **progress bar or level**
- ⏱️ Add a **countdown timer** to enter each input
- 🔁 Randomize sound/LED mapping for challenge mode
- 🧠 Use **circular buffers** or memory constraints for embedded variant
