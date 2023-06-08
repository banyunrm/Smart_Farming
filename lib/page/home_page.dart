import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/page/detail_page.dart';
import 'package:flutter_hidroponik/page/garden_page.dart';
import 'package:flutter_hidroponik/page/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hidroponik/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> farmList = [];
  List<dynamic> sensorList = [];
  Map<dynamic, dynamic> user = {};
  bool isLoaded = false;

  void _getData() async {
    final data = await User.dashboard();

    setState(() {
      farmList = data['farm'];
      sensorList = data['sensor'];
      user = data['user'];
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello, ${isLoaded ? user['username'][0].toUpperCase() + user['username'].substring(1) : '...'}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 17, 99, 97),
                  ),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Color.fromRGBO(28, 101, 140, 1),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ProfilePage(
                              user: user,
                            )));
                  },
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/img/people2.png',
            height: 300,
            width: 370,
          ),
          if (farmList.isNotEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  itemCount: farmList.length,
                  itemBuilder: (context, index) {
                    var farmItem = farmList[index];
                    var sensorItems = sensorList
                        .where(
                            (sensor) => sensor['_farm_id'] == farmItem['_id'])
                        .toList();
                    return GestureDetector(
                      onTap: () async {
                        final popped = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      farmDetail: farmItem,
                                      sensorItems: sensorItems,
                                    )));
                        if (popped == 'popped') {
                          _getData();
                        }
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: const Color.fromARGB(255, 178, 228, 216),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IntrinsicHeight(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Image.asset('assets/img/plant.png',
                                          fit: BoxFit.cover)),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          farmItem['name'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          farmItem['type'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          farmItem['farmArea']
                                                  ['\$numberDecimal']
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          farmItem['latitude']
                                                  ['\$numberDecimal']
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          farmItem['longitude']
                                                  ['\$numberDecimal']
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Tap Untuk',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              ' Detail',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromARGB(
                                                    255, 23, 107, 95),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          if (farmList.isEmpty && isLoaded)
            const Expanded(
              child: Center(
                  child: Text(
                'No Data',
                style: TextStyle(fontSize: 20),
              )),
            ),
          if (farmList.isEmpty && !isLoaded)
            const Expanded(
              child: Center(
                  child: Text(
                'Loading...',
                style: TextStyle(fontSize: 20),
              )),
            ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String received = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return const GardenPage();
          }));
          if (received == 'popped') {
            _getData();
          }
        },
        splashColor: const Color.fromARGB(255, 36, 96, 93),
        backgroundColor: const Color.fromARGB(255, 80, 143, 128),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
