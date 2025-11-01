void main() {
  int tableOf = 2;
  for (int tblValue = 1; tblValue <= 10; tblValue++) {
    // this sum is in scope of loop only can't be used outside
    int sum = tblValue * tableOf;
    print(sum);
  }
}
