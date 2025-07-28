Let’s roll into **Game 2**, fully standardized:

---

# 🎲 Game 2: Dice Duel – Two Player Version

🎮 _A reaction-based dice game where two players race to win rounds by rolling virtual dice_

---

## 🧠 Concept

Dice Duel is a two-player reaction game. After a random countdown, players race to press their button. The faster player rolls a virtual die. Then the opponent rolls. The higher roll wins the round. First to a set score (e.g., 5 or 21) wins!

This game teaches reaction timing, fair random number use, button debouncing, and tracking game state.

---

## 🔧 Hardware Requirements

| Component               | Qty | Notes                                   |
| ----------------------- | --- | --------------------------------------- |
| ESP32 or Arduino        | 1   | Any dev board with digital inputs       |
| Buttons                 | 2   | One per player, use `INPUT_PULLUP`      |
| LEDs (optional)         | 2   | Visual feedback for each player         |
| OLED Display (I2C)      | 1   | SSD1306, 128x64 for score and roll info |
| Piezo Buzzer (optional) | 1   | For "GO!" and win/loss tones            |
| Jumper Wires            | —   |                                         |
| Breadboard              | 1   | Optional but recommended                |

---

## 🕹 Gameplay Rules

1. Game displays “Get Ready…”, then after a random delay, “GO!”
2. First player to press their button after “GO!” rolls first
3. Second player rolls automatically after
4. Higher roll wins the round
5. First to 5 (or configurable score) wins
6. Score is displayed on OLED

---

## 💻 Starter Code (ESP32-Compatible, OLED Version)

```cpp
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

const int player1Btn = 2;
const int player2Btn = 3;
int score1 = 0, score2 = 0;
const int winScore = 5;

void setup() {
  pinMode(player1Btn, INPUT_PULLUP);
  pinMode(player2Btn, INPUT_PULLUP);

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(10, 30);
  display.println("Dice Duel Begins!");
  display.display();
  delay(2000);
}

void loop() {
  display.clearDisplay();
  display.setCursor(10, 10);
  display.println("Get Ready...");
  display.display();
  delay(random(2000, 6000));

  display.clearDisplay();
  display.setCursor(10, 10);
  display.println("GO!");
  display.display();

  int winner = waitForFirstPress();

  int roll1 = (winner == 1) ? random(1, 7) : random(1, 7);
  int roll2 = (winner == 1) ? random(1, 7) : roll1;  // simulate fair second roll

  display.clearDisplay();
  display.setTextSize(1);
  display.setCursor(0, 0);
  display.print("P1 Score: ");
  display.println(score1);
  display.print("P2 Score: ");
  display.println(score2);
  display.println("---------------------");

  display.setTextSize(2);
  display.setCursor(0, 35);
  display.print("P1: ");
  display.print(winner == 1 ? roll1 : roll2);
  display.setCursor(64, 35);
  display.print("P2: ");
  display.print(winner == 1 ? roll2 : roll1);
  display.display();
  delay(1500);

  if (roll1 > roll2) score1++;
  else if (roll2 > roll1) score2++;

  if (score1 >= winScore || score2 >= winScore) {
    display.clearDisplay();
    display.setTextSize(2);
    display.setCursor(10, 20);
    display.println("Game Over");
    display.setTextSize(1);
    display.setCursor(20, 50);
    display.print("Winner: P");
    display.print(score1 > score2 ? "1" : "2");
    display.display();
    while (1);
  }
  delay(2000);
}

int waitForFirstPress() {
  while (true) {
    if (digitalRead(player1Btn) == LOW) {
      while (digitalRead(player1Btn) == LOW);
      return 1;
    }
    if (digitalRead(player2Btn) == LOW) {
      while (digitalRead(player2Btn) == LOW);
      return 2;
    }
  }
}
```

---

## 🧪 Possible Enhancements

| Type          | Idea                                             |
| ------------- | ------------------------------------------------ |
| 🧠 Game Logic | Add false start penalty (pressed too early)      |
| 🎵 Sound      | Play "GO!" tone and win/lose buzzers             |
| 🎮 Input      | Add a third button to restart the game           |
| 🧑‍🏫 Display    | Show animated dice face (bitmaps or numbers)     |
| 🎛 UX          | Menu to choose winning score (5, 10, 21)         |
| 🔄 Hardware   | Replace OLED with 7-segment displays             |
| 🧱 Enclosure  | Dice-shaped 3D-printed shell with arcade buttons |

---

## 📦 Versions

| Version                           | Available   |
| --------------------------------- | ----------- |
| ✅ LED + Serial                   | Yes         |
| ✅ OLED Display                   | Yes         |
| 🔲 4-player Mode                  | Expandable  |
| 🔲 RGB LED version                | Planned     |
| 🔲 Multiplayer via Bluetooth/WiFi | Future idea |

---

Want me to move on to **Game 3: Simon Says Clone**, or would you like:

- A printable `.md` file of this?
- A variant with LED-only output (no OLED)?

Your call!
