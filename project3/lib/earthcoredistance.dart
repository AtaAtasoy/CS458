import 'package:flutter/material.dart';

class EarthCoreDistance extends StatelessWidget {
  const EarthCoreDistance({Key? key , this.onPressed }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EarthCoreDistance',
      home: Scaffold(
        body: Column(children: [
          Text("Calculate Distance to the Earth's Core"),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your coordinates')),
          ElevatedButton(
              onPressed: () => onPressed?.call(),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: Row(children: [
                Icon(
                  Icons.map_rounded,
                  key: Key('icon-go'),
                ),
                Text("Find my distance!")
              ])),
          Text("Distance to the Core: ")
        ]),
      ),
    );
  }
}
