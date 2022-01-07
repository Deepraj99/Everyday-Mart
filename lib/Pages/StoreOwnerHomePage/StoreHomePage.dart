import 'package:everyday_mart/Data/Data.dart';
import 'package:everyday_mart/utils/Colors.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Start creating your ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.blueColor,
                      ),
                      children: [
                        TextSpan(
                          text: "STORE",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Palette.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  textField(context, "Search Store"),
                  textField(context, "Visual Search"),
                ],
              ),
            ],
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                12,
                (index) {
                  return Center(
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 15,
                          height: 185,
                          decoration: BoxDecoration(
                            color: Palette.blueColor.withOpacity(1),
                            border: Border.all(color: Palette.yellowColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.network(
                              categories[index]['url'],
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: 80,
                            ),
                            Text(
                              categories[index]['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFDD835),
                              ),
                            ),
                          ],
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

  //TextField
  Container textField(BuildContext context, String text) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        width: MediaQuery.of(context).size.width / 2.2,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: Colors.grey[300],
            filled: true,
            prefixIcon: Icon(
              (text == "Search Store") ? Icons.search : Icons.camera_alt,
              color: Colors.black,
            ),
            suffixIcon: Icon(
              (text == "Search Store") ? Icons.mic : null,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            contentPadding: const EdgeInsets.all(10),
            hintText: text,
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
        ));
  }
}
