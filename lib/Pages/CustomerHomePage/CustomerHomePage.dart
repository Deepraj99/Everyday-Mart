import 'package:everyday_mart/Data/Data.dart';
import 'package:everyday_mart/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Palette.blueColor,
        title: Text(
          "Explore Stores & Products Around You",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          textField(context),
          Flexible(
            child: ListView.builder(
              itemCount: productCategories.length,
              itemBuilder: (BuildContext, int index) {
                return card(
                  context,
                  productCategories[index]["url"],
                  productCategories[index]["title"],
                  productCategories[index]["type"],
                  productCategories[index]["rating"],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: buttomNavigationBar(),
    );
  }

  BottomNavigationBar buttomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Palette.blueColor,
      unselectedItemColor: Palette.blueColor,
      iconSize: 25,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_chart_outlined),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
      currentIndex: _currentIndex,
      // onTap: (){},
    );
  }

  Container card(BuildContext context, String url, String title, String type,
      String rating) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Image.asset(
                    "assets/images/welcome_screen_image.jpg",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Stack(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.bookmark,
                          size: 25,
                          color: Color(0xFF3b5999),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 23,
                      margin: const EdgeInsets.only(left: 10, top: 3),
                      child: Text(
                        title,
                        style: GoogleFonts.ubuntu(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 20,
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        type,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star_rate, color: Color(0xFF3b5999)),
                    const SizedBox(width: 5),
                    Text(
                      rating + "/5",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container textField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: MediaQuery.of(context).size.width,
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(100),
      ),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 3.5,
        child: TextField(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 5),
                Icon(
                  Icons.search,
                  size: 35,
                  color: Colors.black,
                ),
              ],
            ),
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.mic,
                  size: 25,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
              ],
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            hintText: "Produsts, Stores...",
            hintStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
