void main(){
  double length = 23.4;
  double breadth = 12.2;
  String area = areaRectangle(length, breadth);
  print(area);
}
String areaRectangle(double l, double breadth) => "Area of Rectangle is ${l* breadth}"; 