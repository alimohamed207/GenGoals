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
      link: 'https://youtu.be/Ljut6WxYL08?si=M7qVThpGR703aLON',
      title:
          'Stanford Initiative on Business and Environmental Sustainability - Stanford Graduate School of Business',
      info:
          'Join the exciting conversations at the Stanford Initiative on Business and Environmental Sustainability Research Conference Series, where cutting-edge research meets real-world solutions! Hosted by Stanford’s Graduate School of Business and Doerr School of Sustainability, experts tackle urgent environmental challenges and share groundbreaking insights on how we can work together to create a sustainable future.',
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/3rpJxMulcItpXkU22I5A7Y?si=3v0adXhzSoG6hVmq1Vy5hA',
      title: 'The Beginning',
      info:
          "Bart Houlahan, co-founder of B Lab, and Peter Paul van de Wijs, Chief External Affairs Officer at GRI, introduce the concept of the SDGs and discuss how they were established by the UN in 2015. They talk about the Decade of Action - the decade in which we are right now - and the role of the private sector in driving change.In this episode: Bart Houlahan, co-founder of B Lab.Paul Van de Wijs, Chief External affairs at GRI.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/4OLgWYJlayLnriERvVJUkM?si=GNbNAlS9Q6yYyirBxTLnQw',
      title: 'No Poverty',
      info:
          "s focusing on poverty alone enough to eradicate it by the year 2030? Anders Gerdin, Programme Manager at Sida, and Zahid Torres-Rahman, co-founder of Business Fights Poverty, advocate for a more holistic approach, insisting that achieving SDG 1 is about working together on the underlying issues that cause poverty in the first place.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/6GkzH3qX3zjIp5pAyPG0Je?si=842Gfwb9R0yqF5cyjnip6Q',
      title: 'Good Health and Well Being',
      info:
          "What role does technology and innovation play in promoting good health and well-being, as set out in SDG3? Featuring Dr. Sara Saeed, Co-founder and Chief Executive Officer at Sehat Kahani, Dr. Savanit Boonyasuwat, Vice President of Sustainability Strategy and Management at PTT Global Chemical, and Poom Polachan, PTT Global Chemical’s Corporate Social Responsibility Officer, this episode delves into innovative ways of doing business to support health and well-being of both patients and doctors",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/3ttHZE9K0VCqlYRiYiaTEJ?si=MPInl3MfQyOiOdVKjtf4LQ',
      title: 'Quality Education',
      info:
          "In this episode, the former Director of the Environment and Energy Division at the UN Development Programme and convener of the COVID Education Alliance, Dr. Veerle Vanderweerd, and Bo Stjerne Thomsen, Vice-President and Chair of Learning Through Play at the LEGO Foundation, talk about redesigning the traditional education system with technology. They also address the need to approach learning as an active, engaging, joyful and stimulating activity.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/07ZPXIHGIV68sJRjjqqGNo?si=eMFeRMm9R0GZv0fIF6q2ww',
      title: 'Affordable and Clean Energy',
      info:
          "Ensuring access to affordable, reliable and sustainable energy - while leaving no one behind - lays the foundation of sustainable development. In this episode, Koen Peters, Chief Executive Officer at Gogla, shares his perspective on the opportunities of the off-grid solar energy industry, and discusses the existing challenges of developing a profitable business model for remote areas.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/2GnH5B3klN44yhbec8UONp?si=w_konPzLQfmcTnQ4CPs_aA',
      title: 'Zero Hunger',
      info:
          "As on old proverb states - give a man a fish, and you feed him for a day; teach a man to fish, and you feed him for a lifetime - Valerie Bizier, Senior Statistician at FAO, Juliana Meneses, Sustainability Manager at Grupo Nutresa, and Maria Clara Piedrahita, Nutresa Foundation’s Executive Director, discuss the steps that need to be taken to achieve SDG 2: Zero Hunger, stressing the importance of self-sufficiency and securing the world’s food systems from the ground up, which means working together with people producing food to help ensure their quality of life, sustainability, and resilience.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/25D8yyJdP5wDQxCr4oNDsM?si=eao3epVPSgSCtZqrambdnQ',
      title: 'Clean Water and Sanitation',
      info:
          "It’s no secret that water is essential to all life on Earth. The episode on SDG 6: Clean Water and Sanitation features Dennis van Peppen, International Water Programmes Team Lead at the Netherlands Enterprise and Development Agency, and Chong Mien Ling, Chief Sustainability Officer at the Singapore National Water Agency, as they address the need for concerted and global action to tackle the looming water crisis, all the while discussing sustainable water management and providing practical solutions to existing problems.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/1NELRFvRg00cUkw9MEQTbu?si=fOcBX2nFTeKDxzwd5GOtww',
      title: 'Decent Work and Economic Growth',
      info:
          "Will focusing on growth alone help us meet the objectives set out in SDG 8, such as promoting sustained, inclusive, and sustainable economic growth, full and productive employment, and decent work for all? The answer is no, it will not. Hear why from Linda Germanis, Private Sector Engagement Specialist at the UN Development Program in Bangladesh, and Brittany Burns, Director of Strategy at Fashion For Good.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/2jaTLvlzLEhE9RTb4uJ2oy?si=hgjmWGO6TcyBwDIGnlmOWA',
      title: 'Reduced Inequalities',
      info:
          "Poverty does not happen by accident.To discuss related problems as well as solutions to reduce inequalities, we talked to ShankarVenkateswaran, Chair of Oxfam India and one of the founders of ECube InvestmentAdvisors, and Molly Harris Olson, CEO of Fairtrade Australia and New Zealand - whoillustrates what supply chain transformation might look like.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/5Sp3XhtMOb2ACUwSaujZtw?si=qa6TO157Q2CtGJ_vZYxfYA',
      title: 'Sustainable Cities and Communities',
      info:
          "This episode features representatives from business and government who discuss the roleof reporting in creating sustainable cities and communities.From the business side, Esther An, Chief Sustainability Officer at City Developments Limitedand a member of the GRI Supervisory Board, argues that in order to enhance sustainabilityperformance, a company should not only report on sustainability matters that are financiallymaterial, but on those that are material to the market, the environment and people as well.From the government’s side, Bernadia Trjandradewi, Secretary General of United Cities andLocal Governments for the Asia Pacific Region, discusses why trust and collaboration arekey for achieving SDG 11.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/2clYlJjVLcUAjA8Bmxwlae?si=n_6grIXDRXmBvF4eX-pp1g',
      title: 'Gender Equity',
      info:
          "It’s a given that we all should have equal access to opportunities, but we are far from there. In this episode on SDG 5: Gender Equality, Danielle Sharaf, Founder and CEO at Switch ITC, and Meral Guzel, Partnerships Manager at the Women's Entrepreneurship Accelerator at UN Women, share insights on how female-led entrepreneurship can be a massive driver in reaching the targets set out in SDG 5, and how gender equality is not only a right but an important factor in economic development.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/1CCSe2gSC4ivMSlx6wh33c?si=GNXUGZ-DQFCL2_Qx7xoPUQ',
      title: 'Industry, Innovation and Infrastructure',
      info:
          "Talking about infrastructure, industrialization and innovation, means talking aboutconnectivity, which forms the foundation of our lives as humans, and here, companies havea leading role to play.In this episode, we will hear from Lena Hök, Executive Vice President of Sustainability andInnovation at Skanska Group - one of the leading project development and constructiongroups in the world - and Karen Basiye, Head of Sustainable Business and Social Impact atSafaricom - the largest telecommunication provider in Kenya. They share their learnings andinsights on the topic acquired during the years.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/6nCaWLtgRZyB1zKHAOJWam?si=FPYQb8otSryA_eYACQ5Upw',
      title: 'Responsible Consumption and Production',
      info:
          "This episode explores how sustainable practices have evolved over time and the currentstates of affairs with Chris Coulter, CEO at GlobeScan, and Michael Kuhndt, ExecutiveDirector at CSCP.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/4y72oeSBLtjcgxHR0TDlRh?si=CUMriBEfS0q4ohg3imGomw',
      title: 'Peace, Justice and Strong Institutions',
      info:
          "What should be addressed in order to achieve peace, justice, and strong institutions?In this episode, Michelle Breslauer, Governance and Peace Senior Manager at the UN GlobalCompact, discusses how corporate leadership is moving from pure compliance to a moreethics-driven practice, by helping ensure that businesses incorporate transparency to allaspects of their operations, in order to protect and promote the values of societies andcommunities.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/2LhjJkiZs9sbBiCelGGtZY?si=8fCHUd6FS4aaf3UilfN8wg',
      title: 'Life on Land',
      info:
          "We depend on terrestrial ecosystems as much as we depend on air to live. In this episode,Elim Sritaba, Chief Sustainability Officer at Asia Pulp & Paper, discusses the importance of reporting. His experience and insights are accompanied with those of Elodie Chene, GRI’sSustainability Standards Manager.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/7yn3833cPlN6mHo459gT9u?si=hRoIyMcmRWWFIk0cGb2vUg',
      title: 'Partnership for the Goals',
      info:
          "We’ve all heard the saying that “the whole is more - or greater - than the sum of its parts”. Inthis episode, Felix Dodds, Sustainable Development consultant credited for his proposal tointroduce the Stakeholder Dialogues at the UN General Assembly back in 1996, andCharlotte Kirby, ​​Vice President of Strategic Relations at SalesForce, discuss why and howpartnerships are the best means for achieving the SDGs.",
    ),
    VideosModel(
      link:
          'https://open.spotify.com/episode/5ac9bUnhtASEA7Za2qJ68f?si=V1syHJgSR1iRj49yhlq2Lg',
      title: 'Climate Action',
      info:
          "What is needed to reverse the spill of 11 million gallons of oil off Alaska coast?The accident took place about thirty years ago and has led to the birth of Ceres, of whichMindy Lubber is CEO and President. As a well-known global thought leader on climatechange, she has inspired capital market leaders and corporate boards to factor the ESGpractices into their overall strategies.Talking about strategic planning with Mindy also connects to large companies; initiatives,such as those of the ENEL Group. We talked to the Group’s Head of Planning, Sustainabilityand Human Rights Performance Management, Guilia Guenuardi.",
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
