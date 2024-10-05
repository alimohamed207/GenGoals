// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/dummy/task_list_view.dart';
import 'package:flutter_samples/pages/settings_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _points = 0;
  String _username = '';
  int _quizPlayed = 0;
  int _tasks = 0;
  int _videoWatched = 0;
  bool isBadgeOne = true;
  bool isBadgeTwo = true;
  bool isBadgeThree = true;
  bool isBadgeFour = true;
  bool isBadgeFive = true;
  bool isBadgeSix = true;
  int rank = 0;
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle user not being logged in
      return;
    }

    final userDocRef = firestore.collection('users').doc(user.uid);
    final userSnapshot = await userDocRef.get();

    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;
      setState(() {
        _points = userData['points'];
        _username = userData['name'];
        _quizPlayed = userData['quizPlayed'];
        _tasks = userData['tasks'];
        _videoWatched = userData['videosWathsed'];
      });
    }
    if (_points >= 50) {
      isBadgeOne = false;
    }
    if (_points >= 100) {
      isBadgeTwo = false;
    }
    if (_points >= 120) {
      isBadgeThree = false;
    }
    if (_points >= 150) {
      isBadgeFour = false;
    }
    if (_points >= 200) {
      isBadgeFive = false;
    }
    if (_points >= 300) {
      isBadgeSix = false;
    }
  }

  PageController controller = PageController();
  List page = List.filled(3, false);
  Map dict = {
    "active": 0,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ),
                      )
                    },
                icon: Icon(Icons.settings)),
          ),
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Stack(
              // clipBehavior: Clip.none,
              // alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: 1024,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Container(
                      //   color: Colors.amber,
                      //   child: Column(
                      //     children: [
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 1024,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 70, 8, 8),
                          child: Container(
                            height: 1024,
                            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                    child: Text(
                                  _username,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                )),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Color(0xFF2BB6E0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.star_border,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          Text(
                                            "Points",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0x80FFFFFF),
                                            ),
                                          ),
                                          Text(
                                            _points.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 1,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                          colors: [
                                            Color(0x00FFFFFF),
                                            Color(0xFFFFFFFF),
                                            Color(0x00FFFFFF)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )),
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.public,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          Text(
                                            "World Rank",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0x80FFFFFF),
                                            ),
                                          ),
                                          Text(
                                            "#1,438",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 1,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                          colors: [
                                            Color(0x00FFFFFF),
                                            Color(0xFFFFFFFF),
                                            Color(0x00FFFFFF)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )),
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.open_with,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          Text(
                                            "Local Rank",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0x80FFFFFF),
                                            ),
                                          ),
                                          Text(
                                            "#56",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Badges",
                                              style: TextStyle(
                                                  color: dict["active"] == 0
                                                      ? Color(0xFF2BB6E0)
                                                      : Color(0xFF858494),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            dict["active"] == 0
                                                ? Container(
                                                    height: 6,
                                                    width: 6,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xFF2BB6E0)),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Stats",
                                              style: TextStyle(
                                                  color: dict["active"] == 1
                                                      ? Color(0xFF2BB6E0)
                                                      : Color(0xFF858494),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            dict["active"] == 1
                                                ? Container(
                                                    height: 6,
                                                    width: 6,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xFF2BB6E0)),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Your Tasks",
                                              style: TextStyle(
                                                  color: dict["active"] == 2
                                                      ? Color(0xFF2BB6E0)
                                                      : Color(0xFF858494),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            dict["active"] == 2
                                                ? Container(
                                                    height: 6,
                                                    width: 6,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xFF2BB6E0)),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      height: 1000 - 370,
                                      child: PageView(
                                        onPageChanged: (value) {
                                          dict["active"] = value.floor();
                                          setState(() {});
                                        },
                                        controller: controller,
                                        children: [
                                          GridView.count(
                                            crossAxisCount: 3,
                                            children: [
                                              Svglock(
                                                  asset:
                                                      "assets/images/Badge1.svg",
                                                  locked: isBadgeOne),
                                              Svglock(
                                                  asset:
                                                      "assets/images/Badge2.svg",
                                                  locked: isBadgeTwo),
                                              Svglock(
                                                  asset:
                                                      "assets/images/Badge3.svg",
                                                  locked: isBadgeThree),
                                              Svglock(
                                                  asset:
                                                      "assets/images/Badge4.svg",
                                                  locked: isBadgeFour),
                                              Svglock(
                                                  asset:
                                                      "assets/images/Badge5.svg",
                                                  locked: isBadgeFive),
                                              Svglock(
                                                  asset:
                                                      "assets/images/Badge6.svg",
                                                  locked: isBadgeSix),
                                            ],
                                          ),
                                          ListView(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F9FF),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                padding: EdgeInsets.all(16),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Text(
                                                      "You total Stats 🔥👀!",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 22,
                                                    ),
                                                    Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        SizedBox(
                                                          height: 138,
                                                          width: 138,
                                                          child:
                                                              CircularProgressIndicator(
                                                            strokeWidth: 10,
                                                            value: 37 / 50,
                                                            color: Color(
                                                                0xFF0E104B),
                                                            backgroundColor:
                                                                Color(
                                                                    0xFFFFFFFF),
                                                            strokeCap:
                                                                StrokeCap.round,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          child: Column(
                                                            children: [
                                                              Text.rich(TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text: _tasks
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xFF0C092A),
                                                                          fontSize:
                                                                              32,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )),
                                                                    TextSpan(
                                                                        text:
                                                                            "/30",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0x80181254),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )),
                                                                  ])),
                                                              Text("Tasks Done",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0x800C092A),
                                                                    fontSize:
                                                                        16,
                                                                  ))
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 24,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 157.5,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            12.0),
                                                                    child: Text(
                                                                        _quizPlayed
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xFF0C092A),
                                                                          fontSize:
                                                                              32,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            10.0),
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit_outlined),
                                                                  )
                                                                ],
                                                              ),
                                                              Text("Quiz Done",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF0C092A),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 157.5,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF0E104B),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                12.0),
                                                                    child: Text(
                                                                        _videoWatched
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              32,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            10.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .military_tech_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Text(
                                                                  "Video Watched",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 24,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF2BB6E0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                padding: EdgeInsets.all(16),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Top contribution to\nachieving SDGs",
                                                          style: TextStyle(
                                                              fontSize: 21,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0x32FFFFFF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                          child: Icon(
                                                            Icons
                                                                .bar_chart_outlined,
                                                            size: 32,
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    SizedBox(
                                                        height: 300,
                                                        child: BarChart1(
                                                          quizPlayed:
                                                              _quizPlayed,
                                                          tasks: _tasks,
                                                          videoWatched:
                                                              _videoWatched,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: TasksListView(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    // top: 50,
                    left: (MediaQuery.of(context).size.width / 2) - 48,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: Color.fromARGB(255, 17, 29, 90),
                      child: Image.asset("assets/images/user.png"),
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// ignore: must_be_immutable
class Svglock extends StatefulWidget {
  Svglock({super.key, required this.asset, required this.locked});

  dynamic asset;

  bool locked;

  @override
  State<Svglock> createState() => _SvglockState();
}

class _SvglockState extends State<Svglock> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center the icon in the middle
      children: [
        // SVG with darkness overlay
        SvgPicture.asset(
            width: 86, // Width of the SVG
            height: 86, // Height of the SVG
            widget.asset, // Your SVG file path
            fit: BoxFit.contain,
            colorFilter: widget.locked
                ? ColorFilter.mode(
                    Colors.black.withOpacity(0.5), // Darkness overlay (50%)
                    BlendMode.srcATop,
                  )
                : null
            // color: Colors.black.withOpacity(
            // 0.5), // Apply darkness to the SVG
            // colorBlendMode: BlendMode.darken,
            ),
        // Centered Icon on top of SVG
        widget.locked
            ? Icon(
                Icons.lock, // Your icon here
                size: 40, // Icon size
                color: Colors.white, // Icon color
              )
            : Container()
      ],
    );
  }
}

// ignore: must_be_immutable
class BarChart1 extends StatefulWidget {
  const BarChart1(
      {super.key,
      required this.quizPlayed,
      required this.tasks,
      required this.videoWatched});
  final int quizPlayed;
  final int tasks;
  final int videoWatched;

  @override
  State<BarChart1> createState() => _BarChart1State();
}

class _BarChart1State extends State<BarChart1> {
  dynamic vals = ["3/10", "8/10", "6/10"];
  dynamic values = [3 / 10, 8 / 10, 6 / 10];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    dynamic vals = [
      "${widget.tasks}/20",
      "${widget.videoWatched}/10",
      "${widget.quizPlayed}/10"
    ];
    dynamic values = [
      widget.tasks / 20,
      widget.videoWatched / 50,
      widget.quizPlayed / 10
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => Colors.transparent,
            tooltipPadding: EdgeInsets.zero,
            tooltipMargin: 8,
            getTooltipItem: (
              BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,
            ) {
              return BarTooltipItem(
                "",
                const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 60,
              getTitlesWidget: getTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              interval: 0.25,
              showTitles: true,
              reservedSize: 45,
              getTitlesWidget: getleftTitles,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide.none,
              bottom: BorderSide.none,
            )),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                  width: 32,
                  toY: values[0],
                  color: Color(0xFF1A4B79),
                  borderRadius: BorderRadius.circular(8))
            ],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                  width: 32,
                  toY: values[1],
                  color: Color(0xFF0E104B),
                  borderRadius: BorderRadius.circular(8))
            ],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                  width: 32,
                  toY: values[2],
                  color: Color(0xFF1C5DAA),
                  borderRadius: BorderRadius.circular(8))
            ],
            showingTooltipIndicators: [0],
          ),
        ],
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false, // Disable vertical lines
          horizontalInterval: 0.01, // Interval set to 0.25
          checkToShowHorizontalLine: (value) {
            // Ensure horizontal lines are shown for all specified values
            if (value == 0.01 ||
                value == 0.25000000000000006 ||
                value == 0.5000000000000002 ||
                value == 0.7500000000000004 ||
                value == 0.9900000000000007) {
              return true; // Show lines at y = 0, 0.25, 0.5, 0.75, and 1
            }
            return false; // Hide all other lines
          },
          getDrawingHorizontalLine: (double value) => FlLine(
            color: Colors.white,
            strokeWidth: 0.4,
            dashArray: [10, 8], // Dashed line with custom pattern
          ),
        ),
        alignment: BarChartAlignment.spaceAround,
        minY: 0,
        maxY: 1,
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style1 = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    );
    final style2 = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    // ignore: unused_local_variable
    String text = "${vals[value.floor()]}\nQuestions\nAnswered";
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
            text: "${vals[value.floor()]}\n",
            style: style1,
          ),
          TextSpan(
            text: "Questions\nAnswered",
            style: style2,
          ),
        ]),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget getleftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = "Questions\nAnswered";
    switch (value) {
      case 0:
        text = '%0';
        break;
      case 0.25:
        text = '%25';
        break;
      case 0.5:
        text = '%50';
        break;
      case 0.75:
        text = '%75';
        break;
      case 1:
        text = '%100';
        break;
      default:
        print(value);
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: Text(text, style: style),
    );
  }

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Color(0xFFA6C1EE),
          Color(0xFFFBC2EB),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
}
