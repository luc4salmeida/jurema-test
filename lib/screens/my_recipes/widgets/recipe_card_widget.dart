import 'package:flutter/material.dart';
import 'package:jurema/consts/color_pallet_const.dart';
import 'package:jurema/consts/shadow_pallet_const.dart';
import 'package:jurema/models/recipe_model.dart';

class RecipeCardWidget extends StatelessWidget {
  final RecipeModel model;
  final Function(RecipeModel) onPressed;

  const RecipeCardWidget({
    required this.model,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GestureDetector(
        onTap: () => onPressed(model),
        child: Container(
            height: 230.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: ShadowPallet.defaultShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    'assets/login-bg.jpeg',
                    height: 120.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '+/- 5 mins',
                              ),
                              Text(' • '),
                              Text('4 ingredients'),
                            ],
                          ),
                          Container(
                            height: 30.0,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  side: BorderSide(
                                    color: ColorPallet.green,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow_outlined,
                                color: ColorPallet.green,
                                size: 16.0,
                              ),
                              label: Text('Cook',
                                  style: TextStyle(color: ColorPallet.green)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
