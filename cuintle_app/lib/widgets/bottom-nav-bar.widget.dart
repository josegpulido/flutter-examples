// Required imports
import 'package:flutter/material.dart';
// Views
import 'package:cuintle_app/entities/places/ui/screens/home.view.dart';
import 'package:cuintle_app/entities/user/ui/screens/prov-template.view.dart';

class NavigationPager extends StatefulWidget {

  // Widget State
  @override
  State<StatefulWidget> createState() {
    // Return
    return _NavigationPager();
  }
}

class _NavigationPager extends State<NavigationPager> {

  // Variables
  final List<Widget> views = [
    HomeView(),
    ProvTemplateView('Search Widget'),
    ProvTemplateView('Collection Widget'),
    ProvTemplateView('Notification Widget'),
    ProvTemplateView('Account Widget')
  ];
  int selectedTab = 0;

  // Manejo del tap del Navigation Bar
  void onNavTapped(int i) {
    // Modificando el state del widget
    setState(() {
      this.selectedTab = i;
    });
  }

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Widget
    final Scaffold widget = Scaffold(
      body: views[selectedTab],
      bottomNavigationBar: SizedBox(
        height: 74.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow> [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15.0,
                  offset: Offset(0, -10.0) // <-- offset define la posición de la sombra en 'x' y en 'y'
              )
            ]
          ),
          child: BottomNavigationBar(
              onTap: onNavTapped,
              currentIndex: selectedTab,
              backgroundColor: Colors.white,
              selectedItemColor: Color(0xFF4939c7),
              unselectedItemColor: Color(0xFFbababa),
              iconSize: 27.0,
              showSelectedLabels: false,
              // type: BottomNavigationBarType.fixed, // <-- Elimina la animación de navegación
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: "Home"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections_outlined),
                    label: "Collections"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_active_outlined),
                    label: "Notifications"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: "Account"
                )
              ]
          )
        )
      )
    );

    // Return
    return widget;
  }
}