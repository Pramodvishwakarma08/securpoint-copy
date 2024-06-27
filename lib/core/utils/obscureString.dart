
String obscureString(String input) {
  if (input.length <= 2) {
    return input;
  }
  String firstCharacter = input[0];
  String lastCharacter = input[input.length - 1];
  String middleAsterisks = '*' * (input.length - 2);

  return '$firstCharacter$middleAsterisks$lastCharacter';
}