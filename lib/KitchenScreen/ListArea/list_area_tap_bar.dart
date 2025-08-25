import 'package:flutter/material.dart';
import '../../model/CountrySourceResponse.dart';
import '../Food/Cubit/food_view.dart';

import 'item_list_area.dart';

class ListAreaTapBar extends StatefulWidget {
  final List<Area> areaList;

  const ListAreaTapBar({required this.areaList, Key? key}) : super(key: key);

  @override
  State<ListAreaTapBar> createState() => _ListAreaTapBarState();
}

class _ListAreaTapBarState extends State<ListAreaTapBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.areaList.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          isScrollable: true,
          tabs: List.generate(widget.areaList.length, (index) {
            final area = widget.areaList[index];
            return ItemListArea(
              area: area,
              isSelected: _tabController.index == index,
            );
          }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.66,
          child: TabBarView(
            controller: _tabController,
            children: widget.areaList.map<Widget>((area) {
              return FoodView(area: area.strArea ?? "");
            }).toList(),
          ),
        ),
      ],
    );
  }
}
