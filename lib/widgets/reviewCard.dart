import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 100,
              child: Card(
                child: ListTile(
                  title: Text(
                    "Eden Hazard",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.rubik().fontFamily,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(
                      "Eden is a former chelsea player.He is now currently involved in real madrid. He a Belgium football national team captain",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.picsum.photos/id/177/2515/1830.jpg?hmac=G8-2Q3-YPB2TreOK-4ofcmS-z5F6chIA0GHYAe5yzDY'),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
