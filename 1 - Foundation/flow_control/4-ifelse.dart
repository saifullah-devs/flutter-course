void main() {
  int age=10;
  bool v= vote(age);
  print(v);
}

bool vote(int age){
  if(age>=18 && age<100){
    print("You can vote");
    return true;
  }else if(age>=100){
    print("Are you alive?");
    return true;
  }else if(age<=0){
    print("Are you born?");
    return false;
  }
  else{
    print("You cannot vote");
    return false;
    }
}