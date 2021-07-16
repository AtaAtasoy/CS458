import 'package:flutter/material.dart';

class EarthCoreDistance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Calculate Distance to the Earth's Core", textDirection: TextDirection.ltr),
      ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          child: Row(children: [
            Icon(
              Icons.map_rounded,
              key: Key('icon-go'),
            ),
            Text('Find my distance!', textDirection: TextDirection.ltr)
          ])),
    ]);
  }
}
