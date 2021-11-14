import 'package:flutter/material.dart';
/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Gather - An app for Transformative Gatherings';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

  Widget _buildDecoratedImage(int imageIndex) => Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: Image.asset('images/resources$imageIndex.jpg'),
      ),
    );

 ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  //int imageIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    homePage,
    resourcePage,
    faqPage,
    linkPage,
    connectPage
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gather - Make every Meeting Transformative'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note,
            ),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.not_listed_location_rounded,
            ),
            label: 'FAQs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
            Icons.insert_link,
            ),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assistant),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.lightBlueAccent[700],
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget homePage = const CircleAvatar(
  backgroundImage: AssetImage('images/Logo.png'),
  radius: 400,
);

Widget resourcePage = Column(
  children: [
    Image.asset('images/resources0.png'),
    Image.asset('images/resources1.png'),
    Image.asset('images/resources2.png'),
    Image.asset('images/resources3.png'),
    Image.asset('images/resources4.png'),
    Image.asset('images/resources5.png'),
  ],
);

Widget faqPage = const Text(
  'Faqs',
  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, ),
);

Widget linkPage = const Text(
  'Links',
  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, ),
);

Widget connectPage = const Text(
  'Connect',
  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, ),
);