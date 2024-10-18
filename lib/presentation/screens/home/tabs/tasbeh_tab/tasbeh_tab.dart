import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quran_app_c12_online_sun/core/assets_manager.dart';
import 'package:quran_app_c12_online_sun/core/colors_manager.dart';
import 'package:quran_app_c12_online_sun/presentation/screens/home/tabs/tasbeh_tab/widget/tasbeh_header.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({Key? key}) : super(key: key);

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> with TickerProviderStateMixin {
  late AnimationController _controller;
  double _currentAngle = 0; // Tracks the current angle
  final double _step = 2 * 30 / pi; // Rotate
  int _tasbeehCount = 0; // Track the tasbeeh count
  List<String> ZekrName = ["سبحان الله" , "الحمدلله " , "الله اكبر" , "لا اله الا الله"];
int index = 0 ;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // Short animation for smooth rotation
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  void _rotateStep() {
   // Prevent multiple animations

    setState(() {
      _currentAngle += _step; // Increment the angle
       if(_tasbeehCount<=32){
         _tasbeehCount++;


       }
       else {
         _tasbeehCount=0 ;
       if(index<=2){
         index++ ;
       }
       else{
         index=0 ;
       }
       }

    });

    _controller.forward() ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
           tasbehHeader(controller: _controller, currentAngle: _currentAngle,) ,
          const SizedBox(height: 30),
          const Text(
            "عدد التسبيحات",
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 20),
          Card(
            color: ColorsManager.goldColor.withOpacity(0.5),
            child: Container(
              height: 60,
              width: 55,
              child: Center(
                child: Text(
                  '$_tasbeehCount', // Display tasbeeh count
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(ColorsManager.goldColor),
            ),
            onPressed: _rotateStep, // Rotate one step per button press
            child:   Text(
             ZekrName[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
