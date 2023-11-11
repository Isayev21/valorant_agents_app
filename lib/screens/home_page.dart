import 'package:flutter/material.dart';
import 'package:valorant_app/constants/colors.dart';
import 'package:valorant_app/widgets/agents_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentPageIndex = 0;
  late TabController tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 74,
                height: 74,
                child: Image.asset('assets/icons/ic_appicon.png'),
              ),
            ),
            const SizedBox(height: 10),
            getHomePageTitle(),
            const SizedBox(height: 20),
            const Expanded(
              child:  PopularAgents(),
            )
          ],
        ),
      ),
    );
  }

  Text getHomePageTitle() {
    return const Text(
      "Choose your \nawesome Agent",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.mainTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 32,
      ),
    );
  }
}
