## 🎲 Dice Duel (“First to 21”)

**Goal:** Each player “rolls” a digital die — first to 21 without going over wins!

> See bottom for a different take. I want this to be easy, but good.
> Also, I threw this together with chatGPT and some edits so its not perfect. Don't assume its errorless. I will check the code when I can, but I can't really implement EVERY project, can I ? Man, I want to say challenge accepted, but I won't.

### Components:

- 2 Buttons (one for each player)
- OLED screen or 7-segment display for score
- LED ring (optional) for visual effects (see my idea at bottom)
- Piezo buzzer for "bust" or "win"
- PCB + 3D dice-shaped enclosure

|                                                                       |
| :-------------------------------------------------------------------: |
| <img src="https://images2.imgbox.com/a1/05/6Q5QP21l_o.png" width=150> |
|                        https://a.co/d/dnqs16H                         |
|                               Led Ring                                |

### Learning Focus:

- Basic game logic, edge-triggered input
- Use of RNG with fairness
- Case design for tactile feel

---

### Project Main Points

- Random delay before "GO" signal is sent or shown.
- Players race to buttons (so they should handle smacking).
- Dice roll (simulated in many ways, blinking led, using the led ring, or display)
- Players score is the sum of the rolls they won.
- Score tracking via serial monitor (or secreen display OR seven segment displays)
- Game ends at 21 points (can be changed)

---

### 🧰 Hardware Setup

| Pin | Component          |
| --- | ------------------ |
| D2  | Player 1 Button    |
| D3  | Player 2 Button    |
| D8  | Player 1 LED       |
| D9  | Player 2 LED       |
| D10 | Maybe Another Led? |

> Buttons go from pin to GND, using `INPUT_PULLUP`.

---

### ✅ Arduino Code: Dice Duel – 2 LED Only Version

```cpp
const int player1Btn = 2;
const int player2Btn = 3;
const int player1LED = 8;
const int player2LED = 9;

int score1 = 0;
int score2 = 0;
const int winScore = 5;

bool waitingForPress = false;
bool gameActive = true;

void setup() {
  pinMode(player1Btn, INPUT_PULLUP);
  pinMode(player2Btn, INPUT_PULLUP);
  pinMode(player1LED, OUTPUT);
  pinMode(player2LED, OUTPUT);

  Serial.begin(9600);
  Serial.println("Dice Duel Begins!");
  delay(1000);
}

void loop() {
  if (!gameActive) return;

  // Countdown to GO
  Serial.println("\nGet Ready...");
  digitalWrite(player1LED, LOW);
  digitalWrite(player2LED, LOW);
  delay(random(2000, 6000)); // suspenseful wait
  Serial.println("GO!");
  digitalWrite(player1LED, HIGH);
  digitalWrite(player2LED, HIGH);

  waitingForPress = true;
  int winner = waitForWinner(); // returns 1 or 2
  waitingForPress = false;

  digitalWrite(player1LED, LOW);
  digitalWrite(player2LED, LOW);

  int roll = random(1, 7); // Dice roll: 1-6

  Serial.print("Player ");
  Serial.print(winner);
  Serial.print(" pressed first and rolled a ");
  Serial.println(roll);

  // Flash winner LED roll times
  for (int i = 0; i < roll; i++) {
    digitalWrite(winner == 1 ? player1LED : player2LED, HIGH);
    delay(200);
    digitalWrite(winner == 1 ? player1LED : player2LED, LOW);
    delay(200);
  }

  // Compare to other player roll
  int opponentRoll = random(1, 7);
  Serial.print("Player ");
  Serial.print(winner == 1 ? 2 : 1);
  Serial.print(" rolled a ");
  Serial.println(opponentRoll);

  if (roll > opponentRoll) {
    if (winner == 1) score1++; else score2++;
    Serial.print("Player ");
    Serial.print(winner);
    Serial.println(" wins the round!");
  } else if (roll < opponentRoll) {
    if (winner == 1) score2++; else score1++;
    Serial.print("Player ");
    Serial.print(winner == 1 ? 2 : 1);
    Serial.println(" wins the round!");
  } else {
    Serial.println("Tie! No points awarded.");
  }

  Serial.print("Score => P1: ");
  Serial.print(score1);
  Serial.print(" | P2: ");
  Serial.println(score2);

  if (score1 >= winScore || score2 >= winScore) {
    gameActive = false;
    Serial.println("*** Game Over! ***");
    Serial.print("Winner: Player ");
    Serial.println(score1 > score2 ? "1" : "2");
  }

  delay(2000); // pause between rounds
}

int waitForWinner() {
  while (true) {
    if (digitalRead(player1Btn) == LOW) {
      while (digitalRead(player1Btn) == LOW); // wait for release
      return 1;
    }
    if (digitalRead(player2Btn) == LOW) {
      while (digitalRead(player2Btn) == LOW); // wait for release
      return 2;
    }
  }
}
```

---

### 🧪 How to Use:

1. Upload the sketch.
2. Open **Serial Monitor** at 9600 baud to see scores and results.
3. Press buttons when "GO!" appears (after a random delay).
4. First to 5 points wins!

---

## 🎲 OLED Dice Dual (Uses Display)

Now:

- Each player's score is shown on the display
- Dice rolls are animated (simulated with rolling numbers)
- LED feedback is still used (optional but keeps the tactile feel)

---

### 🧰 Hardware Setup:

| Pin | Component       |
| --- | --------------- |
| D2  | Player 1 Button |
| D3  | Player 2 Button |
| D8  | Player 1 LED    |
| D9  | Player 2 LED    |
| A4  | OLED SDA (I2C)  |
| A5  | OLED SCL (I2C)  |

✅ Buttons go to GND using `INPUT_PULLUP`.

✅ OLED is SSD1306 (128x64, I2C).

---

### ✅ Libraries Required:

Install via Library Manager:

- `Adafruit GFX`
- `Adafruit SSD1306`

---

### 💻 Code

```cpp
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

const int player1Btn = 2;
const int player2Btn = 3;
const int player1LED = 8;
const int player2LED = 9;

int score1 = 0;
int score2 = 0;
const int winScore = 5;
bool gameActive = true;

void setup() {
  pinMode(player1Btn, INPUT_PULLUP);
  pinMode(player2Btn, INPUT_PULLUP);
  pinMode(player1LED, OUTPUT);
  pinMode(player2LED, OUTPUT);

  Serial.begin(9600);
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
  if (!gameActive) return;

  display.clearDisplay();
  display.setCursor(10, 10);
  display.println("Get Ready...");
  display.display();
  digitalWrite(player1LED, LOW);
  digitalWrite(player2LED, LOW);
  delay(random(2000, 6000));

  display.clearDisplay();
  display.setCursor(10, 10);
  display.println("GO!");
  display.display();
  digitalWrite(player1LED, HIGH);
  digitalWrite(player2LED, HIGH);

  int winner = waitForButtonPress();

  digitalWrite(player1LED, LOW);
  digitalWrite(player2LED, LOW);

  int rollWinner = rollDice(winner);
  int rollOther  = rollDice(winner == 1 ? 2 : 1);

  display.clearDisplay();
  display.setTextSize(1);
  display.setCursor(0, 0);
  display.print("Player 1 Score: ");
  display.println(score1);
  display.print("Player 2 Score: ");
  display.println(score2);
  display.println("---------------------");
  display.setTextSize(2);
  display.setCursor(0, 35);
  display.print("P");
  display.print(winner);
  display.print(":");
  display.print(rollWinner);
  display.setCursor(64, 35);
  display.print("P");
  display.print(winner == 1 ? 2 : 1);
  display.print(":");
  display.print(rollOther);
  display.display();
  delay(1000);

  // Determine round winner
  if (rollWinner > rollOther) {
    if (winner == 1) score1++; else score2++;
    announce("Player " + String(winner) + " wins round!");
  } else if (rollOther > rollWinner) {
    if (winner == 1) score2++; else score1++;
    announce("Player " + String(winner == 1 ? 2 : 1) + " wins round!");
  } else {
    announce("Tie! No points.");
  }

  // Game over check
  if (score1 >= winScore || score2 >= winScore) {
    gameActive = false;
    delay(500);
    display.clearDisplay();
    display.setTextSize(2);
    display.setCursor(10, 20);
    display.println("Game Over");
    display.setTextSize(1);
    display.setCursor(20, 50);
    display.print("Winner: Player ");
    display.println(score1 > score2 ? "1" : "2");
    display.display();
    while (true); // halt
  }

  delay(2000);
}

int waitForButtonPress() {
  while (true) {
    if (digitalRead(player1Btn) == LOW) {
      while (digitalRead(player1Btn) == LOW); // wait release
      return 1;
    }
    if (digitalRead(player2Btn) == LOW) {
      while (digitalRead(player2Btn) == LOW);
      return 2;
    }
  }
}

int rollDice(int player) {
  int result = 0;
  for (int i = 0; i < 10; i++) {
    result = random(1, 7);
    displayDiceRoll(player, result);
    delay(80);
  }
  return result;
}

void displayDiceRoll(int player, int val) {
  display.clearDisplay();
  display.setTextSize(2);
  display.setCursor(10, 20);
  display.print("Player ");
  display.println(player);
  display.setTextSize(4);
  display.setCursor(50, 30);
  display.println(val);
  display.display();
}

void announce(String msg) {
  display.clearDisplay();
  display.setTextSize(1);
  display.setCursor(10, 30);
  display.println(msg);
  display.display();
  delay(1500);
}
```

---

### 🧪 Notes & Tweaks:

- `winScore = 21` should be changeable.
- You can **add buzzer feedback** at “GO!” and after the winner.
- If you want to **restart the game**, hold down both buttons or reset the board.
- 🎮 A **4-player** version with automatic scoreboard?
- 🎲 **Graphical dice face** drawing instead of text numbers?
- ⏱️ A **false start penalty** if someone presses too early?

## Griffins Notes

This project was designed for two leds and using the serial console (for the basic version, not the display version). I would recommend using 3 RGB leds.

- Left ledPin
  - For left player
  - Turns "winner color" (e.g green) when winner
  - Turns "loser color" (e.g red) when loser
- Center ledPins
  - It smoothly changes colors until a predefined "GO! color" (e.g. bright white or no color) is reached.
    - A beep or something should accompany the start color shows.
  - The first person to hit thier button gets the points.
- Right ledPin
  - Same as left but for right player.
