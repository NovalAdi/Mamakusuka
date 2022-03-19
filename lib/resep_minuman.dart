import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mamakusuka/DetailScreen.dart';
import 'package:mamakusuka/model/resep_item.dart';

class ResepMinuman extends StatelessWidget {
  const ResepMinuman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          enlargeCenterPage: true,
          viewportFraction: 0.63,
          disableCenter: true
      ),
      itemCount: ListItemResepMinuman.length,
      itemBuilder: (context, index, pageViewIndex) {
        final ItemResep resep = ListItemResepMinuman[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScreenDetail(resep: resep,);
            }));
          },
          child: Stack(
            children: [
              Container(
                height: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  child: Image.asset(
                    resep.gambar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(
                              color: Color(0xff263238),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Local',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8, top: 8),
                          child: CircleAvatar(
                            backgroundColor: Color(0xff263238),
                            child: BookMarkButton(),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            resep.nama,
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                resep.durasi + ' Menit',
                                style: TextStyle(
                                  color: Color(0xff878281),
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                resep.serving + ' Serving',
                                style: TextStyle(
                                  color: Color(0xff878281),
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
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
            ],
          ),
        );
      },
    );
  }
}

class BookMarkButton extends StatefulWidget {
  const BookMarkButton({Key? key}) : super(key: key);

  @override
  _BookMarkButtonState createState() => _BookMarkButtonState();
}

class _BookMarkButtonState extends State<BookMarkButton> {
  bool bookMark = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        bookMark ? Icons.bookmark : Icons.bookmark_border,
        color: Color(0xffFFE8C5),
      ),
      onPressed: () {
        setState(() {
          bookMark = !bookMark;
        });
      },
    );
  }
}
