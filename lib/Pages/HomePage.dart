import 'package:flutter/material.dart';
import 'package:inext_assignment/widget/Dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xFFE8E6EA),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(mq.width*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu,size: 34,),
                  Text("DashBoardApp",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),
                  Icon(Icons.settings,size: 34,),
                ],
              ),
              Container(height: 1,color: Colors.black,),
              SizedBox(height: mq.height*0.03,),
              Text("Dashboard Options",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'cursive',
                  color: Colors.blueAccent
                ),
              ),
                SizedBox(height: mq.height*0.03,),
              Expanded(
                  child: Dashboard())
            ],
          ),
        ),
      ),
    );
  }
}


