import 'dart:io';

class Match {
  String input = '';

  Match(String input) {
    this.input = input;
  }

  int getScore(String choice) {
    switch (choice.toLowerCase()) {
      case 'a':
      case 'x':
        return 1;
      case 'b':
      case 'y':
        return 2;
      case 'c':
      case 'z':
        return 3;
      default:
        // Should never get here
        return 0;
    }
  }

  int get theirScore {
    String choice = input.split(' ').first;
    return getScore(choice);
  }

  int get myScore {
    String choice = input.split(' ').last;
    return getScore(choice);
  }

  // their score - my score: -1 and 2 means I win, 1 and -2 means they win. 0 means draw
  bool get win {
    int sumScore = theirScore - myScore;
    return sumScore == -1 || sumScore == 2;
  }

  bool get draw {
    int sumScore = theirScore - myScore;
    return sumScore == 0;
  }

  int get totalScore {
    return myScore + (win ? 6 : draw ? 3 : 0);
  }
}

void main(List<String> arguments) {
    final input = File('./bin/day02/input.txt').readAsStringSync();

    List<Match> matches = input.split('\n').map((e) => new Match(e)).toList();

    int totalScore = matches.map((e) => e.totalScore).reduce((v, e) => v + e);

    print('Part one: ' + totalScore.toString());
}
