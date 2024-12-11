import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget(
      {super.key, required this.countryZone, required this.imgUrl,required this.voidCallback});
  final String countryZone;
  final String imgUrl;
  final VoidCallback voidCallback;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      color: Colors.white,
      child: ListTile(
        onTap: widget.voidCallback,
        title: Text(widget.countryZone),
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.imgUrl),
        ),
      ),
    );
  }
}
