import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/provider/user_provider.dart';

class Web_vertUser extends StatefulWidget {
  Web_vertUser({Key? key}) : super(key: key);

  @override
  State<Web_vertUser> createState() => _Web_vertUserState();
}

class _Web_vertUserState extends State<Web_vertUser> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: 475,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/user.jpg"),
                      // picked file
                      fit: BoxFit.cover,
                    ),
                    color: Colors.red,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 9,
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 25),
                        child: Text(
                          user.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        child: Text(
                          'Super Usuario',
                          style: TextStyle(fontSize: 14, color: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xfff1f5f9)),
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    height: 500,
                    child: ContainedTabBarView(
                      tabs: const [
                        Text(
                          'Descripcion',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(206, 0, 0, 0),
                          ),
                        ),
                        Text(
                          'Servicio',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(206, 0, 0, 0),
                          ),
                        ),
                      ],
                      views: [
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'Ningun producto agregado',
                          ),
                        ),
                        Container(
                            child: Text(
                          'text',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(206, 0, 0, 0),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
