// ignore_for_file: use_super_parameters, avoid_print, unused_element, unnecessary_string_interpolations, prefer_const_constructors, prefer_final_fields

import 'package:animated_music_indicator/animated_music_indicator.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recognize_text/utils/theme_helper.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final primaryColorLight = const Color(0xFFD8E0ED);
  final primaryColorDark = const Color(0xFF2E3243);

  var isPressed = false;
  var isDark = false;

  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _isSpeechInitialized = false;
  String _text = 'Press the button and start speaking';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initializeSpeechRecognizer();
  }

  Widget dayNight() {
    final positionShadow = isDark ? -40.0 : -210.0;

    return Stack(
      children: [
        Container(
          width: 210,
          height: 210,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: isDark
                  ? [
                      const Color(0xFF30218F),
                      const Color(0xFF8D81DD),
                    ]
                  : [
                      const Color(0xFFFFCC81),
                      const Color(0xFFFF6E30),
                    ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          top: positionShadow,
          right: positionShadow,
          child: Container(
            width: 210,
            height: 210,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark ? primaryColorDark : primaryColorLight,
            ),
          ),
        ),
      ],
    );
  }

  Widget centerText() {
    return Text(
      isDark ? 'Parler...\n' : 'Toucher pour\nParler',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 44,
        fontWeight: FontWeight.bold,
        color: isDark ? primaryColorLight : primaryColorDark,
      ),
    );
  }

  Widget powerButton() {
    return Listener(
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (_) => setState(() {
        isPressed = false;
        isDark = !isDark;

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
          ),
        );
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark ? primaryColorDark : primaryColorLight,
          boxShadow: [
            BoxShadow(
              offset: const Offset(-5, 5),
              blurRadius: 10,
              color: isDark ? const Color(0xFF121625) : const Color(0xFFA5B7D6),
              inset: isPressed,
            ),
            BoxShadow(
              offset: const Offset(5, -5),
              blurRadius: 10,
              color: isDark ? const Color(0x4D9DA7CF) : Colors.white70,
              inset: isPressed,
            ),
          ],
        ),
        child: GestureDetector(
          onLongPress: isDark
              ? _isListening
                  ? _stopListening
                  : _startListening
              : _stopListening,
          onLongPressCancel: _stopListening,
          child: Icon(
            isDark ? Icons.mic_outlined : Icons.mic_off,
            size: 48,
            color: isDark ? primaryColorLight : primaryColorDark,
          ),
        ),
      ),
    );
  }

  Widget animateMusic() {
    return AnimatedMusicIndicator(
      numberOfBars: 8,
      size: 0.20,
      backgroundColor: Colors.transparent,
      barStyle: BarStyle.solid,
      roundBars: false,
      colors: const [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.black,
        Colors.greenAccent,
        Colors.purpleAccent,
        Colors.lightGreen,
        Colors.lightBlue,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? primaryColorDark : primaryColorLight,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            dayNight(),
            const SizedBox(height: 36),
            centerText(),
            const SizedBox(height: 30),
            isDark
                ? Text(
                    _text,
                    style: GoogleFonts.aBeeZee(color: Colors.white),
                  )
                : SizedBox(),
            const SizedBox(height: 30),
            powerButton(),
            const SizedBox(height: 36),
            isDark ? animateMusic() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  void _initializeSpeechRecognizer() async {
    _isSpeechInitialized = await _speech.initialize(
      onStatus: (status) => print('onStatus: $status'),
      onError: (errorNotification) => print('onError: $errorNotification'),
    );
    setState(() {});
  }

  void _startListening() async {
    if (_isSpeechInitialized && !_isListening) {
      _isListening = true;
      await _speech.listen(
        onResult: (result) {
          setState(() {
            // _text = result.recognizedWords;
            print(result.recognizedWords);
            //_initializeSpeechRecognizer();

            if (result.recognizedWords == 'Allumer') {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ThemeHelper()
                      .alertDialog("Success", "Commande effectuée", context);
                },
              );
              _initializeSpeechRecognizer();
            } else if (result.recognizedWords == 'Eteindre') {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ThemeHelper()
                      .alertDialog("Success", "Commande effectuée", context);
                },
              );
              _initializeSpeechRecognizer();
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ThemeHelper().alertDialog(
                      "Erreur", "Veuillez dire le bon mot", context);
                },
              );
              _initializeSpeechRecognizer();
            }
          });
        },
      );
      setState(() {});
    }
  }

  void _stopListening() async {
    if (_isListening) {
      await _speech.stop();
      _isListening = false;
      setState(() {});
    }
  }
}
