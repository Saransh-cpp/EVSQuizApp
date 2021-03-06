import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NGOCard extends StatelessWidget {

  final String name;
  final String description;
  final String website;
  final String number;

  const NGOCard({Key key, this.name, this.description, this.website, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            Divider(color: Colors.black,),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.black,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contact Number: ',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    number,
                    style: TextStyle(
                        fontSize: 20
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Website: ',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  InkWell(
                    onTap: () async{
                      await canLaunch('https://$website') ? await launch('https://$website') : throw 'Could not launch https://$website';
                    },
                    child: Text(
                        website,
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContributorCard extends StatelessWidget {

  final String name;
  final String GitHubUsername;
  final String GitHubLink;

  const ContributorCard({Key key, this.name, this.GitHubUsername, this.GitHubLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 25
            ),
          ),
          InkWell(
            onTap: () async {
              await canLaunch(GitHubLink) ? await launch(GitHubLink) : throw 'Could not launch $GitHubLink';
            },
            child: Text(
              'GitHub - $GitHubUsername'
            ),
          )
        ],
      ),
    );
  }
}


