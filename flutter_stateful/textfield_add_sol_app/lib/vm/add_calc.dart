class AddCalc{
  // Property
  late String num1str;
  late String num2str;

  // Constructor
  // AddCalc(String num1str, String num2str){
  //   this.num1str = num1str;
  //   this.num2str = num2str;
  // }
  AddCalc(String num1str, String num2str)
    : this.num1str = num1str,
      this.num2str = num2str;

  // Function
  String addAction(){
    int num1 = int.parse(num1str);
    int num2 = int.parse(num2str);
    int addResult = num1 + num2;
    return "입력하신 숫자의 합은 $addResult 입니다.";
  }
}