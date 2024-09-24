// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:recognize_text/animations/change_screen_animation.dart';
import 'package:recognize_text/utils/helper_functions.dart';

import 'login_content.dart';

class TopText extends StatefulWidget {
  const TopText({Key? key}) : super(key: key);

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> {
  @override
  void initState() {
    ChangeScreenAnimation.topTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HelperFunctions.wrapWithAnimatedBuilder(
      animation: ChangeScreenAnimation.topTextAnimation,
      child: Column(
        children: [
          Text(
            ChangeScreenAnimation.currentScreen == Screens.createAccount
                ? 'Nouveau\nCompte'
                : 'Bienvenue\n',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            ChangeScreenAnimation.currentScreen == Screens.createAccount
                ? ''
                : 'Recognize text est une application \n de commande des equipements \n par la voix',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black12),
          ),
          ChangeScreenAnimation.currentScreen == Screens.createAccount
              ? const SizedBox()
              : const SizedBox(
                  height: 45,
                )
        ],
      ),
    );
  }
}
