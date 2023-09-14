void main() {
  final List<int> numbers = [10, 2, 5, 7, 4];
  late int temp;
  for (var i = 0; i < numbers.length; i++) {
    if (numbers[i] > numbers[i + 1]) {
      temp = numbers[i];
      numbers[i + 1] = numbers[i];
      numbers[i] = temp;
    }
  }
}
