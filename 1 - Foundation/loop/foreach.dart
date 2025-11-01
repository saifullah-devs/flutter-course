void main() {
  List<List<String>> sections = [
    /**0 */
    ["Ali", "Hasan", "Owais"],
    /**1 */
    ["abc", "123", "456"],
  ];

  abcXyz:
  for (List<String> students in sections) {
    for (String student in students) {
      if (student == "Hasan") {
        // true
        break abcXyz;
      }
      print(student);
    }
    print("=====");
  }
}
