import 'package:findygo/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

class IntroScreenState extends StatefulWidget {
  IntroScreenState({Key? key}) : super(key: key);

  @override
  _IntroScreenStateState createState() => _IntroScreenStateState();
}

class _IntroScreenStateState extends State<IntroScreenState> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        backgroundColor: Colors.white,
        pathImage: "assets/pictures/logo2.png",
        description:
            "FindyGo, c'est la plateforme pour vendre ou acheter des vêtements et matériels de sport d'occasion.\n\n\n Tu ne t'en sers plus, vends les !",
        styleDescription: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'Montserrat',
        ),
      ),
    );
    slides.add(
      Slide(
        backgroundColor: Colors.white,
        pathImage: "assets/pictures/logo2.png",
        description:
        "Inscrit toi pour pouvoir commencer à déposer des articles et les vendre ainsi que réaliser de bonnes affaires !",
        styleDescription: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'Montserrat',
        ),
        ),
    );
  }

  void onDonePress() {
    // Quand l'utilisateur valide le dernier slide
    // Aller à la page Home
    Navigator.of(context).pushNamed(ROUTE_SEARCH);
  }

  void onNextPress() {
    // Lorsque l'on clique sur la page suivant
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: Color(0xFF4C5059),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Color(0xFF4C5059),
    );
  }

  Widget loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        child: const Text('CONNEXION',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          primary: const Color(0xFF4C5059),
        ),
        onPressed: () => {}
      ),
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      color: Color(0xFF4C5059),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFFA4B5BF)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0xFF4C5059),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: slides,

      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      onNextPress: onNextPress,
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: const Color(0xFFA4B5BF),
      colorActiveDot: const Color(0xFF3D403F),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.white,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}
