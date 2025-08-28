// Liam Breytenbach
// Thesis - 2D Game Design using GameMaker
// This code is used to on the controller to mimic the keys pressed on a keyboard.

#include <Keyboard.h>;

int VRx;
int VRy;
bool powerOn = false;
int onCount = 0;

long currentTime;
long timePassed;
long prevTime;

void setup() {
  // Keyboard.begin();
  Serial.begin(19200);

  // Digital Pins (Button Switches)
  pinMode(2, OUTPUT);
  pinMode(8, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);
  pinMode(9, INPUT_PULLUP);

  // Analog Pins (Joystick)
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);

  // Power
  powerOn = false;

  //Time 
  currentTime = millis();
  prevTime = currentTime;

  delay(200);
}

void loop() {

  // Time
  currentTime = millis();

  // Power Button
  if (digitalRead(9) == LOW) {
    if(powerOn == false) {
      powerOn = true;
      if (onCount < 5){
        Keyboard.write("t");
        delay(1000);
        digitalWrite(2, HIGH);
        delay(1000);
        onCount = 10;
      }
    }
    else {
      powerOn = false;
      if (onCount > 5) {
        Keyboard.write("t");
        delay(1000);
        digitalWrite(2, LOW);
        delay(1000);
        onCount = 0;
      }
    }
  }

  // If there is power, check controller buttons
  if (powerOn == true) {
    controller();
  }


  // Keyboard.write('p');
  // delay(3000);
  // Keyboard.println('test');
  // delay(1000);
}


void controller() {

  //Time
  currentTime = millis();
  timePassed = currentTime - prevTime;

  // Digital Pins (Button Switches)
  if (digitalRead(8) == LOW && timePassed > 250) {
    Keyboard.write(' ');
    prevTime = currentTime;
    //delay(100);
  }
  if (digitalRead(4) == LOW && timePassed > 500) {
    Keyboard.press(KEY_RETURN);
    prevTime = currentTime;
    Keyboard.release(KEY_RETURN);
    //delay(100);
  }
  if (digitalRead(5) == LOW && timePassed > 1000) {
    Keyboard.write('p');
    prevTime = currentTime;
    //delay(100);
  }
  if (digitalRead(6) == LOW && timePassed > 2000) {
    Keyboard.write(KEY_ESC);
    prevTime = currentTime;
    //delay(100);
  }

  // Analog Pins (Joystick)
  VRx = analogRead(A0);
  VRy = analogRead(A1);
  if (VRx > 700) {
    Keyboard.release(KEY_RIGHT_ARROW);
    Keyboard.press(KEY_LEFT_ARROW); // X Axis is reversed
  }
  else if (VRx < 100) {
    Keyboard.release(KEY_LEFT_ARROW);
    Keyboard.press(KEY_RIGHT_ARROW); // X Axis is reversed
  }
  else {
    Keyboard.release(KEY_RIGHT_ARROW);
    Keyboard.release(KEY_LEFT_ARROW);
  }
  if (VRy > 700) {
    Keyboard.release(KEY_DOWN_ARROW);
    Keyboard.press(KEY_UP_ARROW);
  }
  else if (VRy < 100) {
    Keyboard.release(KEY_UP_ARROW);
    Keyboard.press(KEY_DOWN_ARROW);
  }
  else {
    Keyboard.release(KEY_UP_ARROW);
    Keyboard.release(KEY_DOWN_ARROW);
  }
  
}
