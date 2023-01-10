class ExchangeViewmodel {
  ExchangeViewmodel();

  double parseVariationD1(double value, double previousValue) {
    if (value > previousValue) {
      var result = (value - previousValue) * 100 / value;
      return result;
    }
    var result = (value - previousValue) * 100 / previousValue;
    return result;
  }

  double parseVariationFromFirstDate(double value, double previousValue) {
    if (value > previousValue) {
      var result = (value - previousValue) * 100 / value;
      return result;
    }
    var result = (value - previousValue) * 100 / previousValue;
    return result;
  }
}
