class Calc{
  // Property
  late String numstr1;
  late String numstr2;

  // Constructor
  Calc(String numstr1, String numstr2)
    : this.numstr1 = numstr1,
      this.numstr2 = numstr2;

  // Function
  String addResult(){
    return (int.parse(numstr1) + int.parse(numstr2)).toString();
  }

  String subResult(){
    return (int.parse(numstr1) - int.parse(numstr2)).toString();
  }

  String multiResult(){
    return (int.parse(numstr1) * int.parse(numstr2)).toString();
  }

  String divResult(){
    return (double.parse(numstr1) / double.parse(numstr2)).toString();
  }
}