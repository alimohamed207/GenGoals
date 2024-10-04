import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/models/videos_model.dart';
import 'package:flutter_samples/widgets/custom_appBar.dart';
import 'package:flutter_samples/widgets/section_header.dart';
import 'package:flutter_samples/widgets/video_card.dart';

class PodcastListPage extends StatelessWidget {
  PodcastListPage({super.key});
  final List<VideosModel> vidoes = [
    VideosModel(
      link:
          'https://youtube.com/playlist?list=PLxq_lXOUlvQDniL75wXkTXIp66BKaOWrn&si=DWl5IsYjJSzHQ84U',
      title:
          'Stanford Initiative on Business and Environmental Sustainability - Stanford Graduate School of Business',
      info:
          'Join the exciting conversations at the Stanford Initiative on Business and Environmental Sustainability Research Conference Series, where cutting-edge research meets real-world solutions! Hosted by Stanford’s Graduate School of Business and Doerr School of Sustainability, experts tackle urgent environmental challenges and share groundbreaking insights on how we can work together to create a sustainable future.',
    ),
    VideosModel(
      link: 'https://open.spotify.com/show/1ghdBtJgiT8KJ0soXWeMvB',
      title:
          'SDG Insider: Bridging corporate reporting and the sustainability agenda - GRI',
      info:
          'The GRI podcast series explores sustainability and SDG reporting through six engaging episodes featuring experts from various sectors. Topics include human rights, agriculture, climate change, labor, and tax. The series aims to raise awareness of impact reporting, double accountability, and the importance of transparency in meeting societal expectations.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
                text: 'Podcast',
                onPressed: () {},
                isVisibale: false,
              ),
            ),
            // video list view
            Expanded(
              child: ListView.builder(
                itemCount: vidoes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: VideoCard(
                      link: vidoes[index].link,
                      title: vidoes[index].title,
                      info: vidoes[index].info,
                      imageUrl: 'assets/images/podcast_image.jpg',
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
