import 'package:elecommerce/Screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
List<IconData> navicons = [
  Icons.home,
  Icons.list,
  Icons.shopping_cart,
  Icons.favorite,
  Icons.person,
];
int currentindex = 0;

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
      child: Column(
        children: [
          // Header Section
          Container(
            width: width,
            height: height / 5.5,
            margin: const EdgeInsets.only(top: 1, bottom: 1),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(offset: Offset(2, 2), blurRadius: 2)],
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
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
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
                        color: Colors.black26,
                      ),
                    ),
                    Text(
                      'G11, Isb, Pakistan',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  CupertinoIcons.bell,
                  size: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search the entire shop',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Promo Banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xffc3e703),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Text(
                    'Delivery is 50% cheaper',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.local_shipping, color: Colors.black),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Categories Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                CategoryItem(icon: Icons.phone_iphone, label: 'Phones'),
                CategoryItem(icon: Icons.videogame_asset, label: 'Consoles'),
                CategoryItem(icon: Icons.laptop, label: 'Laptops'),
                CategoryItem(icon: Icons.camera_alt, label: 'Cameras'),
                CategoryItem(icon: Icons.audiotrack, label: 'Audio'),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Flash Sale Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Flash Sale',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
              ],
            ),
          ),
          // GridView.count(
          //   crossAxisCount: 2,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   childAspectRatio: 0.7,
          //   children: const [
          //     FlashSaleItem(
          //       imageUrl: 'assets/iphone.jpg',
          //       title: 'Apple iPhone 15 Pro 128GB Natural Titanium',
          //       price: '£699.00',
          //       oldPrice: '£739.00',
          //     ),
          //     FlashSaleItem(
          //       imageUrl: 'assets/galaxy_buds.jpg',
          //       title: 'Samsung Galaxy Buds Pro True Wireless Black',
          //       price: '£69.00',
          //       oldPrice: '£85.00',
          //     ),
          //     // Add more items here
          //   ],
          // ),
        ],
      ),
    ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 10,
              )
            ],
            color: Colors.white),
        child: Row(
          children: [
            for (int i = 0; i < navicons.length; i++) ...<Expanded>{
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      currentindex=i;
                    });
                  },
                  child: Icon(navicons[i],
                    color: i == currentindex ? const Color(0xffc3e703) : Colors.black,
                    size: i==currentindex ? 30:26,
                  ),
                ),
              )
            }
          ],
        ),

      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffc3e703),
            child: Icon(icon, size: 30, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// class FlashSaleItem extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String price;
//   final String oldPrice;
//
//   const FlashSaleItem({
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//     required this.oldPrice,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Container(
//             height: 123,
//             child: Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 5), // Increase the spacing between the image and the text
//           Text(
//             title,
//             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           const Spacer(),
//           Text(
//             price,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//           Text(
//             oldPrice,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.red,
//               decoration: TextDecoration.lineThrough,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }