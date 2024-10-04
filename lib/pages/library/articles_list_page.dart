import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/helper/user_data_help.dart';
import 'package:flutter_samples/helper/web_view.dart';
import 'package:flutter_samples/models/article_model.dart';
import 'package:flutter_samples/widgets/custom_appBar.dart';
import 'package:flutter_samples/widgets/section_header.dart';

class ArticlesListPage extends StatefulWidget {
  const ArticlesListPage({super.key});

  @override
  State<ArticlesListPage> createState() => _ArticlesListPageState();
}

class _ArticlesListPageState extends State<ArticlesListPage> {
  List<ArticleModel> articles = [
    ArticleModel(
      title:
          'The Earth Observations Toolkit for Sustainable Cities and Human Settlements',
      content:
          'The Earth Observations Toolkit for Sustainable Cities is a website that helps users access and analyze urban sustainability data using satellite observations. Developed by global organizations, it offers tools like NASA’s population map and real-world examples, such as Thessaloniki, Greece. The platform includes educational resources and regular updates.',
      relatedSdg:
          'SDG 11: Sustainable Cities and Communities\nSDG 13: Climate Action',
      link: 'http://eotoolkit.unhabitat.org/',
    ),
    ArticleModel(
      title: 'NASA Earth Observatory',
      content:
          "The NASA Earth Observatory provides images and data about Earth's environment, including topics like climate change, weather, natural disasters, and deforestation. It helps users explore environmental issues such as air pollution and offers educational tools to better understand these topics.",
      relatedSdg:
          'SDG 13: Climate Action\nSDG 15: Life on Land\nSDG 11: Sustainable Cities and Communities',
      link: 'http://earthobservatory.nasa.gov/',
    ),
    ArticleModel(
      title: 'NASA Socioeconomic Data and Applications Center (SEDAC)',
      content:
          "NASA's Socioeconomic Data and Applications Center (SEDAC) provides data that links social, economic, and environmental information. It helps researchers and policymakers analyze how human activity impacts the environment. SEDAC offers tools for exploring topics like climate change, urban growth, and resource use, helping to track progress on several Sustainable Development Goals.",
      relatedSdg:
          'SDG 13: Climate Action\nSDG 11: Sustainable Cities and Communities\nSDG 12: Responsible Consumption and Production\nSDG 15: Life on Land',
      link: 'https://sedac.ciesin.columbia.edu/',
    ),
    ArticleModel(
      title: '2023 to 2027 Departmental Sustainable Development Strategy',
      content:
          "Canada's 2023-2027 Departmental Sustainable Development Strategy showcases how space technology is tackling sustainability issues. Think satellites that help monitor climate change, track natural resources, and respond to disasters! This strategy lays out Canada’s cool goals and innovative methods for achieving all 17 SDGs, proving that space can be a superhero for our planet!",
      relatedSdg:
          'SDG 13: Climate Action\nSDG 15: Life on Land\nSDG 11: Sustainable Cities and Communities\nSDG 9: Industry, Innovation, and Infrastructure',
      link:
          'https://www.asc-csa.gc.ca/eng/publications/2023-2027-departmental-sustainable-development-strategy.asp',
    ),
    ArticleModel(
      title: 'Growing Healthy Food in Space and in Remote Areas',
      content:
          'To tackle SDG 2 (Zero Hunger), the Canadian Space Agency (CSA) is partnering with organizations to find ways to grow healthy food in extreme conditions, whether in space or in harsh environments on Earth. They are exploring innovative technologies to ensure access to nutritious food for all!',
      relatedSdg:
          'SDG 2: Zero Hunger\nSDG 12: Responsible Consumption and Production\nSDG 17: Partnerships for the Goals',
      link:
          'https://www.asc-csa.gc.ca/eng/sciences/food-production/growing-healthy-food-in-space-and-remote-areas.asp',
    ),
    ArticleModel(
      title: 'Grants and Project Supported by the Canadian Space Agency',
      content:
          "The Canadian Space Agency (CSA) is funding exciting projects that tackle global challenges like climate change and inequality! For instance, the SIKU Ice Map project uses satellite data to enhance ice travel safety and support local communities with machine learning. They’re also investing in initiatives like the smartWhales project, which tracks North Atlantic right whales, and smartHarbour, monitoring ecosystems in Montreal. With millions assigned for satellite research and innovation, CSA is not just boosting the space sector but also paving the way for a brighter, sustainable future!",
      relatedSdg:
          'SDG 2: Zero Hunger\nSDG 13: Climate Action\nSDG 14: Life Below Water\nSDG 17: Partnerships for the Goals',
      link:
          'https://www.asc-csa.gc.ca/eng/funding-programs/programs/smartearth/contributions-grants-contracts-awarded.asp',
    ),
    ArticleModel(
      title: 'Agriculture in Satellite Age',
      content:
          "The article highlights how satellite data is transforming farming in Canada, where agriculture supports over half a million jobs! With satellites like SMAP and RADARSAT, farmers can monitor their fields just like having a bird's-eye view of their farms. They receive vital info on soil health, crop conditions, and resource management. Farmers can track soil moisture, assess crop growth, and optimize water, fertilizers, and pesticides—boosting productivity while protecting the environment. Plus, research on the International Space Station is discovering how space conditions can improve farming on Earth, especially in remote areas. This technology is essential for a sustainable future!",
      relatedSdg: 'SDG 2: Zero Hunger\nSDG 13: Climate Action',
      link:
          'https://www.asc-csa.gc.ca/eng/satellites/everyday-lives/agriculture-in-the-satellite-age.asp',
    ),
    ArticleModel(
      title: 'Earth Observation Data Management System (EODMS)',
      content:
          "Imagine having access to a treasure trove of satellite images and data! The Earth Observation Data Management System (EODMS) is Canada’s powerhouse for Earth Observation data, storing vital information from the RADARSAT constellation missions. This system helps monitor marine life, track ice conditions, and manage ecosystems, making it a key player in environmental protection.\nEODMS supports everything from disaster management to resource mapping, helping to keep our planet healthy. This technology is essential for understanding and tackling climate change, safeguarding life in our oceans, and preserving life on land.",
      relatedSdg:
          'SDG 13: Climate Action\nSDG 14: Life Below Water\nSDG 15: Life on Land',
      link: 'https://www.eodms-sgdot.nrcan-rncan.gc.ca/index-en.html',
    ),
    ArticleModel(
      title: 'Environment and Climate Change Canada (ECCC) research and data',
      content:
          "Get ready to dive into the heart of climate science! Environment and Climate Change Canada (ECCC) serves as the central hub for critical climate change information, providing researchers, policymakers, and the public with tons of data and insights.\nFrom understanding greenhouse gas emissions to tracking ecosystem health and water quality, ECCC's extensive research plays a crucial role in fighting climate change. This wealth of information not only guides actions for a sustainable future but also helps protect both marine and terrestrial environments.",
      relatedSdg:
          'SDG 13: Climate Action\nSDG 14: Life Below Water\nSDG 15: Life on Land',
      link:
          'https://www.canada.ca/en/environment-climate-change/services/climate-change/science-research-data.html',
    ),
    ArticleModel(
      title: 'Surface Water and Ocean Topography (SWOT)',
      content:
          "Water is life, and understanding it is crucial for our planet's future! The Surface Water and Ocean Topography (SWOT) mission is on a groundbreaking quest to measure Earth's water resources like never before. Spearheaded by NASA and France's CNES, with contributions from Canada and the UK, this mission employs advanced technology to measure the heights of oceans and freshwater bodies, covering an astounding 90% of the Earth's water surface.\nBy collecting detailed information about lakes, rivers, reservoirs, and oceans, SWOT is essential for managing one of our planet's most vital resources—water. This mission empowers scientists to improve flood predictions, monitor sea level changes, and develop better water management strategies.",
      relatedSdg:
          'SDG 6: Clean Water and Sanitation\nSDG 14: Life Below Water\nSDG 17: Partnerships for the Goals',
      link: 'https://www.asc-csa.gc.ca/eng/satellites/swot/',
    ),
    ArticleModel(
      title: 'UN Ozone Secretariat',
      content:
          "The UN Ozone Secretariat is dedicated to preserving the ozone layer, Earth’s natural shield against harmful UV rays. Working with countries globally, this organization promotes the Montreal Protocol, a groundbreaking agreement established in Canada to safeguard our atmosphere. Explore how nations are measuring their progress in this essential mission.",
      relatedSdg:
          'SDG 13: Climate Action\nSDG 15: Life on Land\nSDG 17: Partnerships for the Goals',
      link: 'https://ozone.unep.org/sdg',
    ),
    ArticleModel(
      title: 'ESA Sustainable Development Goals',
      content:
          "The European Space Agency (ESA) is leading the way in helping achieve the Sustainable Development Goals (SDGs). With many creative programs, ESA is dedicated to finding solutions that help everyone on our planet. From tracking climate change to improving resource management, ESA’s projects use space technology to build a more sustainable world.",
      relatedSdg: 'General',
      link: 'https://sdg.esa.int/',
    ),
    ArticleModel(
      title: 'No Poverty',
      content:
          "Imagine a world where no one has to worry about having enough food or a safe place to live. SDG 1 is all about ending poverty in all forms everywhere. It focuses on providing everyone with the essentials for a decent life, like access to education, healthcare, and social protections, so that no one is left behind.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/1-no-poverty/',
    ),
    ArticleModel(
      title: 'Zero Hunger',
      content:
          "Everyone deserves a full plate! SDG 2 focuses on ending hunger and ensuring that everyone, especially those in poor areas, has access to enough nutritious food all year round. It also supports sustainable farming methods that protect the environment and ensure future generations can continue to produce food.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/2-zero-hunger/',
    ),
    ArticleModel(
      title: 'Good Health and Well-being',
      content:
          "A healthy life is within reach for everyone! SDG 3 aims to ensure that people of all ages have access to healthcare and can live healthy lives. This includes reducing child mortality, fighting diseases like HIV and malaria, and promoting mental health and well-being.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/3-good-health-and-well-being/',
    ),
    ArticleModel(
      title: 'Quality Education',
      content:
          "Education unlocks endless opportunities. SDG 4 is all about ensuring that everyone, no matter where they are, has access to inclusive and quality education. This goal empowers people to break out of poverty, improve their lives, and contribute to their communities.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/4-quality-education/',
    ),
    ArticleModel(
      title: 'Gender Equality',
      content:
          "Equal rights for everyone, no matter their gender! SDG 5 fights for the rights of women and girls around the world, ensuring they have the same opportunities as men in education, work, and decision-making. It also seeks to end violence and discrimination against women and girls everywhere.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/5-gender-equality/',
    ),
    ArticleModel(
      title: 'Clean Water and Sanitation',
      content:
          "Clean water is a basic human right! SDG 6 focuses on ensuring that everyone has access to clean drinking water and proper sanitation. It also promotes the protection and sustainable management of water resources to ensure they remain available for future generations.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/6-clean-water-and-sanitation/',
    ),
    ArticleModel(
      title: 'Affordable and Clean Energy',
      content:
          "Energy powers everything, and it should be clean and affordable! SDG 7 promotes the use of renewable energy sources like solar and wind, which can help reduce pollution and fight climate change. It aims to provide everyone access to reliable, sustainable, and modern energy.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/7-affordable-and-clean-energy/',
    ),
    ArticleModel(
      title: 'Decent Work and Economic Growth',
      content:
          "A job should be more than just a paycheck—it should be decent and safe. SDG 8 aims to provide everyone with opportunities for good jobs that stimulate economic growth and improve living standards, all while protecting workers’ rights and ensuring sustainable economic development.",
      relatedSdg: '',
      link:
          'https://www.globalgoals.org/goals/8-decent-work-and-economic-growth/',
    ),
    ArticleModel(
      title: 'Industry, Innovation, and Infrastructure',
      content:
          "Building the future starts today. SDG 9 focuses on developing resilient infrastructure, promoting innovation, and fostering sustainable industries. From better roads to faster internet, these improvements will make economies stronger and help countries grow more sustainably.",
      relatedSdg: '',
      link:
          'https://www.globalgoals.org/goals/9-industry-innovation-and-infrastructure/',
    ),
    ArticleModel(
      title: 'Reduced Inequality',
      content:
          "No matter who you are or where you're from, you deserve equal opportunities. SDG 10 is about reducing inequalities within and among countries by promoting policies that ensure fair treatment for all, especially the most vulnerable groups.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/10-reduced-inequalities/',
    ),
    ArticleModel(
      title: 'Sustainable Cities and Communities',
      content:
          "Let’s build cities that are safe, inclusive, and sustainable! SDG 11 promotes the creation of cities that work for everyone, where people have access to affordable housing, clean transportation, and green spaces, all while reducing their environmental footprint.",
      relatedSdg: '',
      link:
          'https://www.globalgoals.org/goals/11-sustainable-cities-and-communities/',
    ),
    ArticleModel(
      title: 'Responsible Consumption and Production',
      content:
          "Our planet’s resources are limited, so we need to use them wisely. SDG 12 encourages more responsible production and consumption by reducing waste, promoting recycling, and ensuring that companies adopt sustainable practices.",
      relatedSdg: '',
      link:
          'https://www.globalgoals.org/goals/12-responsible-consumption-and-production/',
    ),
    ArticleModel(
      title: 'Climate Action',
      content:
          "The planet is heating up, and we need to act fast! SDG 13 urges immediate action to combat climate change and its impacts. By reducing greenhouse gas emissions and preparing for climate-related disasters, we can protect the planet and secure a better future.",
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/1-no-poverty/',
    ),
    ArticleModel(
      title: 'Life Below Water',
      content:
          'Our oceans are in danger, and we need to protect them. SDG 14 is all about conserving and sustainably using the oceans, seas, and marine resources, which are essential to our planet’s health and the livelihoods of millions of people.',
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/14-life-below-water/',
    ),
    ArticleModel(
      title: 'Life on Land',
      content:
          'Forests, animals, and plants are vital for life on Earth. SDG 15 focuses on protecting, restoring, and promoting the sustainable use of ecosystems, combating deforestation, and halting the loss of biodiversity.',
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/15-life-on-land/',
    ),
    ArticleModel(
      title: 'Peace, Justice, and Strong Institutions',
      content:
          'To live in peace, we need justice and strong institutions. SDG 16 promotes peace, inclusivity, and justice by ensuring that everyone has access to fair laws and effective institutions that serve the public and protect human rights.',
      relatedSdg: '',
      link:
          'https://www.globalgoals.org/goals/16-peace-justice-and-strong-institutions/',
    ),
    ArticleModel(
      title: 'Partnerships for the Goals',
      content:
          'Working together is the only way to achieve the SDGs! SDG 17 encourages collaboration between governments, the private sector, and civil society to ensure that the goals are met. Strong partnerships are essential for a more sustainable and equitable world.',
      relatedSdg: '',
      link: 'https://www.globalgoals.org/goals/17-partnerships-for-the-goals/',
    ),
    ArticleModel(
      title: 'Education and Poverty Alleviation',
      content:
          'every child can learn and thrive, breaking free from poverty! The article emphasizes that education is key to transforming lives and communities. By ensuring access to quality education, individuals gain skills for better job opportunities and improved living conditions. Successful educational programs show how investing in learning can inspire more support for students everywhere.\nEducation not only benefits individuals but also promotes gender equality and economic growth. When we prioritize learning, we create a brighter future for all!',
      relatedSdg:
          'SDG 1: No Poverty\nSDG 2: Zero Hunger\nSDG 3: Good Health and Well-Being',
      link: 'https://www.unesco.org/en/education',
    ),
    ArticleModel(
      title: 'Sustainable Development Goal: Zero Hunger',
      content:
          'The Zero Hunger goal aims to eliminate global hunger, improve food security, and support sustainable farming practices by 2030. With over 800 million people currently facing hunger, it’s crucial to rethink how we produce and distribute food. This goal emphasizes innovative agricultural methods and better nutrition to ensure everyone has access to safe and healthy food.\nFor educators, National Geographic offers various resources to teach students about sustainable agriculture and strategies to end hunger. These materials cover key topics, such as the science behind farming and the impact of food waste.',
      relatedSdg: 'Sdg 2 : No hunger',
      link:
          'https://education.nationalgeographic.org/resource/united-nations-sustainable-development-goal-two-zero-hunger/',
    ),
    ArticleModel(
      title: 'Our World in Data',
      content:
          'This articles highlights how critical it is to ensure everyone has access to good health services. The article showcases impressive strides in global health, like better maternal and child health and tackling infectious diseases. Yet, challenges remain, such as health inequalities and the rise of chronic diseases.\nUsing engaging charts and data, it illustrates how health improvements can lead to a better quality of life for everyone. By focusing on good health, we can make a real difference for ourselves and future generations!',
      relatedSdg: 'sdg 3 : good health and well being',
      link: 'https://ourworldindata.org/sdgs/good-health-wellbeing',
    ),
    ArticleModel(
      title: 'Universal Health Coverage',
      content:
          'Universal health coverage ensures everyone can access essential health services without financial strain. Challenges include high costs and limited access, especially in low-income areas. Solutions involve increased government investment and community health programs to make healthcare accessible for all.',
      relatedSdg:
          'SDG 3: Good Health and Well-Being\nSDG 1: No Poverty\nSDG 10: Reduced Inequality',
      link: 'https://ourworldindata.org/sdgs/good-health-wellbeing',
    ),
    ArticleModel(
      title: 'Technology in Education',
      content:
          'The role of technology in enhancing education quality is the focus of this article. It covers how digital tools and resources can improve learning outcomes and access to education, especially in remote or underserved areas. The article also discusses challenges and potential solutions for integrating technology effectively in classrooms.',
      relatedSdg:
          'Sdg 4: quality education\nSdg 9 : industry, innovation and infrastructure',
      link: 'https://www.worldbank.org/en/topic/education/overview#2',
    ),
    ArticleModel(
      title: 'Education as the Pathway towards Gender Equality',
      content:
          'Education is crucial for gender equality. Girls and women face significant barriers to education, including poverty, early marriage, and gender-based violence. Educating girls and women has many benefits, such as improved health, cities poverty, and increased economic opportunities. To achieve gender equality in education, we need to address societal inequalities and promote equity.',
      relatedSdg: 'SDG 5: Gender equality\nSDG 4: Quality education',
      link:
          'https://www.un.org/en/chronicle/article/education-pathway-towards-gender-equality',
    ),
    ArticleModel(
      title: 'Breaking the Glass Ceiling: Women in Leadership Positions',
      content:
          'This article explores the challenges women face in ascending to leadership positions and discusses strategies to break the glass ceiling. It provides insights into the importance of mentorship, sponsorship, and creating inclusive work environments.',
      relatedSdg: 'SDG 5: Gender equality',
      link:
          'https://news.harvard.edu/gazette/story/2023/11/glass-ceiling-is-problem-but-so-are-broken-rungs/',
    ),
    ArticleModel(
      title: 'Combating Gender-Based Violence: A Global Challenge',
      content:
          'This article explores the serious issue of gender-based violence, which means hurting someone because of their gender. It talks about different kinds of violence, like physical abuse, sexual assault, and emotional mistreatment. The article explains how these harmful acts can have a big impact on people’s lives. It also emphasizes the importance of taking action to prevent and stop gender-based violence, creating a safer and more just world for everyone.',
      relatedSdg: 'SDG 5: Gender equality',
      link:
          'https://www.worldbank.org/en/results/2023/08/25/tackling-gender-based-violence-development-imperative',
    ),
    ArticleModel(
      title: 'UN Women’s Global Report on Gender Equality',
      content:
          "UN Women releases detailed reports on the state of gender equality around the world. These reports cover important topics like laws, women's roles in the economy, and access to education. They highlight both the challenges and progress being made in achieving gender equality. You can find more information in their latest report.",
      relatedSdg: 'SDG 5: Gender equality',
      link:
          'https://datatopics.worldbank.org/sdgatlas/goal-5-gender-equality?lang=en',
    ),
    ArticleModel(
      title: 'Unicef Water, sanitation and hygiene (WASH)',
      content:
          "UNICEF works to provide children with access to safe water, sanitation, and hygiene facilities. The website offers information on UNICEF's programs, data on water and sanitation access, and resources for advocates and policymakers.",
      relatedSdg: 'SDG 6: Clean Water and Sanitation',
      link: 'https://www.unicef.org/water-sanitation-and-hygiene-wash',
    ),
    ArticleModel(
      title: 'International Energy Agency (IEA)',
      content:
          'The IEA is a global energy organization that provides data, analysis, and policy recommendations on energy issues. Their website offers information on energy trends, market developments, and the transition to clean energy.',
      relatedSdg:
          'SDG 7  Affordable and clean energy\nSDG 17 Partnerships for the goals',
      link: 'https://www.iea.org/',
    ),
    ArticleModel(
      title: 'International Renewable Energy Agency (IRENA)',
      content:
          'IRENA is an intergovernmental organization promoting the adoption of renewable energy. Their website provides information on renewable energy technologies, policies, and markets, and supports countries in their transition to a sustainable energy future.',
      relatedSdg:
          'SDG 7 : Affordable and clean energy\nSDG 9 : industry, innovation and infrastructure',
      link: 'https://www.irena.org/',
    ),
    ArticleModel(
      title: 'International Labour Organization (ILO)',
      content:
          "The ILO is the United Nations' specialized agency for labor and social justice. Their website provides comprehensive information on labor rights, employment opportunities, and social protection. It offers data, reports, and news on global labor trends and challenges.",
      relatedSdg: 'SDG 8 - Decent work and economic growth',
      link: 'https://www.ilo.org/global/lang--en/index.htm',
    ),
    ArticleModel(
      title: 'The SDG Knowledge Hub',
      content:
          'The SDG Knowledge Hub is an online platform that provides information and resources related to the Sustainable Development Goals (SDGs). It offers updates on global SDG initiatives, events, and policy discussions, fostering collaboration among stakeholders. The hub aims to enhance understanding and support for achieving the 2030 Agenda for Sustainable Development.',
      relatedSdg: 'General',
      link: 'https://sdg.iisd.org/',
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
                text: 'Articles',
                isVisibale: false,
                onPressed: () {},
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ArticleCard(
                      relatedSDG: articles[index].relatedSdg,
                      content: articles[index].content,
                      link: articles[index].link,
                      title: articles[index].title,
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

class ArticleCard extends StatefulWidget {
  final String title;
  final String content;
  final String link;
  final String relatedSDG;

  const ArticleCard({
    super.key,
    required this.title,
    required this.content,
    required this.link,
    required this.relatedSDG,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  int _points = 0;

  @override
  void initState() {
    super.initState();
    fetchUserPoints();
  }

  Future<void> fetchUserPoints() async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle user not being logged in
      return;
    }

    final userDocRef = firestore.collection('users').doc(user.uid);
    final userSnapshot = await userDocRef.get();

    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;
      setState(() {
        _points = userData['points'];
      });
    }
  }

  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Adjust duration as needed
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Card(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(horizontal: _isExpanded ? 16.0 : 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  height: _isExpanded ? null : 280,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.content,
                          maxLines: _isExpanded ? null : 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: !_isExpanded,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Related SDGs',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SDGContainer(
                                relatedSDG: widget.relatedSDG,
                                strokeColor: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        updatePoints(FirebaseAuth.instance.currentUser!.uid,
                            _points + 10);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FlutterWebView(url: widget.link),
                          ),
                        );
                      },
                      child: const Text(
                        'Read More',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SDGContainer extends StatelessWidget {
  final String relatedSDG;
  final Color strokeColor;

  const SDGContainer({
    super.key,
    required this.relatedSDG,
    required this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.accentColor,
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Text(
        relatedSDG,
        style: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
