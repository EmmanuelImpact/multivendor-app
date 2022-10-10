import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  Widget rowBottonsList({
    BorderRadius? radius,
    required String text,
    required Color color,
  }) {
    return Container(
      height: 55,
      width: 95,
      decoration: BoxDecoration(),
      child: ClipRRect(
        borderRadius: radius,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
          ),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget listTile({
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  List<Widget> heading(
    String heading,
  ) {
    return [
      SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
            Text(
              heading,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 60,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    opacity: constraints.biggest.height <= 120 ? 1 : 0,
                    duration: Duration(
                      milliseconds: 120,
                    ),
                    child: Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyan,
                          Colors.blue,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Text(
                          'OYEDIRAN \n EMMANUEL',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      rowBottonsList(
                        text: 'Cart',
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          bottomLeft: Radius.circular(28),
                        ),
                        color: Colors.grey.shade500,
                      ),
                      rowBottonsList(
                        text: 'Order',
                        radius: BorderRadius.circular(0),
                        color: Colors.cyan,
                      ),
                      rowBottonsList(
                        text: 'Wish \n List',
                        radius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          bottomRight: Radius.circular(28),
                        ),
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),
                ),
                ...heading('Account Info'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        listTile(
                          icon: Icons.email,
                          title: 'Email Address',
                          subtitle: 'ayobamioyediran2018@yahoo.com',
                        ),
                        SizedBox(
                          height: 30,
                          child: Divider(
                            color: Colors.blueGrey,
                            thickness: 1,
                          ),
                        ),
                        listTile(
                          icon: Icons.phone,
                          title: 'Phone Number',
                          subtitle: '08023704301',
                        ),
                        SizedBox(
                          height: 30,
                          child: Divider(
                            color: Colors.blueGrey,
                            thickness: 1,
                          ),
                        ),
                        listTile(
                          icon: Icons.place,
                          title: 'Address',
                          subtitle: 'Alberta, London',
                        ),
                      ],
                    ),
                  ),
                ),
                ...heading('Account Settings'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: Card(
                    child: Column(
                      children: [
                        listTile(
                          icon: Icons.edit,
                          title: 'Edit Profile',
                          subtitle: '',
                        ),
                        SizedBox(
                          height: 30,
                          child: Divider(
                            color: Colors.blueGrey,
                            thickness: 1,
                          ),
                        ),
                        listTile(
                          icon: Icons.lock,
                          title: 'Change Password',
                          subtitle: '',
                        ),
                        SizedBox(
                          height: 30,
                          child: Divider(
                            color: Colors.blueGrey,
                            thickness: 1,
                          ),
                        ),
                        listTile(
                          icon: Icons.logout,
                          title: 'Logout',
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
