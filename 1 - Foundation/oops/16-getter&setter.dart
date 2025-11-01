class Mathematics{
  int _num = 0;
  int _den = 0;
  
  void printFraction() {
    print("Fraction: $_num/$_den");
  }

  //setter
  void set numerator(int val){
    _num = val * 6;
  }

  void set denumerator(int val){
    _den = val * 13;
  }
  int get numerator{
    return _num;
  }

  int get denumerator => _den;
  
}

void main(){
  Mathematics math = new Mathematics();
  math.numerator=5;
  math.denumerator= 7;
  print(math.numerator);
  print(math.denumerator);
  math.printFraction();

}