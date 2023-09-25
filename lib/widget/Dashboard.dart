import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xFFE8E6EA),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: mq.width*0.05,right: mq.width*0.05),
          child: Wrap(
            spacing: 30,
            runSpacing: 30,
             children: [
               dashboards(context, 'assets/images/analysis.png',"Data 1"),
               dashboards(context, 'assets/images/analytics.png',"Data 2"),
               dashboards(context, 'assets/images/analyticss.png',"Data 3"),
               dashboards(context, 'assets/images/statistics.png',"Data 4"),



             ]

          ),
        ),
      ),

    );
  }
  Widget dashboards(BuildContext context, String image ,String name ){
    final mq = MediaQuery.of(context).size;

    return   SizedBox(
      width: mq.width*0.35,
      height: mq.height*0.22,
      child: Card(
        // color:Color(0xFFE8E6EA),
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(child: Image.asset(image,)),
              Text("Data 1",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: mq.height*0.005,)

            ],
          ),
        ),
      ),
    );
  }

}

