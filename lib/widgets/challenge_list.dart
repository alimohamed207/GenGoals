import 'package:flutter/material.dart';
import 'package:flutter_samples/models/challenge_model.dart';
import 'package:flutter_samples/widgets/uplode_task.dart';

class ChallengesList extends StatelessWidget {
  ChallengesList({super.key});
  final List<ChallengeModel> challenges = [
    ChallengeModel(
      content:
          'Mission: Gather with your friends and try to collect donations such as clothes, food , medicine supplies for families in need and donate it to a charity or an organization\nAnd you can do that by telling more people about the idea and helping you collect and maybe people in other schools or another streets will help with it.',
      relatedSdg: 'No Poverty',
      sdgColor: const Color(0xFFE5243B),
    ),
    ChallengeModel(
      content:
          'Mission: Volunteer at a local food bank or and encourage more people to either donate food or volunteer at there local food banks\nAnd you can share awareness through posters, social media, and school announcements about the issue of hunger and how everyone can help.',
      relatedSdg: 'Zero Hunger',
      sdgColor: const Color(0xFFF57C00),
    ),
    ChallengeModel(
      content:
          'Mission: Organize a fun physical activity challenge where students can track how much they walk, run, bike, or exercise. Use fitness apps or simple paper logs to track progress.\nAnd you can do that by creating more posters about it to share awareness and talk with teachers about it so they can help spreading the idea thru students.',
      relatedSdg: 'Good Health and Well-being',
      sdgColor: const Color(0xFF009688),
    ),
    ChallengeModel(
      content:
          'Mission: Start a peer tutoring program to help classmates with subjects they find difficult.\nAnd to do that you should ask teachers to help you either with the monthly grades of the class or doing more exams to the students so you can know the progress to the challenge.',
      relatedSdg: 'Quality Education',
      sdgColor: const Color(0xFF0066C0),
    ),
    ChallengeModel(
      content:
          'Mission: Create posters or social media posts promoting gender equality and respectful behavior.\nGather a group of boys and girls so they can tell more to each gender about it.',
      relatedSdg: 'Gender Equality',
      sdgColor: const Color(0xFFD119CD),
    ),
    ChallengeModel(
      content:
          'Mission: Create digital campaigns about simple ways to conserve water at home and school, such as turning off taps while brushing teeth, taking shorter showers, and using reusable water bottles.\nAnd you can do that with spreading the idea first among your community either your friends , students , teachers',
      relatedSdg: 'Clean Water and Sanitation',
      sdgColor: const Color(0xFF0097A7),
    ),
    ChallengeModel(
      content:
          'Mission: Using bike instead of cars, public transportation\nSpreading awareness about the influence of cars and public transportation on the environment',
      relatedSdg: 'Affordable and Clean Energy',
      sdgColor: const Color(0xFFF9A83A),
    ),
    ChallengeModel(
      content:
          'Mission: Organize a "saving" day once a week and a "investing" day once a month\nSpreading more posters about it and telling friends and family and schools about it so people will save more money just one day a week and how can we invest this saved money once a week.',
      relatedSdg: 'Decent Work and Economic Growth',
      sdgColor: const Color(0xFF2196F3),
    ),
    ChallengeModel(
      content:
          'Mission: Create small teams of students who will work together to brainstorm and develop innovative ideas or projects that align with idea.\nAnd you can do it with first thinking about a innovate idea so people will be interested about it.',
      relatedSdg: 'Industry, Innovation, and Infrastructure',
      sdgColor: const Color(0xFF9C27B0),
    ),
    ChallengeModel(
      content:
          "Mission: Conduct a Survey\nDesign and distribute a survey within your school to gather data on students' experiences related to inequality and inclusivity. Ask questions about access to resources, feelings of belonging",
      relatedSdg: 'Reduced Inequalities',
      sdgColor: const Color(0xFF00BCD4),
    ),
    ChallengeModel(
      content:
          'Mission: Create a Green Space Initiative:\nWork with local authorities or community organizations to identify areas in your community that could benefit from more green spaces',
      relatedSdg: 'Sustainable Cities and Communities',
      sdgColor: const Color(0xFF4CAF50),
    ),
    ChallengeModel(
      content:
          'Mission: Set up recycling bins around the school and educate students on how to recycle properly.\nYou can show people the difference between the school before putting the recycling bins and after so people will be interested to the idea.',
      relatedSdg: 'Responsible Consumption and Production',
      sdgColor: const Color(0xFFFFC107),
    ),
    ChallengeModel(
      content:
          'Mission: Plant trees at your school to promote climate action and reduce carbon emissions.\nAffording more pots and seeds for people that will do the activity',
      relatedSdg: 'Climate Action',
      sdgColor: const Color(0xFF3F51B5),
    ),
    ChallengeModel(
      content:
          'Mission: Start a Student-Led Research Project:\nCollaborate with classmates to design a research project focusing on a local marine issue, such as water quality, marine biodiversity, or the impact of plastic pollution on marine life.',
      relatedSdg: 'Life Below Water',
      sdgColor: const Color(0xFF03A9F4),
    ),
    ChallengeModel(
      content:
          'Mission: Establish a School Garden\nStart a garden at your school that focuses on native plants and pollinators. This garden can serve as an educational tool for students and a habitat for local wildlife.',
      relatedSdg: 'Life on Land',
      sdgColor: const Color(0xFF8BC34A),
    ),
    ChallengeModel(
      content:
          'Mission: Organize a Community Dialogue Event\nHost a community dialogue in school where students can come together to discuss local issues, share their concerns, and brainstorm solutions.',
      relatedSdg: 'Peace, Justice, and Strong Institutions',
      sdgColor: const Color(0xFFE91E63),
    ),
    ChallengeModel(
      content:
          'Mission: Partner with a school in another country to learn about their culture and share ideas on how to achieve the SDGs.\nContact with more people in another countries online and try to discuss with them about how can they achieve their goals and learn from it.',
      relatedSdg: 'Partnerships for the Goals',
      sdgColor: const Color(0xFF90A4AE),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: challenges.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UplodeTask(
                      taskDescription: challenges[index].content,
                      mainColor: challenges[index].sdgColor,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F9FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            challenges[index].content,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            challenges[index].relatedSdg,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: challenges[index].sdgColor,
                            ),
                          ),
                        ],
                      ),
                      // child: Text.rich(
                      //   TextSpan(
                      //     children: [
                      //       TextSpan(
                      //           text: challenges[index].relatedSdg,
                      //           style: TextStyle(
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.w600,
                      //               color: challenges[index].sdgColor)),
                      //     ],
                      //     text: challenges[index].content,

                      //   ),
                      //   maxLines: 4,
                      // ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFE8FFFF),
                          border: Border.all(
                              color: const Color(0xFF2BB6E0), width: 2),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text("⭐4"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        );
      },
    );
  }
}
