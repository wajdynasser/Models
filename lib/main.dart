
import 'package:exxam/pages/detials.dart';
import 'package:flutter/material.dart';

import 'modules/list_item.dart';

void main() {
  runApp(const ExamWorkspace());
}

class ExamWorkspace extends StatefulWidget {
  const ExamWorkspace({super.key});

  @override
  State<ExamWorkspace> createState() => _ExamWorkspaceState();
}

class _ExamWorkspaceState extends State<ExamWorkspace> {
  final ListItem getinfo = ListItem(); // Ensure ListItem is correctly defined
  List<dynamic> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = getinfo.items; // Initialize with all items
  }

  void _filterItems(String query) {
    List<dynamic> results = [];
    if (query.isEmpty) {
      results = getinfo.items;
    } else {
      results = getinfo.items
          .where((item) =>
              item.infoProduct.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/second': (context) => const DetailsPage(), // second page route
      },
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                _rowTop(),
                const SizedBox(height: 10),
                _searchField(),
                const SizedBox(height: 15),
                SizedBox(
                  height: 100, // Define a height for the cards list
                  child:
                      _cards(),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: _listItems(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Cards Display Widget
  Widget _cards() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(filteredItems[index].pathImage),
              ),
              Text(filteredItems[index].infoProduct,
                  style: const TextStyle(fontSize: 13)),
            ],
          ),
        );
      },
    );
  }

  // List of Items Display Widget
  Container _listItems(BuildContext context) {
    return Container(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: filteredItems.length,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(filteredItems[index].pathImage),
                ),
                Text(
                  filteredItems[index].infoProduct,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                // Use Hero animation for the IconButton
                Hero(
                  tag: 'heroIcon-$index', // Unique tag for each item
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white54,
                    child: IconButton(
                      icon: Image(
                          image: AssetImage(filteredItems[index].navImage)),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/second',
                          arguments: <String, String>{
                            'infoProduct':
                                filteredItems[index].infoProduct.toString(),
                            'imageUrl':
                                filteredItems[index].navImage.toString(),
                            'tag': 'heroIcon-$index'.toString(),
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Search Field Widget
  Container _searchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 30,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          _filterItems(value); // Filter items on text change
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white,
          hintText: '  Search',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  // Header of the page
  Padding _rowTop() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Hi ~"),
              Text(
                "Wajdy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
          Text('Exam'),
          Icon(Icons.notification_add),
        ],
      ),
    );
  }
}
