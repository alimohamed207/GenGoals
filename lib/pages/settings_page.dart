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
                  height: 400,
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
                          SizedBox(
                            height: 50,
                          ),
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
