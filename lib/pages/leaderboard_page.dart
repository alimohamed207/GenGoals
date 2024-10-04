import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/widgets/challenge_list.dart';
import 'package:flutter_samples/widgets/user_leaderBoard_card.dart';

class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({super.key});

  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage>
    with SingleTickerProviderStateMixin {
  int active = 0;
  late TabController _tabController;
  late PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            dividerColor: const Color(0x00FFFFFF),
            indicator: ContainerTabIndicator(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 7),
                color: Colors.blue,
                width: 200,
                radius: BorderRadius.circular(16)),
            tabs: [
              Tab(
                  child: Text(
                "LeaderBoard",
                style: TextStyle(
                    color: active == 0 ? Colors.white : Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )),
              Tab(
                  child: Text("Challenges",
                      style: TextStyle(
                          color: active == 1 ? Colors.white : Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w700))),
            ],
          ),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                print(_tabController.index);
                _tabController.index = value.floor();
                print(_tabController.index);
                active = value.floor();
                setState(() {});
              },
              children: [
                Container(
                    padding: const EdgeInsets.all(12),
                    height: viewportConstraints.maxHeight - 16,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(16)),
                    child: SizedBox(
                      height: 738,
                      child: Stack(
                        // fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: 11.5,
                            left: viewportConstraints.maxWidth / 2 - 50,
                            child: Transform.rotate(
                              angle: 45 * 3.1415927 / 180,
                              child: Container(
                                width: 75,
                                height: 75,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFEFEEFC)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                      height: 8,
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Positioned(
                            top: 20,
                            child: Container(
                              height: 728,
                              width: viewportConstraints.maxWidth - 24,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(0xFFEFEEFC)),
                              child: const UserLeaderboardCards(),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(12),
                    height: viewportConstraints.maxHeight - 16,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(16)),
                    child: SizedBox(
                      height: 738,
                      child: Stack(
                        // fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: 11.5,
                            left: viewportConstraints.maxWidth / 2 - 47.5,
                            child: Transform.rotate(
                              angle: 45 * 3.1415927 / 180,
                              child: Container(
                                width: 75,
                                height: 75,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFEFEEFC)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                      height: 8,
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Positioned(
                            top: 20,
                            child: Container(
                              height: 728,
                              width: viewportConstraints.maxWidth - 24,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(0xFFEFEEFC)),
                              child: ChallengesList(),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}
