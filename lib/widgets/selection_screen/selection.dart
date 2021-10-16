import 'package:flutter/material.dart';
import 'package:liberdeck/screens/selection_screen.dart';

class Options extends StatefulWidget {
  const Options({required this.name, required this.colour});
  
  final Color colour;
  final String name;

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            const Icon(Icons.check, color: Colors.green),
            Center(
              child: Text(
                widget.name,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.create_rounded, color: Colors.black,)),
          ],
        )
        
      ),
    );
  }
}
