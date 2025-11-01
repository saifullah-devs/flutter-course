void main(){
  // final - runtime, can reside inside a class
  final String name = "Ali";
  // name ="Abbas"; -------error
  print(name);

  // const - compile time, can't reside inside a class
  const double e = 2.7;
  print(e);
}

class My{
    final String name = "Ali";
      static const double e = 2.7;
      // const double e = 2.7;--------error
}

class Another{
  double x= My.e;
  // String name = My.name; -------error
}