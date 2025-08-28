import 'package:flutter/material.dart';
import '../../model/FoodCategorySourceResponse.dart';
import '../DetilsListFood/Cubit/detils_food_view.dart';
import 'list_food_item.dart';

class ListFoodTapBar extends StatefulWidget {
  final List<Meals> mealsList;

  ListFoodTapBar({required this.mealsList});

  @override
  State<ListFoodTapBar> createState() => _ListFoodTapBarState();
}

class _ListFoodTapBarState extends State<ListFoodTapBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.mealsList.length, vsync: this);
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
          tabs: List.generate(widget.mealsList.length, (index) {
            var meals = widget.mealsList[index];
            return ListFoodItem(
              meals: meals,
              isSelected: _tabController.index == index,
            );
          }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.66,
          child: TabBarView(
            controller: _tabController,
            children: widget.mealsList.map((meals) {
              return DetilsFoodView(ingredient: meals.strCategory ?? "");
            }).toList(),
          ),
        ),
      ],
    );
  }
}
