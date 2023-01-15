import 'package:cookie_new/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'cookie_view.dart';
import 'widgets/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Electronics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(widget.title),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Varela'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications, color: Color(0xFF19191A)),
              onPressed: () {},
            )
          ]),
      body: ListView(
          padding: const EdgeInsets.only(left: 20.0),
          children: <Widget>[
            const SizedBox(height: 5.0),
            const Text("Categories",
                style: TextStyle(
                    color: Color(0xFFF17532),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Varela')),
            const SizedBox(height: 5.0),
            TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Color(0xFFC88D67),
                isScrollable: true,
                labelPadding: const EdgeInsets.only(right: 45.0),
                unselectedLabelColor: const Color(0xFFCDCDCD),
                tabs: const [
                  Tab(
                    child: Text('Electronics',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  )
                ]),
            SizedBox(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  CookiePage(),
                  CookiePage(),
                  CookiePage(),
                ],
              ),
            )
          ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          child: const Icon(Icons.payment)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBar(),
      drawer: const MyDrawer(),
    );
  }
}
