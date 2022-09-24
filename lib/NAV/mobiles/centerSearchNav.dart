import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';

import '../../provider/theme.dart';

class CenterSearchNav extends StatelessWidget {
  const CenterSearchNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchStactic();
  }
}

class SearchStactic extends StatelessWidget {
  const SearchStactic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      child: Column(
        children: [
          SizedBox(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SearchPage()),
                  (r) => true),
              child: Container(
                height: 55,
                width: double.infinity,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: IgnorePointer(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: currentTheme.isDarkTheme()
                              ? GlobalVariables.darkbackgroundColor
                              : GlobalVariables.backgroundColor,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                          hintText: 'Busca tu articulo ...',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                            color: currentTheme.isDarkTheme()
                                ? Colors.grey
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
