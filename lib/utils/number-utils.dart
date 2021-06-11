class NumberUtils {
  static String formatMoneyAmount(int value, {bool recursive = false}) {
    // 800000
    var string = value.toString();
    if (!recursive && value == 0) {
      return '0';
    }
    if (value < 10) {
      return '00${value.toString()}';
    } else if (value < 100) {
      return '0${value.toString()}';
    } else if (value < 1000) return value.toString();

    if (string.length <= 3) return value.toString();
    var i = value.toString().length % 3;
    i = i == 0 ? 3 : i;
    return string.substring(0, i) +
        ' ' +
        formatMoneyAmount(int.tryParse(string.substring(i)), recursive: true);
  }
}
