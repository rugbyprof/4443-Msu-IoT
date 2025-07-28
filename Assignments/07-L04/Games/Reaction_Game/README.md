Perfect — here's the final standardized entry in the current batch:

---

# ⚡ Game 5: Reaction Duel

🎮 _Who’s faster? A head-to-head reflex game where every millisecond counts!_

---

## 🧠 Concept

Reaction Duel pits two players against each other in a test of reflexes. After a random delay, the system signals “GO!” with LEDs and/or a tone. The first player to press their button wins the round and scores a point. Press too early? Penalty! First to reach the target score wins.

This project teaches input debouncing, timing, fair signaling, random delays, and reaction-time measurement.

---

## 🔧 Hardware Requirements

| Component              | Qty | Notes                                  |
| ---------------------- | --- | -------------------------------------- |
| ESP32 (or Arduino)     | 1   | Any board with 2 digital inputs        |
| Pushbuttons            | 2   | One per player, connected to GND       |
| RGB LEDs (or 2 LEDs)   | 3   | 1 for each player + 1 central “GO” LED |
| OLED Display (SSD1306) | 1   | Optional, for score and instructions   |
| Buzzer (optional)      | 1   | For sound cue on GO!                   |
| Breadboard + jumpers   | —   | Recommended                            |

---

## 🕹 Gameplay Rules

1. Game starts with an intro screen and score = 0–0.
2. After a random delay (2–6 seconds), a signal (LED or sound) appears.
3. First player to press wins the round.
4. If a player presses _before_ the signal — false start! Point goes to the opponent.
5. First to target score (e.g., 5) wins.
6. OLED display shows current score and winner at end.

---

## 💻 Starter Code (ESP32-Compatible, OLED + LED Version)

```cpp
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

const int player1Btn = 2;
const int player2Btn = 3;
const int player1LED = 8;
const int player2LED = 9;
const int centerLED  = 10;
const int buzzerPin  = 11;

int score1 = 0, score2 = 0;
const int winScore = 5;

void setup() {
  pinMode(player1Btn, INPUT_PULLUP);
  pinMode(player2Btn, INPUT_PULLUP);
  pinMode(player1LED, OUTPUT);
  pinMode(player2LED, OUTPUT);
  pinMode(centerLED, OUTPUT);
  pinMode(buzzerPin, OUTPUT);

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.clearDisplay();
  display.setTextSize(1);
  display.setCursor(0, 30);
  display.println("Reaction Duel Begins!");
  display.display();
  delay(2000);
}

void loop() {
  display.clearDisplay();
  display.setCursor(10, 10);
  display.println("Get Ready...");
  display.display();
  digitalWrite(centerLED, LOW);
  delay(random(2000, 6000));

  digitalWrite(centerLED, HIGH);
  tone(buzzerPin, 1000, 100);
  display.clearDisplay();
  display.setCursor(10, 10);
  display.println("GO!");
  display.display();

  int result = waitForInput();

  if (result == 1) score1++;
  else if (result == 2) score2++;

  display.clearDisplay();
  display.setCursor(10, 20);
  display.print("P1: ");
  display.print(score1);
  display.print("  P2: ");
  display.println(score2);
  display.display();
  digitalWrite(centerLED, LOW);
  delay(1500);

  if (score1 >= winScore || score2 >= winScore) {
    display.clearDisplay();
    display.setTextSize(2);
    display.setCursor(10, 20);
    display.println("Game Over");
    display.setTextSize(1);
    display.setCursor(20, 50);
    display.print("Winner: P");
    display.println(score1 > score2 ? "1" : "2");
    display.display();
    while (true);
  }
}
```

---

## 🔁 Core Logic: Input Detection

```cpp
int waitForInput() {
  unsigned long startTime = millis();
  while (true) {
    if (digitalRead(player1Btn) == LOW) {
      while (digitalRead(player1Btn) == LOW);
      if (millis() - startTime < 100) return 2; // false start
      return 1;
    }
    if (digitalRead(player2Btn) == LOW) {
      while (digitalRead(player2Btn) == LOW);
      if (millis() - startTime < 100) return 1; // false start
      return 2;
    }
  }
}
```

---

## 🧪 Possible Enhancements

| Type           | Ideas                                                 |
| -------------- | ----------------------------------------------------- |
| 🧠 Game Logic  | Add countdown timer or pre-start LED ramp-up          |
| 🎵 Audio       | Add tones for “GO!”, winner, and false start          |
| 📊 Display     | Show player reaction time (ms)                        |
| 🧑‍🏫 UX          | Visual feedback via RGB LED for winner/loser          |
| 🔁 Score Mode  | Change win condition (e.g., first to 10 or best-of-3) |
| 🧱 Enclosure   | Arcade-style controller with light-up buttons         |
| 🔄 Multiplayer | Expand to 4 players with ESP32 I/O or multiplexing    |

---

## 📦 Versions

| Version                | Status                         |
| ---------------------- | ------------------------------ |
| ✅ LED + Serial        | ✔️                             |
| ✅ OLED Display        | ✔️                             |
| ✅ False Start Penalty | ✔️                             |
| 🔲 4-Player            | Expandable with I/O planning   |
| 🔲 RGB Light Ring      | Optional for central countdown |
| 🔲 BLE Leaderboard     | Future idea — ESP32 only       |
