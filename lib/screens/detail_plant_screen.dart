import 'package:edugame/provider/plants.dart';
import 'package:edugame/utility/warna.dart';
import 'package:edugame/widget/custom/row_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailPlant extends StatefulWidget {
  static const routeName = '/option-plants-detail';

  const DetailPlant({Key? key}) : super(key: key);

  @override
  State<DetailPlant> createState() => _DetailPlantState();
}

class _DetailPlantState extends State<DetailPlant> {
  @override
  Widget build(BuildContext context) {
    final plantId = ModalRoute.of(context)?.settings.arguments as String;
    final plant =
        Provider.of<PlantList>(context, listen: false).findById(plantId);
    return Scaffold(
      backgroundColor: MyColors.background(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: plant.id,
                child: FadeInImage(
                  placeholder:
                      const AssetImage('assets/png/animal-placeholder.png'),
                  image: NetworkImage(
                    plant.imageUrl,
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
                                  plant.nama,
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
                                      judul: 'Nama Tumbuhan',
                                      output: plant.nama,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Nama Latin',
                                      output: plant.namaLatin,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Kelas',
                                      output: plant.kelas,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Kingdom',
                                      output: plant.kerajaan,
                                      color: MyColors.semiBlack2(),
                                    ),
                                    RowCustom(
                                      judul: 'Deskripsi',
                                      output: plant.deskripsi,
                                      color: MyColors.semiBlack2(),
                                    ),
                                  ],
                                ),
                              ),
                            )
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
                          tag: plant.id,
                          child: FadeInImage(
                            placeholder: const AssetImage(
                                'assets/png/animal-placeholder.png'),
                            image: NetworkImage(
                              plant.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
