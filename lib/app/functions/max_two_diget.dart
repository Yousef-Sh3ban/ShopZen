
double truncateToTwoDecimalPlaces(double value) {
  int scaledValue = (value * 100).truncate(); 
  return scaledValue / 100;
}