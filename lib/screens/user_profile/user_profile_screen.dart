import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jurema/consts/color_pallet_const.dart';
import 'package:jurema/screens/user_profile/controller/user_profile_controller.dart';
import 'package:jurema/screens/user_profile/widgets/recipe_category_widget.dart';

import 'widgets/user_profile_card_widget.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with TickerProviderStateMixin {
  late UserProfileController controller;
  late TabController tabController;
  late double _animatedValue = 1.0;

  @override
  void initState() {
    controller = Get.find();
    tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  void _setUpOpacityAnimation() {
    controller.startAnimation.listen((status) {
      if (status) {
        _animatedValue = 0.0;
        Future.delayed(Duration(milliseconds: 100)).then((value) {
          setState(() {
            _animatedValue = 1.0;
          });
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    _setUpOpacityAnimation();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      backgroundColor: Colors.white,
    );
  }

  void onTabPressed(int index) {
    tabController.animateTo(index);
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21.0,
            vertical: 10.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildAppBar(context),
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Obx(() {
      if (controller.loading.isTrue) {
        return Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: LinearProgressIndicator(),
        ));
      }
      return AnimatedOpacity(
        opacity: _animatedValue,
        duration: const Duration(seconds: 1),
        child: Column(children: [
          _buildTopProfileInfo(context),
          _buildDivider(context),
          _buildRecipesAmmount(context),
          _buildTabBar(context),
          _buildRecipeCategories(context),
        ]),
      );
    });
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('My Kitchen',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 21.0,
            )),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.settings_outlined,
            size: 18.0,
            color: Colors.black54,
          ),
          label: Text(
            'Settings',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black87,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTopProfileInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: UserProfileCardWidget(
        model: controller.user,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Divider(),
      ],
    );
  }

  Widget _buildRecipesAmmount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onTabPressed(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('20',
                    style: TextStyle(
                      fontSize: 21.0,
                    )),
                const SizedBox(height: 10.0),
                Text('Recipes',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onTabPressed(1),
            child: Column(
              children: [
                Text('75',
                    style: TextStyle(
                      fontSize: 21.0,
                    )),
                const SizedBox(height: 10.0),
                Text('Saved',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onTabPressed(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('248',
                    style: TextStyle(
                      fontSize: 21.0,
                    )),
                const SizedBox(height: 10.0),
                Text('Following',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorColor: ColorPallet.green,
          indicatorWeight: 3.0,
          tabs: [
            SizedBox.shrink(),
            SizedBox.shrink(),
            SizedBox.shrink(),
          ],
        ),
        Container(
          height: 1.0,
          color: Colors.grey.shade300,
          width: double.infinity,
        )
      ],
    );
  }

  Widget _buildRecipeCategories(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      int crossCount = 2;
      if (constrains.maxWidth > 500) {
        print(constrains.maxWidth);
        crossCount = 3;
      }

      return GridView.count(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20),
        crossAxisCount: crossCount,
        children: controller.recipeCategories
            .map((e) => AnimatedPadding(
                  duration: const Duration(seconds: 1),
                  padding: EdgeInsets.all((_animatedValue * -4.0) + 18),
                  child: RecipeCategoryWidget(
                    model: e,
                    onPressed: controller.onRecipeCategoryPressed,
                  ),
                ))
            .toList(),
      );
    });
  }
}
