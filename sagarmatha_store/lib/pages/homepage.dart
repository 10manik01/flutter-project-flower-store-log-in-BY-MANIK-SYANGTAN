import 'package:flutter/material.dart';
import '../models/getapimodel.dart';
import '../services/networkHelper.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Posts>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    //print('Sagarmatha');
    getData();
    super.initState();
  }

  getData() async {
    posts = await NetworkHelper().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: Color.fromARGB(255, 34, 108, 255),
            fontSize: 22,
            fontWeight: FontWeight.w500,
            letterSpacing: .0,
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Good Afternoon,User',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: Material(
                        elevation: 10.0,
                        shadowColor: Colors.blueGrey,
                        child: Image.asset('images/covidbanner.png'))),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Material(
                        elevation: 10.0,
                        shadowColor: Colors.blueGrey,
                        child: Image.asset('images/covidbanner.png'))),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return Visibility(
                  visible: isLoaded,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Material(
                      elevation: 5.0,
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: ListTile(
                          tileColor: Colors.white,
                          leading: SizedBox(
                            child: Image.asset('images/flower.png'),
                          ),
                          title: Container(
                            child: Text(
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18,
                              ),
                              posts![index].name ?? 'No Data',
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                'Rs. ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 19, 107, 189),
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                style: TextStyle(
                                  color: Color.fromARGB(255, 19, 107, 189),
                                  fontSize: 18,
                                ),
                                posts![index].price.toString(),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Color.fromARGB(255, 19, 96, 196),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
