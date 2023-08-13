int findOutlier(List<int> numbers) {
  int evenCount = 0;
  int oddCount = 0;
  int? even;
  int? odd;

  for (final int number in numbers) {
    if (number.isEven) {
      evenCount++;
      even = number;
    } else {
      oddCount++;
      odd = number;
    }
  }

  if (evenCount > 1 && oddCount == 1) {
    return odd!;
  } else if (oddCount > 1 && evenCount == 1) {
    return even!;
  }

  return 0;
}
