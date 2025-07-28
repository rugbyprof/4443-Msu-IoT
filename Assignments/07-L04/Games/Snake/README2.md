Great — let’s bring in Game 4 with the same clean structure:

---

# 🐍 Game 4: Micro Snake – OLED Edition

🎮 _Guide a hungry snake through a pixel world. Eat, grow, and try not to crash!_

---

## 🧠 Concept

Micro Snake is a scaled-down version of the classic Snake game, made for a 128×64 OLED display. The player controls the snake using two buttons (left/right turns), or a joystick. The snake moves automatically in its current direction. Each time it eats a food pellet, it grows longer. If it hits a wall or itself — game over.

This project teaches direction logic, grid movement, tail management, collision detection, and display rendering.

---

## 🔧 Hardware Requirements

| Component            | Qty | Notes                                |
| -------------------- | --- | ------------------------------------ |
| ESP32 (or Arduino)   | 1   | Any dev board with at least 2 inputs |
| OLED SSD1306 Display | 1   | 128x64 I2C, for drawing game grid    |
| Pushbuttons          | 2   | One for turning left, one right      |
| Optional Joystick    | 1   | Replace buttons with 2-axis input    |
| Optional Buzzer      | 1   | Add game-over or eating sounds       |
| Jumper Wires         | —   |                                      |
| Breadboard           | 1   | Recommended for prototyping          |

---

## 🕹 Gameplay Rules

1. Snake starts with 3 segments.
2. It moves automatically in a direction on every loop.
3. Pressing the buttons turns the snake left or right.
4. Eating food increases the snake's length by 1.
5. Hitting the wall or its own body ends the game.
6. Score is based on snake length.

---

## 💻 Starter Code (ESP32-Compatible, OLED Version)

```cpp
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Grid settings
#define GRID_SIZE 4
#define MAX_LENGTH 64

int snakeX[MAX_LENGTH];
int snakeY[MAX_LENGTH];
int snakeLength = 3;
int direction = 1; // 0=UP, 1=RIGHT, 2=DOWN, 3=LEFT

int foodX, foodY;
unsigned long lastMoveTime = 0;
int moveDelay = 250;  // Speed (ms between moves)

#define LEFT_BTN 2
#define RIGHT_BTN 3

void setup() {
  pinMode(LEFT_BTN, INPUT_PULLUP);
  pinMode(RIGHT_BTN, INPUT_PULLUP);
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.clearDisplay();

  // Start snake in center
  for (int i = 0; i < snakeLength; i++) {
    snakeX[i] = 10 - i;
    snakeY[i] = 8;
  }
  spawnFood();
}

void loop() {
  handleInput();

  if (millis() - lastMoveTime > moveDelay) {
    moveSnake();
    drawGame();
    lastMoveTime = millis();
  }
}
```

---

## 🔁 Core Functions

```cpp
void handleInput() {
  if (digitalRead(LEFT_BTN) == LOW) {
    direction = (direction + 3) % 4;  // Turn left
    delay(200); // debounce
  }
  if (digitalRead(RIGHT_BTN) == LOW) {
    direction = (direction + 1) % 4;  // Turn right
    delay(200); // debounce
  }
}

void moveSnake() {
  for (int i = snakeLength - 1; i > 0; i--) {
    snakeX[i] = snakeX[i - 1];
    snakeY[i] = snakeY[i - 1];
  }

  if (direction == 0) snakeY[0]--;
  if (direction == 1) snakeX[0]++;
  if (direction == 2) snakeY[0]++;
  if (direction == 3) snakeX[0]--;

  if (snakeX[0] < 0 || snakeX[0]*GRID_SIZE >= SCREEN_WIDTH ||
      snakeY[0] < 0 || snakeY[0]*GRID_SIZE >= SCREEN_HEIGHT)
    gameOver();

  for (int i = 1; i < snakeLength; i++) {
    if (snakeX[0] == snakeX[i] && snakeY[0] == snakeY[i])
      gameOver();
  }

  if (snakeX[0] == foodX && snakeY[0] == foodY) {
    if (snakeLength < MAX_LENGTH) snakeLength++;
    spawnFood();
  }
}

void drawGame() {
  display.clearDisplay();
  // Draw food
  display.fillRect(foodX * GRID_SIZE, foodY * GRID_SIZE, GRID_SIZE, GRID_SIZE, SSD1306_WHITE);
  // Draw snake
  for (int i = 0; i < snakeLength; i++) {
    display.fillRect(snakeX[i] * GRID_SIZE, snakeY[i] * GRID_SIZE, GRID_SIZE, GRID_SIZE, SSD1306_WHITE);
  }
  display.display();
}

void spawnFood() {
  foodX = random(0, SCREEN_WIDTH / GRID_SIZE);
  foodY = random(0, SCREEN_HEIGHT / GRID_SIZE);
}

void gameOver() {
  display.clearDisplay();
  display.setTextSize(2);
  display.setCursor(10, 25);
  display.println("Game Over");
  display.display();
  delay(3000);

  // Reset snake
  snakeLength = 3;
  for (int i = 0; i < snakeLength; i++) {
    snakeX[i] = 10 - i;
    snakeY[i] = 8;
  }
  direction = 1;
  spawnFood();
}
```

---

## 🧪 Possible Enhancements

| Type          | Ideas                                          |
| ------------- | ---------------------------------------------- |
| 🧠 Difficulty | Speed increases as score increases             |
| 🕹 Input Alt   | Replace buttons with joystick or accelerometer |
| 🧑‍🏫 Display    | Show score (snake length) on screen            |
| 🎵 Audio      | Buzzer for death, eating, or level up          |
| ⏱ Game Modes  | Add “survival mode” with countdown timer       |
| 📦 Enclosure  | Create Game Boy-style 3D case                  |

---

## 📦 Versions

| Version                       | Status          |
| ----------------------------- | --------------- |
| ✅ OLED Display               | ✔️              |
| 🔲 LED-only                   | N/A             |
| 🔲 Joystick version           | Planned         |
| 🔲 Multiplayer / split screen | 🚧 concept only |

---

Next up would be **Reaction Duel**, unless you'd like to pause here for a print/export step, or tweak one of the previous four. What's your preference?
