import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

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
    aboutPage
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
              Icons.business,
            ),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
            ),
            label: 'FAQs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
            ),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.yellowAccent[700],
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget homePage = const CircleAvatar(
  backgroundImage: AssetImage('images/Logo.png'),
  radius: 400,
);

/*
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
*/

Widget resourcePage=ListView(

  children: [
   Image.asset('images/resources0.png'),
   Text(''),
   Image.asset('images/resources1.png'),
   Text(''),
   Image.asset('images/resources2.png'),
   Text(''),
   Image.asset('images/resources3.png'),
   Text(''),
   Image.asset('images/resources4.png'),
   Text(''),
   Image.asset('images/resources5.png'),
   Text(''),
 ],

 //padding: EdgeInsets.only(top:10.0),

);

Widget faqPage = ListView(
  children: [
    Text(''),
    Text( 'Frequently Asked Questions',
    style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.cyan, fontSize: 40,fontStyle: FontStyle.italic),
    ), 
    ),
    Text(''),
    Text( 'Q: What events can be used for transformative gatherings?',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text( 'A:Any gathering of people, strangers or loved ones, can become a transformative gathering. This include birthday parties, baby showers, and large organized festivals.',
    style: TextStyle(fontSize: 20, color: Colors.grey), ),
    Text(''),
    Text( 'Q: How do I start planning a transformative gathering?',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text( 'A: See the resource page for advice and directions on starting the planning process.',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text(''),
    Text( 'Q: What is the difference in good controversy and hostility?',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text( 'A: Good controversy sparks healthy conversations where both parties think deeply about the discussion had, while hostility comes from unhealthy conversations and neither side can move on to consider the discussion afterwards.',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text(''),
    Text(''),
    Text( 'Common Misconceptions',
    style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.cyan, fontSize: 40,fontStyle: FontStyle.italic),
    ), 
    ),
    Text(''),
    Text(''),
    Text( 'I could never use this with my family.',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text( 'A family holiday can be organized to foster a transformative gathering as well as any gathering of people. A hostile Christmas dinner could develop into good controversy and eye-opening connections with the practices of a transformative gathering.',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text(''),
    Text( 'This can only happen on a large scale event with strangers.',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text( 'Transformative gatherings are meant to be used to upgrade everyday interactions to foster meaningful connections with both strangers and loved ones.',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),

  ],
);

Widget linkPage = Column(
  children: <Widget>[
    InkWell(
      child: Image.asset('images/link_9.png'),
      onTap: () => launch('https://bit.ly/3Df17U1')
    ),
    InkWell(
      child: Image.asset('images/link_10.png'),
      onTap: () => launch('https://www.nytimes.com/column/together-apart')
    ),
    InkWell(
      child: Image.asset('images/link_11.png'),
      onTap: () => launch('http://www.globalhumanproject.net/the-big-table2.html')
    ),
    InkWell(
      child: Image.asset('images/link_12.png'),
      onTap: () => launch('https://www.eventtia.com/en/blog/how-to-design-transformative-experiences-for-your-attendees')
    ),
  ],
);

Widget aboutPage =  Column(
  children: [
    Text(''),
    Text( 'What are Transformative Gatherings?',
    style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.cyan, fontSize: 40,fontStyle: FontStyle.italic),
    ), 
    ),
    Text( 'These are gatherings of individuals to foster quality connections and good controversy. Instead of surface level and ordinary gatherings that leave the social interactions to chance, these transformative gatherings foster an environment to encourage guests to continue the real conversations with them until after the gathering and perhaps lead them to influence change.',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    ),
    Text(''),
    Text( 'End the polite small talk',
    style: TextStyle(fontSize: 40, color: Colors.cyan, fontStyle: FontStyle.italic), 
    ),
    Text( 'These are important in order to foster important conversations in everyday life without hostility. This is the embodiment of good controversies. These conversations are needed to encourage guests to create actual change about the issues they take interest in.',
    style: TextStyle(fontSize: 20, color: Colors.grey), 
    )    
  ],
  
);