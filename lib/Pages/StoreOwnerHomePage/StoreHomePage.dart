import 'package:everyday_mart/Data/Data.dart';
import 'package:everyday_mart/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreHomePage extends StatefulWidget {
  const StoreHomePage({Key? key}) : super(key: key);

  @override
  _StoreHomePageState createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  TextEditingController nameController = TextEditingController();

  final int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Palette.blueColor,
        title: Text(
          "Start Creating Your Store",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              textField(context, "Search Store"),
              const SizedBox(height: 10),
              textField(context, "Visual Search"),
            ],
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      categories.length,
                      (index) {
                        return card(context, categories[index]['title'],
                            categories[index]['url']);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 12, height: MediaQuery.of(context).size.height),
              ],
            ),
          ),
        ],
      ),

      //BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.add_chart_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share_outlined),
            label: 'Marketing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        // onTap: (){},
      ),
    );
  }

  Widget card(BuildContext context, String title, String url) {
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 12),
      height: 180,
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5,
        child: Stack(
          children: [
            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: Image.asset(
                      "assets/images/apple.png",
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                    ),
                  ),
                  Text(
                    title,
                    style: GoogleFonts.ubuntu(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Palette.blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container textField(BuildContext context, String hintText) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: MediaQuery.of(context).size.width,
      height: 55,
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
              children: [
                const SizedBox(width: 5),
                Icon(
                  (hintText == "Search Store")
                      ? Icons.search
                      : Icons.camera_alt_outlined,
                  size: 28,
                  color: Colors.black,
                ),
                const SizedBox(width: 3),
              ],
            ),
            suffixIcon: Icon(
              (hintText == "Search Store") ? Icons.mic : null,
              size: 25,
              color: Colors.black,
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
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
