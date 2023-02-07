import 'package:edugame/provider/plants.dart';
import 'package:edugame/screens/detail_plant_screen.dart';
import 'package:edugame/utility/warna.dart';
import 'package:edugame/widget/custom/row_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlantsItem extends StatefulWidget {
  const PlantsItem({Key? key}) : super(key: key);

  @override
  State<PlantsItem> createState() => _PlantsItemState();
}

class _PlantsItemState extends State<PlantsItem> {
  @override
  Widget build(BuildContext context) {
    final plant = Provider.of<Plant>(context, listen: false);
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 40, left: 16, right: 16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.blue2(),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 160),
                child: Row(
                  children: [
                    Container(
                      height: 160,
                      width: 1,
                      color: MyColors.lightGrey(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 26, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowCustom(
                              judul: 'Nama Tumbuhan',
                              output: plant.nama,
                              color: MyColors.white(),
                            ),
                            RowCustom(
                              judul: 'Kingdom',
                              output: plant.kerajaan,
                              color: MyColors.white(),
                            ),
                            RowCustom(
                              judul: 'Kelas',
                              output: plant.kelas,
                              color: MyColors.white(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          child: SizedBox(
            width: 130,
            height: 200,
            child: Hero(
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
        Positioned(
          right: 30,
          top: 170,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                DetailPlant.routeName,
                arguments: plant.id,
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: MyColors.white(),
              elevation: 5,
            ),
            child: Text(
              'Selengkapnya',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: MyColors.blackFont(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
