import 'dart:io';

void main() async {
  final inputFile = File("input.txt");
  final inputLines = await inputFile.readAsLines();

  final leftList = <int>[];
  final rightList = <int>[];
  final rightMap = <int, int>{};

  for (final line in inputLines) {
    final splitted = line.split("   ");
    leftList.add(int.parse(splitted[0]));

    final n = int.parse(splitted[1]);
    rightList.add(n);
    rightMap[n] = (rightMap[n] ?? 0) + 1;
  }

  leftList.sort();
  rightList.sort();

  int sum1 = 0;
  int sum2 = 0;
  for (int i = 0; i < leftList.length; i++) {
    sum1 += (leftList[i] - rightList[i]).abs();
    sum2 += leftList[i] * (rightMap[leftList[i]] ?? 0);
  }

  print("Day1 Part1 Result: $sum1");
  print("Day1 Part2 Result: $sum2");
}
