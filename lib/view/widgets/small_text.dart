import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;

  final double size;
  final double height;
 // final TextOverflow overflow;

  const SmallText(
      {required this.text,

        this.size = 17,
        this.height=1.2
        });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,style: TextStyle(


        color: Colors.black,
        fontSize: size,
        height: height
      ),
maxLines: 10,
      ),
    );
  }
}
