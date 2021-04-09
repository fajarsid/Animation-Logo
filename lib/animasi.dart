import 'package:flutter/material.dart';

class Animasi extends StatefulWidget {
  @override
  _AnimasiState createState() => _AnimasiState();
}

class _AnimasiState extends State<Animasi> with TickerProviderStateMixin {
  Animation animasi;
  AnimationController animasiController;

  @override
  void initState() {
    super.initState();
    animasiController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    animasi =
        CurvedAnimation(parent: animasiController, curve: Curves.bounceInOut);
    animasi.addListener(() {
      setState(() {});
    });
    animasi.addStatusListener((status) {
      if (status == AnimationStatus.completed) animasiController.reverse();

      if (status == AnimationStatus.dismissed) {
        Navigator.pop(context);
      }
    });
    animasiController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animasiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: (animasi.value * 100) + 50,
          height: (animasi.value * 100) + 50,
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
