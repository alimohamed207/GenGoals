// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_samples/helper/logout_method.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 570,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      125.0,
                      16.0,
                      16.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(
                        22.0,
                        38.0,
                        22.0,
                        17.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              "James S. Hernandes",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text("hernandex.redial@gmail.ac.in",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.account_circle_sharp, size: 32),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right, size: 32)
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.language, size: 32),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Text(
                                      "Language",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right, size: 32)
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.privacy_tip_outlined, size: 32),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Text(
                                      "Terms & Conditions",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right, size: 32)
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.help_outline, size: 32),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Text(
                                      "Help Center",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right, size: 32)
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                logout(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.power_settings_new,
                                        size: 32,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 85,
                    left: (MediaQuery.of(context).size.width / 2) - 48,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.purple,
                      child: Image.asset("assets/images/user.png"),
                    )),
                Positioned(
                  top: 157,
                  left: (MediaQuery.of(context).size.width / 2) + 24,
                  child: SvgPicture.asset("assets/images/Country.svg"),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
