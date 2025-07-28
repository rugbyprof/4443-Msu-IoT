## 🎮 **"Catch the Dot" Game — OLED Edition**

### 🧠 Concept:

A small dot (pixel or square) "falls" from the top of the screen. The player moves a horizontal paddle at the bottom using a potentiometer or accelerometer to catch it. Think: _single-pixel Tetris meets Breakout._

---

### 🔧 Hardware Requirements:

| Component          | Notes                      |
| ------------------ | -------------------------- |
| 🧠 Microcontroller | Arduino Uno/Nano or ESP32  |
| 📺 OLED Display    | SSD1306 (128x64, I2C)      |
| 🎛️ Input Device    | Potentiometer _or_ MPU6050 |
| 🔊 Optional        | Buzzer for sound feedback  |

---

### 🖼️ OLED Display Layout:

```
+------------------------+   ← OLED (128x64)
|                        |
|    falling dot (●)     |
|                        |
|                        |
|               ███      |   ← paddle controlled by player
+------------------------+
```

---

### 🕹️ Game Rules:

- Dot falls vertically, one step at a time.
- Paddle moves left/right based on analog input.
- If dot lands on paddle — score +1!
- If missed — game over or lose a life.
- Speed increases over time.

---

### 💻 Arduino Sketch (Simplified):

```cpp
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET    -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

int paddleWidth = 20;
int paddleY = SCREEN_HEIGHT - 8;
int ballX, ballY;
int paddleX;
int score = 0;
bool gameOver = false;

void setup() {
  pinMode(A0, INPUT);
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.clearDisplay();
  randomSeed(analogRead(0));
  resetBall();
}

void loop() {
  if (!gameOver) {
    display.clearDisplay();

    // Read potentiometer (or map MPU6050 later)
    int sensorValue = analogRead(A0);
    paddleX = map(sensorValue, 0, 1023, 0, SCREEN_WIDTH - paddleWidth);

    // Draw paddle
    display.fillRect(paddleX, paddleY, paddleWidth, 5, SSD1306_WHITE);

    // Move ball
    display.fillCircle(ballX, ballY, 2, SSD1306_WHITE);
    ballY += 2;

    // Check for catch
    if (ballY >= paddleY) {
      if (ballX >= paddleX && ballX <= paddleX + paddleWidth) {
        score++;
        resetBall();
      } else {
        gameOver = true;
      }
    }

    display.display();
    delay(100); // Game speed
  } else {
    display.clearDisplay();
    display.setTextSize(2);
    display.setTextColor(SSD1306_WHITE);
    display.setCursor(10, 20);
    display.println("Game Over");
    display.setCursor(10, 45);
    display.print("Score: ");
    display.print(score);
    display.display();
    delay(2000);
    score = 0;
    gameOver = false;
    resetBall();
  }
}

void resetBall() {
  ballX = random(0, SCREEN_WIDTH);
  ballY = 0;
}
```

---

### 🧠 Learning Outcomes:

- Analog input mapping (potentiometer/accelerometer)
- OLED graphics rendering with `Adafruit_GFX`
- Game loop structure & collision detection
- Creative design (they can customize shapes and speed)

---

### Other Versions:

Make a version using the **MPU6050** (tilt to move paddle).
