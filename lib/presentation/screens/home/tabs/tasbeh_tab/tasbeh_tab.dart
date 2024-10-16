import "package:flutter/material.dart";
import "package:quran_app_c12_online_sun/core/assets_manager.dart";
import "package:quran_app_c12_online_sun/core/strings_manger.dart";

class TasbehTab extends StatefulWidget {
  TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 1;
  int tasbehNumber = 1;
  List<String> sebhaList = [
    'سبحان الله',
    'الحمد لله ',
    'الله اكبر',
  ];
  String tasbehText = 'سبحان الله';
  double angle = 0.1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Transform.rotate(
                    angle: angle, // 45 degrees in radians
                    child: const Image(
                      image: AssetImage(AssetsManager.bodySebhaLight),
                    ),
                  ),
                ),
                Positioned(
                  top: 1,
                  child: Image(
                    image: AssetImage(AssetsManager.headSebhaLight),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              StringsManager.sebhaNumber,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                child: Text(
                  tasbehNumber.toString(),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                countAndRotateSebha();
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: Text(
                    tasbehText.toString(),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            //const HadithHeaderWidget(),
          ],
        ),
      ),
    );
  }

  void countAndRotateSebha() {
    tasbehNumber++;
    counter++;
    if (counter > 99) {
      counter = 0;
      tasbehNumber = 0;
    } else if (counter == 33 || counter == 66) {
      tasbehNumber = 0;
    }

    if (counter > 0 && counter <= 33) {
      tasbehText = sebhaList[0];
    } else if (counter > 33 && counter <= 66) {
      tasbehText = sebhaList[1];
    } else if (counter > 66 && counter <= 99) {
      tasbehText = sebhaList[2];
    }

    setState(() {
      angle += 0.1;
    });
  }
}
