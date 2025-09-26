import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_api/controller/home_screen_controller.dart';
import 'package:shopping_app_using_api/view/details_screen/details_screen.dart';
import 'package:shopping_app_using_api/view/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int select = 0;
  bool isSelected = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<HomeScreenController>().getCategories();
      await context.read<HomeScreenController>().getAllProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeScreenController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Discover",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [Icon(Icons.notification_add), SizedBox(width: 8)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                    },
                    decoration: InputDecoration(
                      label: Text("Search anything"),
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Icon(Icons.filter_list, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 15),

            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeProvider.categories.length,
                itemBuilder: (context, index) {
                  final isSelected = select == index;
                  return InkWell(
                    onTap: () {
                      setState(() async {
                        select = index;
                        await context
                            .read<HomeScreenController>()
                            .getAllProducts(
                              category: homeProvider.categories[index].slug,
                            );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            isSelected
                                ? Colors.black
                                : const Color.fromARGB(255, 146, 142, 142),
                      ),
                      child: Center(
                        child: Text(
                          homeProvider.categories[index].name ?? "",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),

                child: Center(
                  child:
                      homeProvider.isHomeLoading
                          ? CircularProgressIndicator()
                          : GridView.builder(
                            itemCount: homeProvider.productList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.95,
                                ),
                            itemBuilder: (context, index) {
                              final items = homeProvider.productList[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => DetailsScreen(
                                                      productId:
                                                          homeProvider
                                                              .productList[index]
                                                              .id
                                                              .toString(),
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 180,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  homeProvider
                                                          .productList[index]
                                                          .thumbnail ??
                                                      "",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Icon(Icons.favorite_border),
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Center(
                                        child: Text(
                                          homeProvider
                                                  .productList[index]
                                                  .title ??
                                              "",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Center(
                                        child: Text(
                                          homeProvider.productList[index].price
                                              .toString(),

                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
