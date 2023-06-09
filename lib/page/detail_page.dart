import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/page/device_page.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final dynamic farmDetail;
  final dynamic sensorItems;
  const DetailPage({super.key, this.farmDetail, this.sensorItems});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _farmDetail = {};
  var _sensorItems = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  var addData = {};

  void _getData() async {
    setState(() {
      _farmDetail = widget.farmDetail;
      _sensorItems = widget.sensorItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Color.fromRGBO(43, 90, 82, 1),
                    ),
                    onTap: () {
                      Navigator.pop(context, 'popped');
                    },
                  ),
                  Text('Detail',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 36, 96, 93),
                      )),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 20, top: 20),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 52, 113, 88), width: 1)),
                )),
            const SizedBox(height: 50),
            Card(
              margin: const EdgeInsets.only(left: 25, right: 25),
              color: const Color.fromARGB(255, 50, 93, 71),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Nama Lahan: ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                        Text(_farmDetail['name'],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Tipe Lahan: ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                        Text(_farmDetail['type'],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Latitude Lahan: ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                        Text(
                            _farmDetail['latitude']['\$numberDecimal']
                                .toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Longitude Lahan: ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                        Text(
                            _farmDetail['longitude']['\$numberDecimal']
                                .toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Luas Area Lahan: ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                        Text(
                            _farmDetail['farmArea']['\$numberDecimal']
                                .toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              margin: const EdgeInsets.only(left: 25, right: 25),
              color: const Color.fromARGB(255, 50, 93, 71),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Sensor Tersedia :'
                          ' ',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                      if (_sensorItems.isNotEmpty)
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: _sensorItems.length,
                          itemBuilder: (context, index) {
                            var sensor = _sensorItems[index];
                            return Text(
                              sensor['name'],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      if (_sensorItems.isEmpty)
                        Text(
                          'Tidak ada sensor',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                    ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DevicePage(
              farm: widget.farmDetail,
            );
          }));
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
