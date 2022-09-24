import 'package:flutter/material.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';

class AdminCenterSearchNav extends StatelessWidget {
  const AdminCenterSearchNav({Key? key}) : super(key: key);

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
    return Column(
      children: [
        SizedBox(
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(),
              ),
            ),
            child: Container(
              height: 55,
              width: 505,
              color: GlobalVariables.appBarbackgroundColor,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const IgnorePointer(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                        hintText: 'Busca tu articulos ...',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
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
    );
  }
}
