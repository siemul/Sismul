import 'dart:ui';

import 'package:edugame/screens/animal_screen.dart';
import 'package:edugame/screens/plant_screen.dart';
import 'package:edugame/utility/warna.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionScreen extends StatefulWidget {
  static const routeName = '/option';

  const OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Stack(
              children: [
                SizedBox(
                  height: 64,
                  width: 64,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset('assets/png/back.png'),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 8,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(AnimalScreen.routeName);
                              },
                              icon: Image.asset('assets/png/lions.png'),
                            ),
                          ),
                          SizedBox(height: 80),
                          Text(
                            'Animals',
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: MyColors.white(),
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 8,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(PlantScreen.routeName);
                              },
                              icon: Image.asset('assets/png/plants.png'),
                            ),
                          ),
                          SizedBox(height: 80),
                          Text(
                            'Plants',
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: MyColors.white(),
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
