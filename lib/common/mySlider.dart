import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  MySlider({Key key, this.value, this.label}) : super(key: key);

  @required
  final double value;
  @required
  final String label;

  @override
  State<StatefulWidget> createState() => _MySlider();
}

class _MySlider extends State<StatefulWidget> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          //已拖动的颜色
          activeTrackColor: Colors.orange,
          //未拖动的颜色
          inactiveTrackColor: Color.fromARGB(100, 240, 230, 140),

          //提示进度的气泡的背景色
          //valueIndicatorColor: Colors.green,
          //提示进度的气泡文本的颜色
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
          ),

          //滑块中心的颜色
          thumbColor: Colors.orange,
          //滑块边缘的颜色
          overlayColor: Color.fromARGB(100, 240, 230, 140),

          //divisions对进度线分割后，断续线中间间隔的颜色
          inactiveTickMarkColor: Colors.greenAccent,
        ),
        child: Slider(
            value: value,
            label: '$value',
            min: 0,
            max: 100,
            onChanged: (v) {
              setState(() {
                value = v;
              });
            }));
  }
}
