import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_api/controller/home_screen_controller.dart';
import 'package:shopping_app_using_api/view/details_screen/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int select = 0;
  bool isSelected = false;
  List<Map<String, dynamic>> dressItem = [
    {
      "image":
          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.jpg?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
      "title": "Regular fit slogan",
      "subtitle": "PKR 1,190",
      "icon": Icon(Icons.favorite_outline, color: Colors.black),
    },
    {
      "image":
          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.jpg?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
      "title": "Regular fit polo",
      "subtitle": "PKR 1,100 -52%",
      "icon": Icon(Icons.favorite_outline, color: Colors.black),
    },
    {
      "image":
          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.jpg?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
      "title": "Regular fit color block",
      "subtitle": "PKR 1,690",
      "icon": Icon(Icons.favorite_outline, color: Colors.black),
    },
    {
      "image":
          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.jpg?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
      "title": "Regular fit v-neck",
      "subtitle": "PKR 1,290",
      "icon": Icon(Icons.favorite_outline, color: Colors.black),
    },
    {
      "image":
          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.jpg?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
      "title": "Regular fit slogan",
      "subtitle": "PKR 1,190",
      "icon": Icon(Icons.favorite_outline, color: Colors.black),
    },
    {
      "image":
          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.jpg?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
      "title": "Regular fit color block",
      "subtitle": "PKR 1,690",
      "icon": Icon(Icons.favorite_outline, color: Colors.black),
    },
    {
      "image":
          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.jpg?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
      "title": "Regular fit color block",
      "subtitle": "PKR 1,690",
      "icon": Icon(Icons.favorite_outline, color: Colors.black),
    },
    {
      "image":
          "https://media.istockphoto.com/id/1542566108/photo/young-businessman-smiling-at-camera.jpg?s=2048x2048&w=is&k=20&c=fhjNCzVb8pijG09XiptTOKwucLpyD6jVy0VzsZW2FaY=",
      "title": "Regular fit color block",
      "subtitle": "PKR 1,690",
      "icon": Icon(Icons.favorite_outline, color: Colors.black),
    },
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<HomeScreenController>().getCategories();
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
                      setState(() {
                        select = index;
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

                child: GridView.builder(
                  itemCount: dressItem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (context, index) {
                    final items = dressItem[index];
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
                                      builder: (context) => DetailsScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(items['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: items['icon'],
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Center(
                              child: Text(
                                items['title'],
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
                                items['subtitle'],
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
          ],
        ),
      ),
    );
  }
}
