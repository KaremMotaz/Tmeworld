import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeworld/models/card_model.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {


  getLoadingData() async {
    CardModel egyptCountry = CardModel(apiCountryZone: "Africa%2FCairo",imgUrl: "",countryZone: "");
    await egyptCountry.getData();
    if (mounted) {
  Navigator.pushReplacementNamed(context, "/home",
      arguments: {"minute": 0, "hour": 0});
}
  }

  @override
  void initState() {
    super.initState();
    getLoadingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          size: 70,
          itemBuilder: (BuildContext context, int index) {
            return const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
