import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';

import '../../../common/widgets/bottom_barAdmin.dart';
import '../../../constantes/global_variables.dart';
import '../../../models/themePreference.dart';
import '../../../provider/theme.dart';
import '../../../provider/user_provider.dart';
import '../../account/services/accountServices.dart';
import '../widgets/itesmDreawer.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Material(
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.darkOFbackgroundColor
            : GlobalVariables.greyBackgroundCOlor,
        child: Container(
          padding: const EdgeInsets.only(top: 48.0, left: 10),
          color: currentTheme.isDarkTheme()
              ? GlobalVariables.darkbackgroundColor
              : GlobalVariables.backgroundColor,
          child: Column(
            children: [
              Provider.of<UserProvider>(context).user.token.isNotEmpty
                  ? Provider.of<UserProvider>(context).user.type == 'user'
                      ? headerWidget()
                      : HeaderWidgetAdmin()
                  : Container(
                      child: Text(
                        'No registrado',
                        style: TextStyle(
                          fontSize: 18,
                          color: currentTheme.isDarkTheme()
                              ? GlobalVariables.text1darkbackgroundColor
                              : GlobalVariables.text1WhithegroundColor,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Provider.of<UserProvider>(context).user.type == 'admin'
                  ? DrawerItem(
                      name: 'Panel de admin',
                      icon: Icons.admin_panel_settings,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          // ensures fullscreen
                          MaterialPageRoute(
                            builder: (context) => MainScreenAdmin(),
                          ),
                        );
                      },
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              Divider(
                thickness: 1,
                height: 10,
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.borderColorsDarklv10
                    : GlobalVariables.borderColorsWhithelv10,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'People',
                icon: Icons.people,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'My Account',
                icon: Icons.account_box_rounded,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Chats',
                icon: Icons.message_outlined,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Favourites',
                icon: Icons.favorite_outline,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                height: 10,
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.borderColorsDarklv10
                    : GlobalVariables.borderColorsWhithelv10,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Setting',
                icon: Icons.settings,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Log out',
                icon: Icons.logout,
                onPressed: () {
                  AccountServices().logOut(context);
                },
              ),
              Container(
                color: GlobalVariables.appBarbackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.wb_sunny,
                        color: currentTheme.isDarkTheme()
                            ? Color.fromARGB(104, 5, 5, 5)
                            : Colors.white),
                    Switch(
                        value: currentTheme.isDarkTheme(),
                        onChanged: (value) {
                          String newTheme = value
                              ? ThemePreference.DARK
                              : ThemePreference.LIGHT;
                          currentTheme.setTheme = newTheme;
                        }),
                    Icon(
                      Icons.brightness_2,
                      color: currentTheme.isDarkTheme()
                          ? Colors.white
                          : Color.fromARGB(
                              104,
                              5,
                              5,
                              5,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class headerWidget extends StatelessWidget {
  const headerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const url =
        'https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo=';
    final currentTheme = Provider.of<ThemeProvider>(context);
    final user = Provider.of<UserProvider>(context).user;
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name.capitalize(),
              style: TextStyle(
                fontSize: 18,
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text1darkbackgroundColor
                    : GlobalVariables.text1WhithegroundColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(user.type.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.text1darkbackgroundColor
                      : GlobalVariables.text1WhithegroundColor,
                ))
          ],
        )
      ],
    );
  }
}

class HeaderWidgetAdmin extends StatelessWidget {
  const HeaderWidgetAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const url =
        'https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo=';
    final currentTheme = Provider.of<ThemeProvider>(context);
    final user = Provider.of<UserProvider>(context).user;
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name.capitalize(),
                  style: TextStyle(
                    fontSize: 18,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.text1darkbackgroundColor
                        : GlobalVariables.text1WhithegroundColor,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(user.type.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.text1darkbackgroundColor
                          : GlobalVariables.text1WhithegroundColor,
                    ))
              ],
            ),
            CustomnIconsButton(
                onPressed: () {},
                icon: Icon(
                  Icons.admin_panel_settings,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.text1darkbackgroundColor
                      : GlobalVariables.text1WhithegroundColor,
                ))
          ],
        )
      ],
    );
  }
}
