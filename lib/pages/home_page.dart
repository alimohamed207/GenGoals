import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/map/page/map_page.dart';
import 'package:flutter_samples/models/courses_card_model.dart';
import 'package:flutter_samples/pages/library/articles_list_page.dart';
import 'package:flutter_samples/pages/courses/courses_list_page.dart';

import 'package:flutter_samples/pages/library/podcast_list_page.dart';
import 'package:flutter_samples/pages/profile_page.dart';
import 'package:flutter_samples/pages/library/videos_list_page.dart';
import 'package:flutter_samples/widgets/category_card.dart';
import 'package:flutter_samples/widgets/course_card.dart';
import 'package:flutter_samples/widgets/custom_appBar.dart';
import 'package:flutter_samples/widgets/section_header.dart';
import 'package:flutter_samples/widgets/stats_card.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CoursesCardModel> courses = [
    CoursesCardModel(
      title: 'Ozone layer',
      icon: BoxIcons.bx_sun,
      info:
          ' Ensure access to affordable, reliable,\nsustainable, and modern energy for all.',
      bgPath: 'assets/images/sdgs_images/7.png',
      mainColor: const Color(0xFFfbc412),
      darkColor: const Color.fromARGB(255, 158, 124, 11),
      taskDescription:
          'Mission: Plant trees or start a garden at your school to promote climate action and reduce carbon emissions.\nAffording more pots and seeds for people that will do the activity',
    ),
    CoursesCardModel(
      title: 'Population Growth',
      icon: BoxIcons.bx_group,
      info: 'End extreme poverty\nand hunger.',
      bgPath: 'assets/images/sdgs_images/1.png',
      mainColor: const Color(0xFFe5233d),
      darkColor: const Color.fromARGB(255, 131, 20, 35),
      taskDescription:
          'Mission: Increase awareness of the influence of the over population\nSharing more posts thru social media and posters in real life so it can increase awareness',
    ),
    CoursesCardModel(
      title: 'Sustainable fisheries or\nWater filtration.',
      icon: BoxIcons.bx_water,
      info: 'Ensure access to clean water\nand sanitation for all.',
      bgPath: 'assets/images/sdgs_images/6.png',
      mainColor: const Color(0xFF27bfe6),
      darkColor: const Color.fromARGB(255, 21, 104, 124),
      taskDescription:
          'Mission: Making water more clean\nYou can try and look for a nearby lake or a small pool and try to clean it up by removing papers, plastic ,etc',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The User Info And Profile Icon
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppbar(),
              ),
              const SizedBox(
                height: 40,
              ),
              // Search Bar ---------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Search For',
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        prefixIcon: const Icon(IconlyBroken.search),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //Statics information =-------------------------
              SectionHeader(
                text: 'My Statistics',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StatisticsPage(),
                    ),
                  );
                },
                isVisibale: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  child: const StatsCard(),
                ),
              ),
              //library section =-------------------------
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SectionHeader(
                  text: 'Library',
                  onPressed: () {},
                  isVisibale: false,
                ),
              ),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArticlesListPage(),
                          ),
                        );
                      },
                      label: 'Articles',
                      iconData: BoxIcons.bx_book_content,
                    ),
                    CategoryCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideosListPage(),
                          ),
                        );
                      },
                      label: 'Videos',
                      iconData: BoxIcons.bx_video_plus,
                    ),
                    CategoryCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(),
                          ),
                        );
                      },
                      label: 'Map',
                      iconData: BoxIcons.bx_map,
                    ),
                    CategoryCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PodcastListPage(),
                          ),
                        );
                      },
                      label: 'Podcast',
                      iconData: BoxIcons.bx_podcast,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              //SDG Courses =-------------------------
              SectionHeader(
                text: 'SDGs Courses',
                isVisibale: true,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoursesPage(),
                      ));
                },
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: CourseCard(
                        title: courses[index].title,
                        info: courses[index].info,
                        bgPath: courses[index].bgPath,
                        mainColor: courses[index].mainColor,
                        darkColor: courses[index].darkColor,
                        taskDescription: courses[index].taskDescription,
                        icon: courses[index].icon,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
