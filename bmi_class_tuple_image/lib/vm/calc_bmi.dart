class CalcBMI {
  late double doubleWeight;
  late double doubleHeight;

  CalcBMI(String weight, String height) {
    doubleWeight = double.parse(weight);
    doubleHeight = double.parse(height) / 100;
  }

  calcAction() {
    String bmiString = '';    // bmi 분류
    String imageString = '';  // bmi Image
    double moveArrow;
    double bmi = double.parse(
        (doubleWeight / (doubleHeight * doubleHeight)).toStringAsFixed(1));
    if(bmi < 18.4){
      bmiString = '저체중';
      imageString = 'under.png';
      moveArrow = 10;
    }else if(bmi >= 18.5 && bmi <= 22.9){
      bmiString = '정상체중';
      imageString = 'normal.png';
      moveArrow = 91;
    }else if(bmi >= 23 && bmi <= 24.9){
      bmiString = '과체중';
      imageString = 'over.png';
      moveArrow = 171;
    }else if(bmi >= 25 && bmi <= 29.9){
      bmiString = '비만';
      imageString = 'obe.png';
      moveArrow = 251;
    }else{
      bmiString = '고도비만';
      imageString = 'ex.png';
      moveArrow = 330;
    }

    return(bmi.toString(), bmiString, imageString, moveArrow);
  }
}
