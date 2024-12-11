import 'package:flutter/material.dart';
import 'package:timeworld/models/card_model.dart';
import 'package:timeworld/widgets/card.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final List<CardModel> cardList = [
    CardModel(
      apiCountryZone: "Africa%2FCairo",
      countryZone: "Egypt-Cairo",
      imgUrl: "assets/egypt.png",
    ),
    CardModel(
      apiCountryZone: "Africa%2FAlgiers",
      countryZone: "Algeria-Algiers",
      imgUrl: "assets/algeria.png",
    ),
    CardModel(
      apiCountryZone: "Australia%2FSydney",
      countryZone: "Australia-Sydney",
      imgUrl: "assets/australia.png",
    ),
    CardModel(
      apiCountryZone: "America%2FToronto",
      countryZone: "Canada-Toronto",
      imgUrl: "assets/canada.png",
    ),
    CardModel(
      apiCountryZone: "Africa%2FCasablanca",
      countryZone: "Morocco-Casablanca",
      imgUrl: "assets/morocco.png",
    ),
    CardModel(
      apiCountryZone: "Asia%2FRiyadh",
      countryZone: "Saudi Arabia-Riyadh",
      imgUrl: "assets/sa.png",
    ),
    CardModel(
      apiCountryZone: "Africa%2FTunis",
      countryZone: "Tunisia-Tunis",
      imgUrl: "assets/tunisia.png",
    ),
  ];

  getAllCountriesData(int index) async {
    CardModel allCountries =
        CardModel(apiCountryZone: cardList[index].apiCountryZone,countryZone: "",imgUrl: "");
    await allCountries.getData();
    if (mounted) {
  Navigator.pop(context, {
    "countryZone": cardList[index].countryZone,
    "hour": allCountries.hour,
    "minute": allCountries.minute,
  });
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffbebfcb),
      appBar: AppBar(
        title: const Text(
          "Choose Locaton",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff42455b),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: cardList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardWidget(
                      countryZone: cardList[index].countryZone,
                      imgUrl: cardList[index].imgUrl,
                      voidCallback: () {
                        getAllCountriesData(index);
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
