import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_api/controller/cart_controller.dart';
import 'package:shopping_app_using_api/view/cart_screen/widget/cart_screen.dart';
import 'package:shopping_app_using_api/controller/details_Screen_controller.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.productId});
  final String productId;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DetailsScreenController>().fetchProductDetails(
        prodId: widget.productId,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailsProvider = context.watch<DetailsScreenController>();
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
                  detailsProvider.productDetails?.price.toString() ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CartController>().addToCart(
                  context,
                  detailsProvider.productDetails!,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
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
                          detailsProvider.productDetails?.thumbnail
                                  .toString() ??
                              "",
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
              detailsProvider.productDetails?.title?.toString() ?? "",
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
                        text:
                            detailsProvider.productDetails?.rating.toString() ??
                            "",
                      ),
                      TextSpan(
                        style: TextStyle(color: Colors.grey),
                        text:
                            "${detailsProvider.productDetails?.reviews?.length ?? ""}",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Text(
              detailsProvider.productDetails?.description.toString() ?? "",
              style: TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
