import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/models/videos_model.dart';
import 'package:flutter_samples/widgets/custom_appBar.dart';
import 'package:flutter_samples/widgets/section_header.dart';
import 'package:flutter_samples/widgets/video_card.dart';

class VideosListPage extends StatelessWidget {
  VideosListPage({super.key});
  final List<VideosModel> vidoes = [
    VideosModel(
      link: 'https://youtu.be/RsVEv0PboPI?si=nG6JB5XfVYIJWkaQ',
      title: 'NASA ARSET: Overview of SDG 15',
      info:
          'SDG 15 is about protecting nature, managing forests, and stopping land damage. NASA uses satellite technology to help track forests and land health. NASA ARSET offers training to learn how to use this data for managing natural resources and responding to disasters.',
    ),
    VideosModel(
      link: 'https://youtu.be/Tu-ijw4dLzo?si=FX1awVd6L6z_bz10',
      title: 'Sustainable development goals by Smile and Learn',
      info:
          'Learn all about the Sustainable Development Goals (SDGs) in this fun video for kids! The 17 SDGs focus on making the world a better place by ending poverty, protecting the planet, and ensuring happiness for everyone. It’s a perfect way for young learners to explore important global goals!',
    ),
    VideosModel(
      link: 'https://youtu.be/o08ykAqLOxk?si=XqgUOJ09rGyO6Jwj',
      title:
          'How We Can Make the World a Better Place by 2030 | Michael Green | TED Talks',
      info:
          'Can we end hunger and poverty, halt climate change and achieve gender equality in the next 15 years? The governments of the world think we can. Meeting at the UN in September 2015, they agreed to a new set of Global Goals for the development of the world to 2030. Social progress expert Michael Green invites us to imagine how these goals and their vision for a better world can be achieved.',
    ),
    VideosModel(
      link: "https://youtu.be/N3SQlrmV1cE?si=J7XKOkoGRYSNHwuW",
      title:
          "The global goals we've made progress on -- and the ones we haven't | Michael Green",
      info:
          'We are living in a world that is so close to making sure no one has to die from hunger, malaria, or diarrhea," says economist Michael Green. In 2015, the United Nations created 17 goals focused on important things like health, education, and equality to help make progress. In this data-filled talk, Green explains how well different countries are doing in reaching these goals and shares ideas on what needs to change to achieve them.',
    ),
    VideosModel(
      title:
          'Back to the future? - Sustainable Development Goals (SDGs) | UN Weekly | United Nations',
      link: 'https://youtu.be/9hBKnGmrowE?si=ZOFH0ogNWHhIgd0E',
      info:
          'What kind of future do we all want? And how can we make it happen? These are big questions, and the UN is holding a major event this year to find some answers.\nIn this show, Conor Lennon talks with Mayra Lopes from UN News (Portuguese Unit) and Benno Schwinghammer from Deutsche Presse-Agentur. They discuss how the UN is working to create a fairer future for both people and the planet, and the progress being made toward reaching the Global Goals for sustainable development as the 2030 deadline approaches.',
    ),
    VideosModel(
      title: 'Sustainable Cities: Crash Course Geography #49',
      link: 'https://youtu.be/ZMn-bCdThEg?si=fbCjv9pNPiXm3AKz',
      info:
          "From towering skyscrapers covered in trees to zero carbon smart cities, there are so many ways to imagine what a sustainable city of the future might look like. But what does it really mean to be sustainable anyway? In this video , we’re going to look at environmental planning and how it intersects with people and the communities they form.",
    ),
    VideosModel(
      title: 'What Is the Most Sustainable City in the World? Going Green',
      link: 'https://youtu.be/fsWr0LfM_uQ?si=h2cXPcHFFljBJf1o',
      info:
          "We visited the world's most sustainable cities to find out what is the most sustainable city in the world. In these green cities we found architecture & sustainable developments which are saving our future. From Copenhagen to Singapore to Songdo, you will see a range of eco-friendly cities in this video before the most sustainable city in the world is revealed!",
    ),
    VideosModel(
      title: 'Sustainable Cities - TU Delft Online Learning',
      link:
          'https://youtube.com/playlist?list=PLeEC3p3fJt1d-6yZkJGcaP6k5brbormoB&si=xbGYTvkEZQ54uRo5',
      info:
          "By 2030, 60% of the world’s population will live in cities, increasing pressure on resources and the environment. This playlist from TU Delft features online courses that explore how to create resilient, sustainable cities capable of tackling climate change and urban challenges. Learn from experts about solutions for a better urban future!",
    ),
    VideosModel(
      title: 'Future cities: Urban planners get creative | DW Documentary',
      link: 'https://youtu.be/HBMlQZeXMiA?si=eX6E5Nw8ltWAJ0hb',
      info:
          "This documentary explores the future of climate-neutral cities, where urban areas might absorb CO2 like trees, using sustainable industries and agriculture with rooftop greenhouses. Experts discuss new energy solutions, like making green hydrogen at home, and the importance of reusing old buildings for sustainability. Architects and city planners are looking at new ways for people to live together and create self-sufficient cities. Through projects like Arno Brandhuber's 'Anti-villa,' the film highlights creative examples of how cities can adapt for a more sustainable future.",
    ),
    VideosModel(
      title: 'SDGs Explained: #10 Reduced Inequalities - Griffith University',
      link: 'https://youtu.be/JgILjJlJFrc?si=Sv1DyUcVPLJHRY3w',
      info:
          "At Griffith University, the focus on reducing inequalities is central to its mission to achieve the Sustainable Development Goals (SDGs) and create a brighter future for all. The university acknowledges its critical role in addressing inequalities through teaching, research, and community engagement, while upholding values such as recognition of First Peoples, environmental responsibility, diversity, inclusion, and social justice.",
    ),
    VideosModel(
      title:
          'SDG 12 Sustainable Consumption and Production - UN Sustainable Development Goals - DEEP DIVE',
      link: 'https://youtu.be/VaUXquivUwQ?si=J4ZvKy2QtUqVqdAj',
      info:
          "Join me for an in-depth exploration of the twelfth Sustainable Development Goal (SDG 12) — Sustainable Consumption and Production. This goal focuses on promoting resource efficiency, recycling, waste reduction, and effective waste management. Together, we’ll discover how we can foster responsible consumption and production patterns for a sustainable future.",
    ),
    VideosModel(
      title:
          '(PLASTIK) - A short film to end plastic pollution in South-East Asia',
      link: 'https://youtu.be/P5OBWbZDZIc?si=wqcYQBfQb957VFTt',
      info:
          "Dive into the eye-opening adventure of '(PLASTIK),' a short film launched on World Environment Day 2022 with the UN Environment Program and SEA circular. Through the imagination of a child in South-East Asia, the film reveals the harsh reality of plastic pollution and invites viewers to join the quest to #BeatPlasticPollution.",
    ),
    VideosModel(
      title: 'We WILL Fix Climate Change! - Kurzgesagt – In a Nutshell',
      link: 'https://youtu.be/LxgMdjyw8uw?si=BS9RGYGX1ZAetHxH',
      info:
          "Our planet is on fire, facing rapid climate change that could lead to catastrophic turning points. While scientists and activists fight for action, politicians often prioritize short-term gains, leaving many young people feeling anxious and doomed. But in the darkness, there’s still hope. Humanity can rise to the challenge!",
    ),
    VideosModel(
      title:
          "WATCH: Greta Thunberg's full speech to world leaders at UN Climate Action Summit - PBS NewsHour",
      link: 'https://youtu.be/KAJsdgTPJpU?si=bzfCh5hsWIxE0Oux',
      info:
          "At the United Nations Climate Action Summit on September 23, 2019, Swedish climate activist Greta Thunberg condemned world leaders for failing younger generations to address climate change. 'You have stolen my childhood,' she said, urging leaders to recognize their betrayal. Thunberg traveled by sailboat to raise awareness and lead climate strikes.",
    ),
    VideosModel(
      title:
          'Plastic Pollution: How Humans are Turning the World into Plastic - Kurzgesagt – In a Nutshell',
      link: 'https://youtu.be/RS7IzU2VJIQ?si=uP45x0s-MRa0ZGKf',
      info:
          "This video dives into the huge problem of plastic in our daily lives, examining why it’s become such a danger and how we've lost control over its use. In partnership with UN Environment's Clean Seas campaign, it encourages everyone to take action against plastic pollution. Join the fight for a cleaner planet!",
    ),
    VideosModel(
      title: 'Our Planet | Coastal Seas | FULL EPISODE | Netflix',
      link: 'https://youtu.be/r9PeYPHdpNo?si=N5OUL_ojXBRqHfb-',
      info:
          "Explore the stunning beauty of our planet and discover how climate change affects all living beings in this captivating documentary. In this episode, delve into coastal waters, home to 90 percent of marine life, from powerful sharks to tiny sea urchins, and learn why protecting these habitats is crucial for survival.",
    ),
    VideosModel(
      title: 'Our Planet | One Planet | FULL EPISODE | Netflix',
      link: 'https://youtu.be/GfO-3Oir-qM?si=Mi1uq4IDY_AMBLZH',
      info:
          "Explore the stunning beauty of our planet in this captivating documentary that reveals how climate change affects all living beings. This episode showcases nature's incredible diversity, featuring seabirds diving into the ocean and wildebeests skillfully escaping the wild dogs of the Serengeti, highlighting how all life on Earth is connected.",
    ),
    VideosModel(
      title: 'Explained | Why Women Are Paid Less | FULL EPISODE | Netflix',
      link: 'https://youtu.be/hP8dLUxBfsU?si=hQKfezmdwOBFuF5I',
      info:
          "This episode dives into the reasons behind why women are paid less and the issue of gender inequality. In this episode, Hillary Clinton and Anne-Marie Slaughter discuss the cultural norms and biases that contribute to the global gender pay gap, focusing on the 'motherhood penalty'",
    ),
    VideosModel(
      title:
          'Living the Change: Inspiring Stories for a Sustainable Future (Free Full Documentary) – Happen Films',
      link: 'https://youtu.be/gq9sg397ee8?si=tTZKcQbh_m2H0mUb',
      info:
          "Living the Change is an interesting documentary showcasing practical solutions to global crises through inspiring personal stories. Directors Jordan Osmond and Antoinette Wilson explore sustainable living practices like community-supported agriculture, regenerative agriculture, and composting. With expert insights, the film encourages viewers to rethink their lifestyles for a healthier planet.",
    ),
    VideosModel(
      title:
          'Rules For Achieving Peace and Justice | Bryan Stevenson - Harvard Kennedy School',
      link: 'https://youtu.be/9vI7UPuCUrE?si=MBaftoAmcOukNkls',
      info:
          "Bryan Stevenson, a renowned human rights lawyer, shares four essential rules for creating change and achieving justice. He emphasizes the importance of staying close to those you aim to help, reshaping narratives about social issues, maintaining hope, and embracing the discomfort that often comes with pursuing peace and justice.",
    ),
    VideosModel(
      title:
          'Nelson Mandela, Anti-Apartheid Activist and World Leader | Biography',
      link: 'https://youtu.be/PyfOrbO0xf4?si=sXeeTYTuBF2uxosY',
      info:
          "Begin with the early life of Nelson Mandela and the experiences that led him to join the African National Congress in the fight against apartheid. Discover his 27 years of imprisonment and his significant contributions as South Africa's first black president, promoting peace and justice and leaving a lasting legacy of equality.",
    ),
    VideosModel(
      title:
          'The Fight for Peace (Full Episode) | The Story of Us - National Geographic',
      link: 'https://youtu.be/KAxMztzFUHg?si=Okf8nR_X0Zeug3Uf',
      info:
          "Is peace merely the absence of war? In this episode, Morgan Freeman investigates physical barriers and our fear of destruction around the world to find out, seeking to understand the deeper implications of peace beyond simply not being at war, and what it truly means for humanity.",
    ),
    VideosModel(
      title:
          'Fighting Sahara Desertification: The Green Wall Project | SLICE SCIENCE | FULL DOC',
      link: 'https://youtu.be/RlzABuM9-dw?si=RsuoLPRvgOX_p3Tq',
      info:
          "The Sahara Desert has pushed 250 kilometers southward in the last century, making land dry and forcing people to move. To fight against this, Morocco and Senegal are teaming up on the Great Green Wall project. This initiative aims to restore green areas and help communities through cooperation and partnerships.",
    ),
    VideosModel(
      title:
          'Floating cities as an innovative response to climate change | DW Documentary',
      link: 'https://youtu.be/S0oGaoqSAl0?si=DBFuzzwuTotZr6bx',
      info:
          "With climate change on the rise, coastal cities are battling the looming threat of flooding. Enter the exciting world of floating cities! Architect Koen Olthuis is pioneering a stunning floating community in the Maldives, while residents in Amsterdam enjoy a unique waterborne neighborhood where teamwork keeps them afloat. In Germany, researchers are exploring innovative aquaculture solutions, providing fresh seafood right at home. This captivating documentary dives into bold ideas and creative collaborations, showcasing how we might adapt to a future of rising seas.",
    ),
    VideosModel(
      title:
          'The International Space Station: International Partnerships – NASA',
      link: 'https://youtu.be/3yumLKlB_Ww?si=1faJ4_eKdXp9__bi',
      info:
          "The International Space Station (ISS) represents a groundbreaking international collaboration, showcasing science and technology's potential for humanity. Celebrating 20 years of continuous human presence, leaders from NASA, Roscosmos, and other space agencies discuss the keys to this successful partnership and its role in future missions to the Moon and Mars.",
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
                text: 'Vidoes',
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
                      imageUrl: 'assets/images/video_image.jpg',
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
