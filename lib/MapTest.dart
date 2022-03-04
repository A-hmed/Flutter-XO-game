void main(){

  List<String> number=['1','2','3','4','5'];

  List<int> newNumbers=number.map((n){
    print(n);
  }).toList();
  print(newNumbers);


}