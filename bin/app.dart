import 'package:horse_racer/horse.dart' as horse;
import 'package:horse_racer/race.dart' as race;
import 'dart:io';

void main() async {

  stdout.write('Enter amount of horse: ');
  String? userNumHorses = stdin.readLineSync();
  int numHorses = int.tryParse(userNumHorses ?? '') ?? 0;

  var nouns = await horse.Horse.getNounsList();
  var adjectives = await horse.Horse.getAdjectivesList();

  //intializing horses lists and populating 
  List<horse.Horse> horses = [];
  for (var i =0; i < numHorses; i++)
  {
    String fullName = horse.Horse.generateName(nouns, adjectives);
    horses.add(horse.Horse(fullName));
  }
}