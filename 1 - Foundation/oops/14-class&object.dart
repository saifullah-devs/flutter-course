class Mathematics{
  int add(int n1, int n2){
    return n1+n2;
  }

  int sub(int n1, int n2){
    return n1-n2;
  }

  int mult(int n1, int n2){
    return n1*n2;
  }
  
  double div(int n1, int n2){
    return n1 / n2;
  }
}

void main(){
  Mathematics math = new Mathematics();
  int n1 = 34;
  int n2 = 12;
  int addResult= math.add(n1, n2);
  print(addResult);
  int subResult= math.sub(n1, n2);
  print(subResult);
  int multResult= math.mult(n1, n2);
  print(multResult);
  double divResult= math.div(n1, n2);
  print(divResult);
}