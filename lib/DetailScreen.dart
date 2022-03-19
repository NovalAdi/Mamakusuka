import 'package:flutter/material.dart';
import 'package:mamakusuka/model/resep_item.dart';

class ScreenDetail extends StatelessWidget {
  final ItemResep resep;

  ScreenDetail({required this.resep});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWeb(resep: resep);
        } else {
          return DetailCarousel(resep: resep);
        }
      },
    );
  }
}

class DetailCarousel extends StatelessWidget {
  late final ItemResep resep;

  DetailCarousel({required this.resep});

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return Scaffold(
      backgroundColor: Color(0xff263238),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          maxRadius: 4,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          maxRadius: 4,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          maxRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  child: Image.asset(resep.gambar),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 32),
                child: Text(
                  resep.judulDetail,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        resep.rate,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '[ ' + resep.review + ' Reviews ]',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  color: Color(0xffFFE8C5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        child: Text(
                          resep.durasi +
                              'Menit      |      ' +
                              resep.serving +
                              ' Serving      |      ' +
                              resep.tingkatKesusahan,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff263238),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            resep.chef,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 24.0),
                          child: FollowButton(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 24),
                child: Card(
                  color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          'Bahan- Bahan :',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 24.0, left: 24, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //untuk menyebarkan list secara vertikal
                            ...List.generate(
                                resep.bahanBahan.length,
                                (index) => Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: Colors.white,
                                          size: 8,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          resep.bahanBahan[index],
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.start,
                                        )
                                      ],
                                    )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cara Membuat :',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ...List.generate(
                          resep.caraMembuat.length,
                          (index) => Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '${i++}. ' + resep.caraMembuat[index],
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FollowButton extends StatefulWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: !isOn
          ? Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffFCE5C1), width: 2),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffFCE5C1), width: 2),
                color: Color(0xffFCE5C1),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Followed',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xff263238),
                    ),
                  ),
                ),
              ),
            ),
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
      },
    );
  }
}

class DetailWeb extends StatelessWidget {
  final ItemResep resep;

  DetailWeb({required this.resep});

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return Scaffold(
      backgroundColor: Color(0xff32586B),
      body: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 16),
              decoration: BoxDecoration(
                  color: Color(0xffFFE8C5),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.arrow_back, color: Colors.grey),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  child: ClipRRect(
                    child: Image.asset(resep.gambar),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff263238),
                  ),
                  margin: EdgeInsets.all(24),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 32),
                            child: Text(
                              resep.judulDetail,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24, top: 32),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thumb_up,
                                  color: Colors.yellow,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    resep.rate,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '[ ' + resep.review + ' Reviews ]',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Card(
                              color: Color(0xffFFE8C5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 16),
                                    child: Text(
                                      resep.durasi +
                                          'Menit      |      ' +
                                          resep.serving +
                                          ' Serving      |      ' +
                                          resep.tingkatKesusahan,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff263238),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.account_circle_rounded,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        resep.chef,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 24.0),
                                      child: FollowButton(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0, left: 24),
                            child: Card(
                              color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Text(
                                      'Bahan- Bahan :',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 24.0, left: 24, right: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        //untuk menyebarkan list secara vertikal
                                        ...List.generate(
                                            resep.bahanBahan.length,
                                            (index) => Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.white,
                                                      size: 8,
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      resep.bahanBahan[index],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      textAlign:
                                                          TextAlign.start,
                                                    )
                                                  ],
                                                )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cara Membuat :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ...List.generate(
                                      resep.caraMembuat.length,
                                      (index) => Column(
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            '${i++}. ' +
                                                resep.caraMembuat[index],
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
