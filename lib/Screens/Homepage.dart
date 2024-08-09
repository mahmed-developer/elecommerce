import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Placeholder(
      child: Scaffold(
        backgroundColor: const Color(0xff96d1c7),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(width: width,
                  height: 100,
                  margin: const EdgeInsets.only(top: 1, bottom: 1),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(offset: Offset(2, 2),blurRadius: 2)],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          ),

                  ),

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.start,
                        color: Color(0xffc3e703),
                      ),
                      Spacer(),


                      Column(
                        children: [
                          SizedBox(height: 25,),
                          Text(
                            'Delivery Address',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black26),
                          ),
                          Text(
                            'G11, Isb, Pakistan',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(CupertinoIcons.bell),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
