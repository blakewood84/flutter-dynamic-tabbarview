import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

const headerContent = ['YEEEEEW \n\n\ DYNAMICALLY RENDER STUFF! \n\n\n YEAH YEAH YEAH!'];


const slide1 = ['YES! \n\n YO!', 'YES! \n\n YO!', 'YES! \n\n YO!'];

const slide2 = ['YES! \n\n YO!', 'YES! \n\n YO!',];

const slide3 = ['YES! \n\n YO!', 'YES! \n\n YO!', 'YES! \n\n YO!', 'YES! \n\n YO!', 'YES! \n\n YO!', 'YES! \n\n YO!', 'YES! \n\n YO!',];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late TabController tabController = TabController(length: 3, vsync: this);
  bool fixedScroll = false;

  late ScrollController _scrollController = ScrollController();

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Column(
            children: [
                Container(
                  height: 400,
                  width: 200,
                  color: Colors.red
                ),
                Text('HELLO!!!'),
                Text('HELLO!!!'),
                Text('HELLO!!!'),
                Text('HELLO!!!'),
                Text('HELLO!!!'),
                Text('HELLO!!!'),
                Container(
                  height: 400,
                  width: 200,
                  color: Colors.red
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              color: Colors.blueGrey[600],
              child: TabBar(
                controller: tabController,
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                  });
                },
                isScrollable: true,
                indicatorWeight: 5,
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                labelColor: Colors.black87,
                tabs: const [
                  Tab(text: 'Items'),
                  Tab(text: 'Attachments'),
                  Tab(text: 'Invoices')
                ],
              ),
            ),
            IndexedStack(
              children: <Widget>[
                Visibility(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: slide1.length,
                    itemBuilder: (context, index) {
                      return Text(slide1[index]);
                    },
                  ),
                  maintainState: true,
                  visible: selectedIndex == 0,
                ),
                Visibility(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: slide2.length,
                    itemBuilder: (context, index) {
                      return Text(slide2[index]);
                    },
                  ),
                  maintainState: true,
                  visible: selectedIndex == 1,
                ),
                Visibility(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: slide3.length,
                    itemBuilder: (context, index) {
                      return Text(slide3[index]);
                    },
                  ),
                  maintainState: true,
                  visible: selectedIndex == 2,
                ),
              ],
              index: selectedIndex,
            ),
        ],
      ),
    );
  }
}




