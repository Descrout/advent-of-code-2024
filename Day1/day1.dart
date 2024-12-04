import 'dart:io';

void main() async {
  final inputFile = File("input.txt");
  final inputLines = await inputFile.readAsLines();

  final leftList = <int>[];
  final rightList = <int>[];

  for (final line in inputLines) {
    final splitted = line.split("   ");
    leftList.add(int.parse(splitted[0]));
    rightList.add(int.parse(splitted[1]));
  }

  leftList.sort();
  rightList.sort();

  int sum = 0;
  for (int i = 0; i < leftList.length; i++) {
    sum += (leftList[i] - rightList[i]).abs();
  }

  print("Day 1 Result: $sum");
}
