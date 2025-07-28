## 🐍 **"Micro Snake" Game – OLED Edition**

### 🧠 Concept:

Classic Snake, but scaled for a small OLED screen. The snake moves on a grid, eats food to grow, and dies if it hits itself or a wall.

---

### 🔧 Hardware Requirements:

| Component          | Notes                              |
| ------------------ | ---------------------------------- |
| 🧠 Microcontroller | Arduino Uno/Nano/ESP32             |
| 📺 OLED Display    | SSD1306 (128×64 or 128×32)         |
| 🎮 Input           | 2 buttons (left/right) or joystick |
| 🔊 Optional        | Buzzer for death or food pickup    |

---

### 🕹️ Game Mechanics:

- Snake moves in one direction per tick
- Button or joystick lets player change direction
- Eats food = grows longer
- Runs into itself = game over
- Optional: speed increases over time

---

### 🖼️ OLED Gameplay Visualization (128×64):

```
+------------------------+
|      ○        🍎       |
|                        |
|     ●●●                |
+------------------------+
```

- `○` = Snake head
- `●` = Snake body
- `🍎` = Food (just a pixel or small square)

---

### 🧰 Wiring Options:

- **Buttons**: one for "turn left", one for "turn right"
- **Joystick**: up/down/left/right
- Can also use **accelerometer** for tilt-to-turn (MPU6050)

---

### 🧠 Learning Outcomes:

- 2D array/grid logic and memory mapping
- Handling input and game state
- Basic collision detection
- Animation via frame refresh

---

### 💡 Enclosure Ideas:

- Retro mini handheld (3D-printed or laser-cut wood)
- Use soft-touch arcade buttons
- Add battery pack for true portability

---

## 🐍 Micro Snake – OLED Game (with Arduino Code)

### 📦 Assumptions:

- 2 pushbuttons: one for **turning left**, one for **turning right**
- SSD1306 OLED (I2C, 128x64)
- Snake moves in 4 directions: up, right, down, left

---

### 🧰 Wiring Diagram (example):

| Pin | Function          |
| --- | ----------------- |
| D2  | Turn Left Button  |
| D3  | Turn Right Button |
| A4  | OLED SDA          |
| A5  | OLED SCL          |

---

### ✅ Libraries Needed:

```cpp
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
```

Install via Library Manager if not already done.

---

### 🐍 Arduino Sketch:

```cpp
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Snake parameters
#define GRID_SIZE 4
#define MAX_LENGTH 64

int snakeX[MAX_LENGTH];
int snakeY[MAX_LENGTH];
int snakeLength = 3;
int direction = 1; // 0=UP, 1=RIGHT, 2=DOWN, 3=LEFT

int foodX, foodY;

unsigned long lastMoveTime = 0;
int moveDelay = 250; // ms

#define LEFT_BTN 2
#define RIGHT_BTN 3

void setup() {
  pinMode(LEFT_BTN, INPUT_PULLUP);
  pinMode(RIGHT_BTN, INPUT_PULLUP);

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.clearDisplay();

  // Init snake in center
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

void handleInput() {
  if (digitalRead(LEFT_BTN) == LOW) {
    direction = (direction + 3) % 4; // turn left
    delay(200); // debounce
  }
  if (digitalRead(RIGHT_BTN) == LOW) {
    direction = (direction + 1) % 4; // turn right
    delay(200); // debounce
  }
}

void moveSnake() {
  // Move body
  for (int i = snakeLength - 1; i > 0; i--) {
    snakeX[i] = snakeX[i - 1];
    snakeY[i] = snakeY[i - 1];
  }

  // Move head
  if (direction == 0) snakeY[0]--;
  if (direction == 1) snakeX[0]++;
  if (direction == 2) snakeY[0]++;
  if (direction == 3) snakeX[0]--;

  // Check collisions
  if (snakeX[0] < 0 || snakeX[0] * GRID_SIZE >= SCREEN_WIDTH ||
      snakeY[0] < 0 || snakeY[0] * GRID_SIZE >= SCREEN_HEIGHT) {
    gameOver();
  }

  for (int i = 1; i < snakeLength; i++) {
    if (snakeX[0] == snakeX[i] && snakeY[0] == snakeY[i]) {
      gameOver();
    }
  }

  // Check food
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
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(10, 25);
  display.println("Game Over");
  display.display();
  delay(3000);
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

### 🧠 Teaching Highlights:

- 2D logic via 1D arrays
- Direction state machine
- Grid drawing using pixel math
- Handling input and game reset

> **Think about using a joystick!**

---
