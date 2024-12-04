import 'dart:io';

({int sign, bool safe}) isSafe(int a, int b, int signBefore) {
  final diff = a - b;
  final sign = diff.sign;
  if (sign == 0 || (signBefore != 0 && signBefore != sign)) {
    return (sign: sign, safe: false);
  }
  return (sign: sign, safe: diff.abs() < 4);
}

void main() async {
  final inputFile = File("input.txt");
  final inputLines = await inputFile.readAsLines();

  int safeCount1 = 0;
  int safeCount2 = 0;

  for (final line in inputLines) {
    final splitted = line.split(" ");

    safeCount1++;
    safeCount2++;
    int signBefore = 0;
    bool tolerated = false;
    int tolerateMissOnce = 0;
    for (int i = 1; i < splitted.length; i++) {
      final a = int.parse(splitted[i - (1 + tolerateMissOnce)]);
      final b = int.parse(splitted[i]);
      final result = isSafe(a, b, signBefore);
      if (!result.safe) {
        if (tolerated) {
          safeCount2--;
          break;
        }
        safeCount1--;
        tolerated = true;
        tolerateMissOnce = 1;
        continue;
      }
      tolerateMissOnce = 0;
      signBefore = result.sign;
    }
  }

  print("Day2 Part1 Result: $safeCount1");
  print("Day2 Part2 Result: $safeCount2");
}
