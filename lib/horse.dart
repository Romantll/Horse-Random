import 'dart:math';

class Horse {
  int currDistance;
  int currSpeed;
  int currStamina;
  int maxStamina;
  int maxSpeed;
  int acceleration;
  int luck;
  

  Horse()
    : currDistance = 0,
      currSpeed = 0,
      maxSpeed = Random().nextInt(100) + 10,
      maxStamina = Random().nextInt(10) + 1,
      acceleration = Random().nextInt(10) + 1,
      luck = Random().nextInt(10) + 1,
      currStamina = 0 
      {
        currStamina = maxStamina;
      }
}
  
