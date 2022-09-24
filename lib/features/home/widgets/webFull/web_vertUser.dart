import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/features/account/widgets/Nosession.dart';
import 'package:v1douvery/features/auth/responsive/authResponsivelayout.dart';
import 'package:v1douvery/features/orderDetails/screens/orderDetails.dart';
import 'package:v1douvery/features/orderDetails/screens/webFull_orderDetails.dart';
import 'package:v1douvery/models/order.dart';
import 'package:v1douvery/provider/user_provider.dart';

class WebFull_Sessions_vertUser extends StatefulWidget {
  WebFull_Sessions_vertUser({Key? key}) : super(key: key);

  @override
  State<WebFull_Sessions_vertUser> createState() =>
      _WebFull_Sessions_vertUserState();
}

class _WebFull_Sessions_vertUserState extends State<WebFull_Sessions_vertUser> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      width: 250,
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
                  decoration: const BoxDecoration(
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
                  width: 150,
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
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Color(0xfff1f5f9)),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8.0),
            width: 250,
            height: 320,
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
                SingleChildScrollView(
                  child: orders == null
                      ? Container(
                          width: 250,
                          height: 240,
                          child: const Loader(),
                        )
                      : Container(
                          width: 250,
                          height: 240,
                          child: ListView.builder(
                            itemCount: orders!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderDetailScreen(
                                      order: orders![index],
                                    ),
                                    settings: RouteSettings(
                                      arguments: orders![index],
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    width: 300,
                                    height: 70,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 70,
                                            height: 70,
                                            child: Image.network(
                                              orders![index]
                                                  .products[0]
                                                  .images[0],
                                            )),
                                        Container(
                                          width: 150,
                                          height: 100,
                                          child:
                                              WebFullVetUserOrderDetailScreen(
                                            order: orders![index],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
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
    );
  }
}

class WebFull_NoSessions_vertUser extends StatefulWidget {
  WebFull_NoSessions_vertUser({Key? key}) : super(key: key);

  @override
  State<WebFull_NoSessions_vertUser> createState() =>
      _WebFull_NoSessions_vertUserState();
}

class _WebFull_NoSessions_vertUserState
    extends State<WebFull_NoSessions_vertUser> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      width: 250,
      height: 475,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              color: GlobalVariables.backgroundColor,
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/gifUserAccount.gif",
                    height: 125.0,
                    width: 125.0,
                  ),
                  NotSessions(),
                ],
              ),
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
                      tabBarProperties: TabBarProperties(
                          indicatorColor: GlobalVariables.colorYelow),
                      tabs: const [
                        Text(
                          'Inciar',
                          style: TextStyle(
                            fontSize: 12,
                            color: GlobalVariables.appBarbackgroundColor,
                          ),
                        ),
                        Text(
                          'Crear',
                          style: TextStyle(
                            fontSize: 12,
                            color: GlobalVariables.appBarbackgroundColor,
                          ),
                        ),
                      ],
                      views: [
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 50),
                          child: Container(
                            child: IconButton(
                              icon: GestureDetector(
                                child: Icon(
                                  IconlyLight.login,
                                  color: GlobalVariables.colorRosaRojVivo,
                                ),
                                onTap: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        WebFullResponsiveLayaout(),
                                  ),
                                  (route) => false,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'Ningun producto agregado',
                          ),
                        ),
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
