
double truncateToTwoDecimalPlaces(double value) {
  int scaledValue = (value * 100).truncate(); // Remove extra decimals
  return scaledValue / 100;
}