import 'package:edugame/firebase_options.dart';
import 'package:edugame/provider/animals.dart';
import 'package:edugame/provider/plants.dart';
import 'package:edugame/screens/animal_screen.dart';
import 'package:edugame/screens/detail_animal_screen.dart';
import 'package:edugame/screens/detail_plant_screen.dart';
import 'package:edugame/screens/main_screen.dart';
import 'package:edugame/screens/option_screen.dart';
import 'package:edugame/screens/plant_screen.dart';
import 'package:edugame/widget/animals_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AnimalList(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlantList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
        routes: {
          OptionScreen.routeName: (ctx) => const OptionScreen(),
          AnimalScreen.routeName: (ctx) => const AnimalScreen(),
          DetailAnimal.routeName: (ctx) => const DetailAnimal(),
          PlantScreen.routeName : (ctx) => const PlantScreen(),
          DetailPlant.routeName : (ctx) => const DetailPlant()
        },
      ),
    );
  }
}
