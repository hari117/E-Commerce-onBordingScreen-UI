import 'package:flutter/material.dart';

void main() {
  runApp(screen9());
}

class screen9 extends StatefulWidget {
  @override
  _screen9State createState() => _screen9State();
}

class _screen9State extends State<screen9> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: s9());
  }
}

class s9 extends StatefulWidget {
  @override
  _s9State createState() => _s9State();
}

class _s9State extends State<s9> {
  List<String> pics = ["IMG/s7_1.png", "IMG/s7_2.png", "IMG/s7_3.png"];
  List<String> titles = [
    "Discover place near you",
    "Choose A Tasty Dish",
    "Pick Up Or Delivery"
  ];
  List<String> subT1 = [
    "We make it simple to find the food",
    "When you order Eat Street, we'll hook",
    "We make food ordering fast, simple"
  ];
  List<String> subT2 = [
    "you crave. Enter your address and let",
    "you up with exclusive coupons,",
    "and free - no matter if you order online or cash."
  ];
  List<String> subT3 = [
    "us do the rest.",
    " specials and rewards.",
    " specials and rewards."
  ];

  PageController pageController = PageController(
    initialPage: 0,
  );
  int index = 0;

  dots(index) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Circle(index, 0),
            SizedBox(
              width: 5,
            ),
            Circle(index, 1),
            SizedBox(
              width: 5,
            ),
            Circle(index, 2),
          ],
        ),
        SizedBox(width: 170),
        FlatButton(
          child: Text(
            "Next",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(245, 45, 86, 1),
                fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            pageController.nextPage(
                duration: Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
              controller: pageController,
              onPageChanged: (pagepos) {
                setState(() {
                  index = pagepos;
                });
              },
              itemCount: pics.length,
              itemBuilder: (context, position) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Image(
                            image: AssetImage("${pics[position]}"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "${titles[position]}",
                              style: TextStyle(
                                fontSize: 30,
                                //   fontFamily: "SF UI Display"
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "${subT1[position]}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "${subT2[position]}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "${subT3[position]}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
          if(index !=2)
          Positioned(
            top: MediaQuery.of(context).size.height - 82,
            left: MediaQuery.of(context).size.width - 360,
            right: 20,
            child: dots(index),
          )else
          Positioned(
            top:MediaQuery.of(context).size.height-120,
            left: MediaQuery.of(context).size.width-260,
            child: InkWell(
              child: Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 45, 86, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 15),
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Circle(index, i) {
  return Container(
    width: index == i ? 15 : 15,
    height: 15,
    decoration: BoxDecoration(
        color: index == i ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: index == i ? Color.fromRGBO(245, 45, 86, 1) : Colors.white,
          width: 2,
        )),
  );
}
