import 'package:edugame/utility/warna.dart';
import 'package:edugame/widget/custom/row_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/animals.dart';

class DetailAnimal extends StatefulWidget {
  static const routeName = '/option-animals-detail';

  const DetailAnimal({Key? key}) : super(key: key);

  @override
  State<DetailAnimal> createState() => _DetailAnimalState();
}

class _DetailAnimalState extends State<DetailAnimal> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.network('assets/videos/video.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final animalId = ModalRoute.of(context)?.settings.arguments as String;
    final animal =
        Provider.of<AnimalList>(context, listen: false).findById(animalId);
    final animalList = Provider.of<AnimalList>(context).list;
    return Scaffold(
      backgroundColor: MyColors.background(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: animal.id,
                child: FadeInImage(
                  placeholder:
                      const AssetImage('assets/png/animal-placeholder.png'),
                  image: NetworkImage(
                    animal.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 15),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 550,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: MyColors.white(),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0,
                                blurRadius: 10),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  animal.namaHewan,
                                  style: GoogleFonts.poppins(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.semiBlack(),
                                  ),
                                ),
                                // child: SizedBox(
                                //   width: 90,
                                //   height: 90,
                                //   child: Image.network(animal.imageUrl, fit: BoxFit.cover,),
                                // ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width,
                                color: MyColors.lightGrey(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 180, top: 30, left: 16),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RowCustom(
                                      judul: 'Nama Hewan',
                                      output: animal.namaHewan,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Nama Ilmiah',
                                      output: animal.ilmiah,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Kelas',
                                      output: animal.kelas,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Kingdom',
                                      output: animal.kerajaan,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Ordo',
                                      output: animal.ordo,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Deskripsi',
                                      output: animal.description,
                                      color: MyColors.semiBlack2(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 46,
                      top: 130,
                      child: SizedBox(
                        width: 130,
                        height: 200,
                        child: Hero(
                          tag: animal.id,
                          child: FadeInImage(
                            placeholder: const AssetImage(
                                'assets/png/animal-placeholder.png'),
                            image: NetworkImage(
                              animal.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20)
                // Text(
                //   'Nama Hewan : ${animal.namaHewan}',
                //   style: TextStyle(
                //     fontFamily: 'dino',
                //     fontSize: 24,
                //     color: MyColors.blue2(),
                //     decoration: TextDecoration.none,
                //   ),
                // ),
                // SizedBox(height: 15),
                // Text(
                //   'Kelas Hewan : ${animal.kelas}',
                //   style: TextStyle(
                //     fontFamily: 'dino',
                //     fontSize: 24,
                //     color: MyColors.blue2(),
                //     decoration: TextDecoration.none,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
