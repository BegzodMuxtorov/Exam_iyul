import 'package:exam/view/tabs/all.dart';
import 'package:exam/view/tabs/health.dart';
import 'package:exam/view/tabs/politcs.dart';
import 'package:exam/view/tabs/popular.dart';
import 'package:exam/view/tabs/tech.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              Text(
                "G.T Road,Kolkata",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          centerTitle: false,
          elevation: 0.0,
          leading: const Icon(
            Icons.menu,
            color: Colors.blueAccent,
          ),
          actions:  const [
            Icon(
              Icons.notifications,
              color: Colors.blueAccent,
              size: 35,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: TabBar(
                  labelColor: Colors.black,
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: 'Pupular',
                    ),
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Politcs',
                    ),
                    Tab(
                      text: 'Tech',
                    ),
                    Tab(
                      text: 'Healthy',
                    ),
                  ]),
            ),
            Expanded(
              flex: 12,
              child: TabBarView(controller: _tabController, children: const [
                PopularTab(),
                AllTab(),
                PolitcsTab(),
                TechTab(),
                HealthTab(),
              ]),
            )
          ],
        ));
  }
}
