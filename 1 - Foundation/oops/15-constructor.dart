class Mathematics{
  int n1 = 0;
  int n2 = 0;
  // constructoe
  Mathematics(int n1, int n2){
    print("Object is created.");
    this.n1 = n1;
    this.n2 = n2;
  }
  Mathematics.namedConstructor(){
    print("THis is a named Construcctor.");
  }

  int add(){
    return this.n1+this.n2;
  }

  int sub(){
    return this.n1-this.n2;
  }

  int mult(){
    return this.n1*this.n2;
  }
  
  double div(){
    return this.n1/this.n2;
  }
}

void main(){
  int n1 = 34;
  int n2 = 12;
  Mathematics math = new Mathematics(n1, n2);
  // Mathematics math = new Mathematics.namedConstructor();
  int addResult= math.add();
  print(addResult);
  int subResult= math.sub();
  print(subResult);
  int multResult= math.mult();
  print(multResult);
  double divResult= math.div();
  print(divResult);
}