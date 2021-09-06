import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jurema/consts/color_pallet_const.dart';
import 'package:jurema/consts/shadow_pallet_const.dart';
import 'package:jurema/screens/my_recipes/controller/my_recipes_controller.dart';
import 'package:jurema/screens/my_recipes/widgets/recipe_card_widget.dart';

class MyRecipesScreen extends StatefulWidget {
  MyRecipesScreen({Key? key}) : super(key: key);

  @override
  _MyRecipesScreenState createState() => _MyRecipesScreenState();
}

class _MyRecipesScreenState extends State<MyRecipesScreen>
    with TickerProviderStateMixin {
  double _animatedValue = 1.0;
  late MyRecipesController controller;

  void initState() {
    controller = Get.find();
    _setUpOpacityAnimation();
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
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context), backgroundColor: Colors.white);
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21.0,
            vertical: 10.0,
          ),
          child: Center(
            child: Column(
              children: [
                _buildTop(context),
                _buildContent(context),
              ],
            ),
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
      return Column(
        children: [
          _buildRegionDropDown(context),
          _buildRecipeList(context),
        ],
      );
    });
  }

  Widget _buildTop(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 15.0,
                ),
                Text('Back to My Profile',
                    style: TextStyle(
                      fontSize: 12.0,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('My Recipes',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 21.0,
                  )),
              Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 17.0,
                    color: ColorPallet.green,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    'Add New',
                    style: TextStyle(
                      color: ColorPallet.green,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRegionDropDown(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: ShadowPallet.defaultShadow,
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Western (5)',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          )),
    );
  }

  Widget _buildRecipeList(BuildContext context) {
    return Column(
      children: controller.recipes.map((e) {
        return AnimatedOpacity(
          opacity: _animatedValue,
          duration: const Duration(seconds: 1),
          child: AnimatedPadding(
            curve: Curves.decelerate,
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(20 - (_animatedValue * 20)),
            child: RecipeCardWidget(
              model: e,
              onPressed: controller.onRecipePressed,
            ),
          ),
        );
      }).toList(),
    );
  }
}
