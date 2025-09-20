import 'package:horse_racer/horse.dart';
import 'package:horse_racer/race.dart';
import 'dart:io';

void main() async {
  int raceIteration = 0;
  List<Horse> lastWinners = [];

  stdout.write('Enter amount of horses: ');
  String? userNumHorses = stdin.readLineSync();
  int numHorses = int.tryParse(userNumHorses ?? '') ?? 0;

  stdout.write('Enter Distance of race: ');
  String? userDistance = stdin.readLineSync();
  int distance = int.tryParse(userDistance ?? "") ?? 0;

  stdout.write('Enter number of races: ');
  String? userNumRaces = stdin.readLineSync();
  int numRaces = int.tryParse(userNumRaces ?? "") ?? 0;

  if (numHorses <=0 || distance <= 0 || numRaces <=0)
  {
    print('Input incorrect');
    return;
  }

  //Getting list of names/adjectives
  var nouns = await Horse.getNounsList();
  var adjectives = await Horse.getAdjectivesList();

  //intializing horses lists and populating 
  List<Horse> horses = [];
  for (var i =0; i < numHorses; i++)
  {
    final fullName = Horse.generateName(nouns, adjectives);
    horses.add(Horse(fullName));
  }

  //Constructing Race
  Race race = Race(horses, distance);
  //Runnning race simulations until reaches number of races
  while(raceIteration < numRaces)
  {
    final winners = race.simulateRace();
    final need = numHorses - winners.length;
    final additions = <Horse>[];

    //Repopulating amount of horse racers
    for (int i = 0; i < need; i++)
    {
      final fullName = Horse.generateName(nouns, adjectives);
      additions.add(Horse(fullName));
    }

    //Using spread operator '...' jto flatten list
    final nextRoster = [...winners, ...additions];  
    race = Race(nextRoster, distance);
    lastWinners = winners;
    raceIteration++;
  }
  
  print('\n=== Final Winners ===');
  for (final h in lastWinners)
  {
    print(h);
  }
}