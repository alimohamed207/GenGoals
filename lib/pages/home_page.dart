import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/map/page/map_page.dart';
import 'package:flutter_samples/models/courses_card_model.dart';
import 'package:flutter_samples/pages/library/articles_list_page.dart';
import 'package:flutter_samples/pages/courses/courses_list_page.dart';
import 'package:flutter_samples/pages/library/podcast_list_page.dart';
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
      sumImage: 'assets/images/ozone_sum.jpeg',
      info:
          'The ozone layer, located 15 to 35 kilometers above Earth, absorbs harmful UV rays, crucial for life. Damage from chlorofluorocarbons (CFCs) leads to health risks, ecosystem harm, and agricultural impacts. Protecting it involves choosing eco-friendly products, raising awareness, participating in cleanups, cycling to school, and engaging in science projects.',
      bgPath: 'assets/images/sdgs_images/7.png',
      videoUrl: 'https://www.youtube.com/watch?v=A8Y5YI20HUc',
      mainColor: const Color(0xFFfbc412),
      darkColor: const Color.fromARGB(255, 158, 124, 11),
      taskDescription:
          'Mission: Plant trees or start a garden at your school to promote climate action and reduce carbon emissions.\nAffording more pots and seeds for people that will do the activity',
    ),
    CoursesCardModel(
      title: 'Population Growth',
      icon: BoxIcons.bx_group,
      sumImage: 'assets/images/overpopluation_sum.jpeg',
      videoUrl: 'https://www.youtube.com/watch?v=58F6Kmx_yfg',
      info:
          'Overpopulation leads to\ncrowded cities and strains\nresources.It’s caused by factors like high birth rates, gender preference, lack of education, and migration. To solve this, we can raise awareness, support local projects, adopt eco-friendly habits, promote education on family planning, and advocate for gender equality in our communities.',
      bgPath: 'assets/images/sdgs_images/1.png',
      mainColor: const Color(0xFFe5233d),
      darkColor: const Color.fromARGB(255, 131, 20, 35),
      taskDescription:
          'Mission: Increase awareness of the influence of the over population\nSharing more posts thru social media and posters in real life so it can increase awareness',
    ),
    CoursesCardModel(
      title: 'Sustainable fisheries or\nWater filtration.',
      icon: BoxIcons.bx_water,
      sumImage: 'assets/images/water_sum.jpeg',
      info:
          'Water pollution poses significant threats to health, ecosystems, and economies. Common sources include industrial waste, agricultural runoff, untreated sewage, microplastics, oil spills, and deforestation. Contaminated water can cause serious illnesses, harm marine life, and contribute to water scarcity. Promoting clean water access, using filtration systems, and raising awareness are vital actions for facing this issue.',
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const TasksListView(),
                  //   ),
                  // );
                },
                isVisibale: false,
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: CourseCard(
                      sumImage: courses[0].sumImage,
                      title: courses[0].title,
                      info: courses[0].info,
                      bgPath: courses[0].bgPath,
                      mainColor: courses[0].mainColor,
                      darkColor: courses[0].darkColor,
                      taskDescription: courses[0].taskDescription,
                      icon: courses[0].icon,
                      videoUrl: courses[0].videoUrl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: CourseCard(
                      sumImage: courses[1].sumImage,
                      title: courses[1].title,
                      info: courses[1].info,
                      bgPath: courses[1].bgPath,
                      mainColor: courses[1].mainColor,
                      darkColor: courses[1].darkColor,
                      taskDescription: courses[1].taskDescription,
                      icon: courses[1].icon,
                      videoUrl: courses[1].videoUrl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: CourseCard(
                      sumImage: courses[2].sumImage,
                      title: courses[2].title,
                      info: courses[2].info,
                      bgPath: courses[2].bgPath,
                      mainColor: courses[2].mainColor,
                      darkColor: courses[2].darkColor,
                      taskDescription: courses[2].taskDescription,
                      icon: courses[2].icon,
                      videoUrl: courses[2].videoUrl,
                    ),
                  ),
                ],
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
