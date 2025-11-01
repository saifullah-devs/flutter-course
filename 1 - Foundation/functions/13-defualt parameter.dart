void main(){
  double l = 3.0;
  double b = 5.0;
  // double r = 4.0;
  print(areareectangle(l, b));
  // print(areaCircle(r: r));
  print(areaCircle());
}
double areareectangle(double l, double b){
  return l*b;
}
double areaCircle({double r=4.0}){
  return 3.14*r*r;
}