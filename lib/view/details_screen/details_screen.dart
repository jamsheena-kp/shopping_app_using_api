import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Price", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Text(
                  "PKR 1,190",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
              label: Text("Add to Cart", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notification_add, color: Colors.black),
          SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 320,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.webp?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 9,
                    child: Icon(Icons.favorite_border, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Regular fit slogan",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Icon(Icons.star_rate, color: Colors.amberAccent),
                SizedBox(width: 4),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: "4.5/5 ",
                      ),
                      TextSpan(
                        style: TextStyle(color: Colors.grey),
                        text: "(45 reviews)",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Text(
              "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
              style: TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(height: 20),
            Text(
              "Choose size",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children:
                  ["S", "M", "L"].map((size) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            size,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
