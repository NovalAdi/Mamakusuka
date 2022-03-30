import 'package:flutter/material.dart';
import 'package:mamakusuka/DetailScreen.dart';
import 'package:mamakusuka/model/resep_item.dart';
import 'package:mamakusuka/resep_local.dart';
import 'package:mamakusuka/resep_minuman.dart';
import 'package:mamakusuka/resep_populer.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff32586B),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return MainScreen();
          } else if (constraints.maxWidth <= 1000) {
            return WebScreen(gridcount: 4);
          } else {
            return WebScreen(gridcount: 6);
          }
        },
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff263238),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Noval',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Apa yang ingin kamu masak ?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffFFE8C5),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('image/logo_xtension.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                      hintText: 'Telusuri Resep',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffFFE8C5),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'image/promo_card.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Hey, kamu punya 12 resep yang belum kamu coba di simpanan mu ...',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: TabBar(
                        labelPadding: EdgeInsets.all(10),
                        indicator: BoxDecoration(
                            color: Color(0xffFFE8C5),
                            borderRadius: BorderRadius.circular(10)),
                        labelColor: Color(0xff263238),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Text('Resep Popular'),
                          Text('Local'),
                          Text('Minuman'),
                        ],
                      ),
                    ),
                    Container(
                      height: 400,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: TabBarView(
                        children: [
                          ResepPopuler(),
                          ResepLocal(),
                          ResepMinuman(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WebScreen extends StatelessWidget {
  final int gridcount;

  WebScreen({required this.gridcount});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: TabBar(
              labelPadding: EdgeInsets.all(10),
              indicator: BoxDecoration(
                  color: Color(0xffFFE8C5),
                  borderRadius: BorderRadius.circular(10)),
              labelColor: Color(0xff263238),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Text('Resep Popular'),
                Text('Local'),
                Text('Minuman'),
              ],
            ),
          ),
          Container(
            height: 600,
            child: TabBarView(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: gridcount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                    children: ListItemResepPopular.map((resep) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ScreenDetail(resep: resep);
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff263238)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  child: Image.asset(
                                    resep.gambar,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  resep.nama,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 8, bottom: 16, left: 16),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      resep.rate,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: gridcount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                    children: ListItemResepLocal.map((resep) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ScreenDetail(resep: resep);
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff263238)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  child: Image.asset(
                                    resep.gambar,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  resep.nama,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 8, bottom: 16, left: 16),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      resep.rate,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: gridcount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                    children: ListItemResepMinuman.map((resep) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ScreenDetail(resep: resep);
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff263238)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  child: Image.asset(
                                    resep.gambar,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  resep.nama,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 8, bottom: 16, left: 16),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      resep.rate,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
