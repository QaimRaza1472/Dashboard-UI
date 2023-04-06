import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
           // height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child:Column(
              children: [

                SizedBox(height: 50,),
                ListTile(
                  title: Text("Hi Qaim",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                  ),
                  ),
                  subtitle: Text("Good Morning ",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white54,
                  ),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ) ,
                ),
                const SizedBox(height: 30,),
                Container(
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                      ),
                    ),
                    child: GridView.count(
                         shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                       crossAxisSpacing: 40,
                       mainAxisSpacing: 30,
                       children: [
                        itemDashboard('Videos', CupertinoIcons.play_rectangle, Colors.deepOrange),
                        itemDashboard('Analytics',CupertinoIcons.graph_circle, Colors.green),
                        itemDashboard('Audience', CupertinoIcons.person_2, Colors.purple),
                        itemDashboard('Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
                        itemDashboard('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo),
                        itemDashboard('Upload',  CupertinoIcons.add_circled, Colors.teal),
                        itemDashboard('About',  CupertinoIcons.question_circle, Colors.blue),
                        itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent),
                      ],
                    ),
                  ),
                ),





              ],
            ),
          ),

        ],
      ),
    );
  }
  itemDashboard(String title, IconData iconData,  Color background)=>
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
           BoxShadow(
             offset: const Offset(0, 5),
             color: Theme.of(context).primaryColor.withOpacity(0.2),
             spreadRadius: 2,
             blurRadius: 5,
           ),
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData,color:Colors.white ,),
            ),
            SizedBox(height: 8,),
            Text(title,
            style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
  );
}

