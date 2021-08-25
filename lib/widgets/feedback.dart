import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _feedbackForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text("My Feedback"),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: false,
                  title: Text("Your feedback matter"),
                  content: Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                        child: Form(
                      key: _feedbackForm,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Email Address",
                                labelStyle: TextStyle(
                                    color: Colors.teal[900],
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Full Name",
                                labelStyle: TextStyle(
                                    color: Colors.teal[900],
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                                labelText: "Message",
                                labelStyle: TextStyle(
                                    color: Colors.teal[900],
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    )),
                  ),
                );
              });
        });
  }
}
