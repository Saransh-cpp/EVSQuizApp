import 'package:evs_quiz_app/widgets.dart';
import 'package:flutter/material.dart';

class AboutNGOs extends StatefulWidget {
  @override
  _AboutNGOsState createState() => _AboutNGOsState();
}

class _AboutNGOsState extends State<AboutNGOs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: ListView(
        children: [
          NGOCard(
            name: 'Chintan',
            description: "Chintan works for environmental justice in partnership with people and groups from diverse sections of society. Our focus is on ensuring equitable and sustainable production and consumption of materials, and improved disposal of waste.",
            website: 'www.chintan-india.org',
            number: '+91-11-29842809',
          ),
          NGOCard(
            name: 'Being Green',
            description: 'Being Green believes in living sustainably in a Green Society and for us, the word Green manifests environment responsibility and resources efficiency for better tomorrow',
            website: '​www.beinggreens.org',
            number: '+91 - 9212451825',
          ),
          NGOCard(
            name: 'Swechha',
            description: 'Swechha is a New Delhi based, a youth-led youth-run organization dedicated to enabling ourselves and others around us to ‘Be the Change’, in making a visible difference to the Environment- both Physical and Social.',
            website: 'www.swechha.in',
            number: 'XXXXXXXXXX',
          ),
          NGOCard(
            name: 'M.C. Mehta\nEnvironmental Foundation',
            description: 'MCMEF is a non-profit, non-governmental committed organization working nationwide for the protection of the environment, the rights of the people to clean and fresh water and air, the promotion of sustainable development, and the protection of the cultural heritage of India.',
            website: '​www.mcmef.org',
            number: '(011) – 41756519',
          ),
          NGOCard(
            name: 'Centre for Environment\nEducation (CEE)',
            description: 'Centre for Environment Education (CEE) was established in 1984 as a ‘Centre of Excellence in Environmental Education’, of the Ministry of Environment, Forest and Climate Change (MoEFCC), Government of India',
            website: '​www.ceeindia.org',
            number: '26858002',
          )
        ],
      ),
    );
  }
}
