import 'dart:convert';
import 'dart:io';
import 'dart:math';

class Horse {
  int currDistance;
  int currSpeed;
  int currStamina;
  int maxStamina;
  int maxSpeed;
  int acceleration;
  int luck;
  
  static final adjectivesFile = File('assets/nouns-1.txt');
  static final nounsFile = File('assets/adj-1.txt');


  static Future<List<String>> getNounsList() async
  {
      return await nounsFile.readAsLines(encoding: utf8);
  }


  static Future<List<String>> getAdjectivesList() async
  {
      return await adjectivesFile.readAsLines(encoding: utf8);
  }

  //Generating a random name 
  static String generateName(List<String> nouns, List<String> adjectives)
  {
      var rand = Random();
      var randomNoun = nouns[rand.nextInt(nouns.length)];
      var randomAdjectives = adjectives[rand.nextInt(adjectives.length)];

      //50% chance it is just an adjective & noun, else just noun
      if(rand.nextBool())
      {
        return "$randomAdjectives $randomNoun";
      }else {
        return randomNoun;
      }
  }

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
  
