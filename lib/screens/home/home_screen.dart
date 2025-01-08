import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/screens/explore/explore_screen.dart';
import 'package:food_app/screens/order/order_screen.dart';
import 'package:food_app/screens/profile/profile_screen.dart';
import 'package:food_app/widgets/home_widgets/header_bar.dart';
import 'package:food_app/widgets/home_widgets/item_options_widget.dart';
import 'package:food_app/widgets/home_widgets/slider_options_food.dart';
import 'package:food_app/widgets/home_widgets/store_widget.dart';
import 'package:food_app/widgets/home_widgets/top_rank_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;

  final List<Widget> telas = [
    Column(
      children: [
        const HeaderBar(),
        const ItemOptionsWidget(),
        const SliderOptionsFood(),
        const TopRankWidget(),
        SizedBox(
          height: 15,
          child: Divider(
            thickness: 2,
            color: Colors.grey[100],
          ),
        ),
        const StoreWidget(),
      ],
    ),
    // páginas aqui
    const ExploreScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [telas[page]],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: Color(0xFFF0F3FA),
            ),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: page,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle:
                const TextStyle(color: Colors.black, fontSize: 12),
            unselectedLabelStyle:
                const TextStyle(color: Colors.grey, fontSize: 12),
            elevation: 10,
            onTap: (int index) {
              Future.delayed(const Duration(milliseconds: 100), () {
                setState(() {
                  page = index;
                });
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/home.svg',
                  height: 23,
                ),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/search.svg',
                  height: 23,
                ),
                label: 'Busca',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/clipboard.svg',
                  height: 23.5,
                ),
                label: 'Pedidos',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/user.svg',
                  height: 23,
                ),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
