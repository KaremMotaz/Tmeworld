import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Map receivedData = {};

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    receivedData.isEmpty
        ? receivedData = ModalRoute.of(context)!.settings.arguments as Map
        : {};

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: receivedData["hour"] >= 5 && receivedData["hour"] <= 18
                  ? const AssetImage("assets/day.png")
                  : const AssetImage("assets/night.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, "/location");
                setState(() {
                  result == null
                      ? receivedData = {
                          "hour": 0,
                          "minute": 0,
                          "countryZone": "",
                        }
                      : receivedData = {
                          "hour": result["hour"],
                          "minute": result["minute"],
                          "countryZone": result["countryZone"],
                        };
                });
              },
              icon: const Icon(
                Icons.edit_location,
                color: Color(0xffee898e),
                size: 28,
              ),
              label: const Text(
                "Edit location",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(163, 88, 81, 184),
                ),
                padding: WidgetStatePropertyAll(EdgeInsets.all(18)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(111, 0, 0, 0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (receivedData["hour"] == 0)
                      const Text(
                        "Please choose country !",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    else if (receivedData["hour"] > 12)
                      Text(
                        "${(receivedData["hour"] - 12).toString().padLeft(2, '0')}:${receivedData["minute"].toString().padLeft(2, '0')} PM",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      )
                    else
                      Text(
                        "${receivedData["hour"].toString().padLeft(2, '0')}:${receivedData["minute"].toString().padLeft(2, '0')} AM",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    Text(
                      receivedData["countryZone"] ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
