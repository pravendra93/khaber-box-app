import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('MMM dd-yyyy').format(_currentTime);
    String time = DateFormat('HH:mm:ss').format(_currentTime);

    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            bottom: BorderSide(
              width: 0.4,
              color: Colors.black54,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$date-$time',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            child: Row(
              spacing: 5,
              children: [
                SvgPicture.asset("assets/logo/facebook.svg"),
                SvgPicture.asset("assets/logo/instagram.svg"),
                SvgPicture.asset("assets/logo/link.svg"),
                SvgPicture.asset("assets/logo/twitter-x.svg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
