import 'package:flutter/material.dart';
import 'package:map_app/custom_markers/custom_markers.dart';

class TestMarkerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 150,
          color: Colors.red,
          child: CustomPaint(
            painter: MarkerInicioPainter(250),
            // painter: MarkerDestinoPage(
            //     'Mi casa por algún lado  sdsd sdsdsddel mundo, está aquí,jsjshsjshsjs sshdsuhdushd',
            //     2509),
          ),
        ),
      ),
    );
  }
}
