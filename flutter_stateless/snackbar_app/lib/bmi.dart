class Bmi {
  late double height;
  late double weight;

  late double result;

  Bmi.init();

  Bmi(double height, double weight)
      :this.height = height,
      this.weight = weight,
      this.result = weight/(height*height*0.0001)
      ;
      

  String bmiResult(double bmi){
    String result = "";
    if(bmi < 0){
      print('잘못된 값');
    } else{
      if(bmi >= 0 && bmi <=18.4){
        result = '저체중';
      }else if(bmi >= 18.5 && bmi <=22.9){
        result = '정상체중';
      }else if(bmi >= 23 && bmi <=24.9){
        result = '과체중';
      }else if(bmi >= 25 && bmi <=29.9){
        result = '비만';
      }else if(bmi >= 30){
        result = '고도비만';
      }
    }
    return result;
  }
  double bmiCalc(double height, double weight){
    height = height * 0.01;
    return weight/(height*height);
  }

  double bmiCalcProperty(){
    height = height * 0.01;
    return weight/(height*height);
  }
}