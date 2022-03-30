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
        pathImage: "assets/pictures/png/logoMenu.png",
        title: "FindyGo",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
          color: Color.fromARGB(255, 111, 207, 151),
          fontSize: 42.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description:
            "FindyGo, c'est la plateforme pour vendre ou acheter des vêtements et matériels de sport d'occasion.\n\n\n Tu ne t'en sers plus, vends les !",
        styleDescription: const TextStyle(
          color: Color.fromARGB(255, 111, 207, 151),
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
        ),
        marginDescription: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: const Text(
          "Notre but :",
          style: TextStyle(
            color: Color.fromARGB(255, 111, 207, 151),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
        ),
        // backgroundImage: "images/forest.png",
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        backgroundColor: Colors.white,
        pathImage: "assets/pictures/png/logoMenu.png",
        title: "FindyGo",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
          color: Color.fromARGB(255, 111, 207, 151),
          fontSize: 42.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description:
        "Inscrit toi pour pouvoir commencer à déposer des articles et les vendre ainsi que réaliser de bonnes affaires !",
        styleDescription: const TextStyle(
          color: Color.fromARGB(255, 111, 207, 151),
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
        ),
        marginDescription: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: const Text(
          "Notre but :",
          style: TextStyle(
            color: Color.fromARGB(255, 111, 207, 151),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
        ),
        // backgroundImage: "images/forest.png",
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
  }

  void onDonePress() {
    // Quand l'utilisateur valide le dernier slide
    // Aller à la page Home
    Navigator.of(context).pushNamed(ROUTE_HOME);
  }

  void onNextPress() {
    // Lorsque l'on clique sur la page suivant
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: Color.fromARGB(255, 111, 207, 151),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Color.fromARGB(255, 111, 207, 151),
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      color: Color.fromARGB(255, 111, 207, 151),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color.fromARGB(50, 111, 207, 151)),
      overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 111, 207, 151)),
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
      colorDot: const Color.fromARGB(50, 111, 207, 151),
      colorActiveDot: const Color.fromARGB(255, 111, 207, 151),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.white,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}
