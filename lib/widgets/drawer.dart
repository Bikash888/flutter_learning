import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledDrawer extends StatelessWidget {
  const StyledDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        'https://i.picsum.photos/id/1074/5472/3648.jpg?hmac=w-Fbv9bl0KpEUgZugbsiGk3Y2-LGAuiLZOYsRk0zo4A';
    return Drawer(
      child: Container(
        color: Colors.teal[50],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Container(
                  height: 30,
                  width: 30,
                  child: UserAccountsDrawerHeader(
                      currentAccountPictureSize: Size.square(60),
                      decoration: BoxDecoration(
                        color: Colors.teal[50],
                      ),
                      margin: EdgeInsets.zero,
                      accountName: Text(
                        "Bikash",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontWeight: FontWeight.w500),
                      ),
                      accountEmail: Text(
                        "bikash@gmail.com",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                      )),
                )),
            ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: Colors.blue,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.blue,
              ),
              title: Text(
                "Cart",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                color: Colors.blue,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.blue,
              ),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
