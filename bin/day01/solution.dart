import 'dart:io';

class Elf {
  List<int> calories = [];
  int get caloriesSum {
    if (calories.length == 0) return 0;
    return calories.reduce((v, e) => v + e);
  }
}

void main(List<String> arguments) {
    final input = File('./bin/day01/input.txt').readAsStringSync();

    List<String> values = input.split('\n');
    List<Elf> elves = [new Elf()];

    for (var value in values) {
      if (value == '') {
        elves.add(new Elf());
      } else {
        elves.last.calories.add(int.parse(value));
      }
    }

    print('Part one: ' + partOne(elves).toString());
    print('Part two: ' + partTwo(elves).toString());
}

int partOne(List<Elf> elves) {
  elves.sort((a, b) => b.caloriesSum - a.caloriesSum);
  return elves.first.caloriesSum;
}

int partTwo(List<Elf> elves) {
  elves.sort((a, b) => b.caloriesSum - a.caloriesSum);
  return elves.sublist(0, 3).map((e) => e.caloriesSum).reduce((v, e) => v + e);
}
