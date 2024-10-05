import 'package:flutter/material.dart';
import 'package:flutter_samples/models/courses_card_model.dart';
import 'package:flutter_samples/widgets/course_card.dart';
import 'package:flutter_samples/widgets/custom_appBar.dart';
import 'package:flutter_samples/widgets/section_header.dart';
import 'package:icons_plus/icons_plus.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});
  final List<CoursesCardModel> courses = [
    CoursesCardModel(
      title: 'Ozone layer',
      info:
          'The ozone layer, located 15 to 35 kilometers above Earth, absorbs harmful UV rays, crucial for life. Damage from chlorofluorocarbons (CFCs) leads to health risks, ecosystem harm, and agricultural impacts. Protecting it involves choosing eco-friendly products, raising awareness, participating in cleanups, cycling to school, and engaging in science projects.',
      bgPath: 'assets/images/sdgs_images/7.png',
      sumImage: 'assets/images/ozone_sum.jpeg',
      videoUrl: 'https://www.youtube.com/watch?v=A8Y5YI20HUc',
      mainColor: const Color(0xFFfbc412),
      darkColor: const Color.fromARGB(255, 238, 203, 90),
      icon: BoxIcons.bx_sun,
      taskDescription:
          'Mission: Plant trees or start a garden at your school to promote climate action and reduce carbon emissions.\nAffording more pots and seeds for people that will do the activity',
    ),
    CoursesCardModel(
      title: 'Population Growth',
      info:
          'Overpopulation leads to\ncrowded cities and strains\nresources.It’s caused by factors like high birth rates, gender preference, lack of education, and migration. To solve this, we can raise awareness, support local projects, adopt eco-friendly habits, promote education on family planning, and advocate for gender equality in our communities.',
      bgPath: 'assets/images/sdgs_images/1.png',
      videoUrl: 'https://www.youtube.com/watch?v=58F6Kmx_yfg',
      sumImage: 'assets/images/overpopluation_sum.jpeg',
      mainColor: const Color(0xFFe5233d),
      darkColor: const Color.fromARGB(255, 131, 20, 35),
      icon: BoxIcons.bx_group,
      taskDescription:
          'Mission: Increase awareness of the influence of the over population\nSharing more posts thru social media and posters in real life so it can increase awareness',
    ),
    CoursesCardModel(
      title: 'Sustainable fisheries or\nWater filtration.',
      info:
          'Water pollution poses significant threats to health, ecosystems, and economies. Common sources include industrial waste, agricultural runoff, untreated sewage, microplastics, oil spills, and deforestation. Contaminated water can cause serious illnesses, harm marine life, and contribute to water scarcity. Promoting clean water access, using filtration systems, and raising awareness are vital actions for facing this issue.',
      bgPath: 'assets/images/sdgs_images/6.png',
      sumImage: 'assets/images/water_sum.jpeg',
      mainColor: const Color(0xFF27bfe6),
      darkColor: const Color.fromARGB(255, 21, 104, 124),
      taskDescription:
          'Mission: Making water more clean\nYou can try and look for a nearby lake or a small pool and try to clean it up by removing papers, plastic ,etc',
      icon: BoxIcons.bx_water,
    ),
    CoursesCardModel(
      title: 'Biodiversity loss',
      info:
          'Biodiversity loss is the decline\nin the variety of life on Earth.',
      bgPath: 'assets/images/sdgs_images/15.png',
      mainColor: const Color(0xFF59ba47),
      darkColor: const Color.fromARGB(255, 45, 95, 37),
      taskDescription: '',
      sumImage: 'assets/images/water_sum.jpeg',
      icon: BoxIcons.bx_sun,
    ),
    CoursesCardModel(
      title: 'Technical systems',
      info:
          'Build resilient infrastructure,\npromote inclusive and\nsustainable industrialization',
      bgPath: 'assets/images/sdgs_images/9.png',
      sumImage: 'assets/images/water_sum.jpeg',
      mainColor: const Color(0xFFf26a2e),
      darkColor: const Color.fromARGB(255, 163, 71, 31),
      taskDescription: '',
      icon: BoxIcons.bx_sun,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: CustomAppbar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SectionHeader(
                text: 'All Lessons',
                isVisibale: false,
                onPressed: () {},
              ),
            ),
            Expanded(
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
                      sumImage: courses[index].sumImage,
                      videoUrl: courses[index].videoUrl,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
