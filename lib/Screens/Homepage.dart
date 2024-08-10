import 'package:elecommerce/Screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            Container(width: width,
              height: height/5.5,
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

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.logout_rounded,
                      size: 30,
                      color: Color(0xffc3e703),
                    ),
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                  ),
                 const Spacer(),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                  const Spacer(),
                  const Icon(CupertinoIcons.bell,
                  size: 30,),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(offset: Offset(2, 2),blurRadius: 2)],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),

              ),
              height: height/1.3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Categories",
                          style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Text(
                          "See all",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                          color: Colors.black26),
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next,),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
