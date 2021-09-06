import 'package:flutter/material.dart';

import '../../../consts/shadow_pallet_const.dart';
import '../../../models/recipe_category.dart';

class RecipeCategoryWidget extends StatelessWidget {
  final RecipeCategoryModel model;
  final Function(RecipeCategoryModel) onPressed;

  const RecipeCategoryWidget({
    required this.model,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(model),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: ShadowPallet.defaultShadow,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              const SizedBox(height: 10.0),
              Align(
                alignment: Alignment.center,
                child: Text(model.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          )),
    );
  }
}
