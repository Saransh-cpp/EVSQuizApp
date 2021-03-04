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
          SizedBox(
            height: 10,
          ),
          Text(
            'List of NGOs you\nyou can help',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30
            ),
          ),
          Divider(color: Colors.black,),
          SizedBox(
            height: 0,
          ),
          NGOCard(
            name: 'Chintan',
            description: "Chintan works for environmental justice in partnership with people and groups from diverse sections of society. Our focus is on ensuring equitable and sustainable production and consumption of materials, and improved disposal of waste.",
            website: 'www.chintan-india.org',
            number: '+91-11-29842809',
          ),
          NGOCard(
            name: 'Being Green',
            description: 'Being Green believes in living sustainably in a Green Society and for us, the word Green manifests environment responsibility and resources efficiency for better tomorrow',
            website: 'www.beinggreens.org',
            number: '+91 - 9212451825',
          ),
          NGOCard(
            name: 'Swechha',
            description: 'Swechha is a New Delhi based, a youth-led youth-run organization dedicated to enabling ourselves and others around us to ‘Be the Change’, in making a visible difference to the Environment- both Physical and Social.',
            website: 'www.swechha.in',
            number: '+91-9971774087',
          ),
          NGOCard(
            name: 'M.C. Mehta\nEnvironmental Foundation',
            description: 'MCMEF is a non-profit, non-governmental committed organization working nationwide for the protection of the environment, the rights of the people to clean and fresh water and air, the promotion of sustainable development, and the protection of the cultural heritage of India.',
            website: 'www.mcmef.org',
            number: '(011) – 41756519',
          ),
          NGOCard(
            name: 'Centre for Environment\nEducation (CEE)',
            description: 'Centre for Environment Education (CEE) was established in 1984 as a ‘Centre of Excellence in Environmental Education’, of the Ministry of Environment, Forest and Climate Change (MoEFCC), Government of India',
            website: 'www.ceeindia.org',
            number: '26858002',
          ),
          NGOCard(
            name: 'WWF India',
            description: 'WWF believes that corporate organizations can play an important role in the cause of conservation. We work closely with corporate organizations including multinational corporations, public sector units, financial institutions, and small to medium-sized businesses to develop partnerships that intersect with our philosophy and conservation priorities.',
            website: 'www.wwfindia.org',
            number: '+91 11 4150 4815',
          ),
          NGOCard(
            name: 'Indian Environmental\nSociety',
            description: 'Indian Environmental Society has been providing a leadership role in the field of environment and resource management since its inception. IES has been engaged in environmental development activities with a philosophy of self-help and community participation.',
            website: 'www.iesglobal.org',
            number: '+91-11-43801354',
          ),
          NGOCard(
            name: 'Earth Untouched',
            description: 'This is the one platform where we do not just talk about green life we express it explicitly by showing innovative ways to do it in our daily life. The authors are not staunch environmentalists, we are a group of youngsters who are aware of the problem and are ready to face them.',
            website: 'www.earthuntouched.com',
            number: '303-893-0552',
          ),
          NGOCard(
            name: 'SAFE Green',
            description: 'SAFE is a nonprofit making organization that was established in the year 2013 and registered under Indian Trust Act, 1882 by a few nature enthusiasts and conservationists. Initially, they started working on the local issues of Greater Noida like environmental education, corruption, and awareness about the Right to Information.',
            website: 'www.safegreen.in',
            number: '9310842473',
          ),
          NGOCard(
            name: 'InsPIRE Network for\nEnvironment',
            description: 'InsPIRE Network for Environment, formerly known as Winrock International India, is a leading national NGO working since 1998, addressing environmental challenges that we are faced within our daily lives.',
            website: 'www.inspirenetwork.org',
            number: 'NA',
          ),
        ],
      ),
    );
  }
}
