import 'dart:ui';

import 'package:edugame/utility/warna.dart';
import 'package:edugame/widget/plants_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/plants.dart';

class PlantScreen extends StatefulWidget {
  static const routeName = '/option-plants';

  const PlantScreen({Key? key}) : super(key: key);

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PlantList>(context).getPlants().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final plantData = Provider.of<PlantList>(context);
    final plants = plantData.list;
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/png/bg4.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Stack(
              children: [
                Row(
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
                    Expanded(
                      child: Text(
                        'Macam - Macam Tumbuhan',
                        style: TextStyle(
                          fontFamily: 'dino',
                          fontSize: 40,
                          color: MyColors.blue2(),
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: MyColors.red(),
                          backgroundColor: MyColors.white(),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: ListView.builder(
                          itemCount: plants.length,
                          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                            value: plants[i],
                            child: const PlantsItem(),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
