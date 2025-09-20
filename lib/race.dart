import 'dart:math';
import 'package:horse_racer/horse.dart';

class Race 
{
  List<Horse> horses;
  int raceDistance;

  //Constructor for Race
  Race(this.horses, this.raceDistance);

  List<Horse> simulateRace()
  {
    final rand = Random();

    //Refresh horse stats
    for (var h in horses)
    {
      h.refreshForRace();
    }

    List<Horse> winners = [];
    
    //Run rounds until there are 3 winners
    while(winners.length < 3){
      for (var h in horses){
        if (!winners.contains(h)){
          
          if(h.currStamina >= 0){
          h.currStamina -= 1;
          }

          if(h.currSpeed < h.maxSpeed){
            h.currSpeed += h.acceleration;
            //Making sure current speed does not surpass max speed
            if(h.currSpeed > h.maxSpeed) h.currSpeed = h.maxSpeed;
          }
          
          int stumble = rand.nextInt(11);
          if(stumble > h.luck){
            h.currDistance += h.currSpeed;
          }

          if(h.currDistance >= raceDistance){
            winners.add(h);
            print('${h.name} crosses');
          }
        }
      }
    }
    //return the winners if they tie return those as well so might be more than 3 "winners"
    return winners;
  }
  
}