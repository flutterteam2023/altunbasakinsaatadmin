class OnBoardingModel {
  String? image;
  String? title;
  String? description;
  String buttonText;
  Function()? onTap;
  OnBoardingModel(
      {this.image,
      this.title,
      this.description,
      required this.buttonText,
      this.onTap});
}
