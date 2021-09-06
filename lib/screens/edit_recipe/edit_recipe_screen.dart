import 'package:flutter/material.dart';
import 'package:jurema/consts/color_pallet_const.dart';
import 'package:jurema/consts/shadow_pallet_const.dart';

class EditRecipeScreen extends StatelessWidget {
  const EditRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      backgroundColor: Colors.white,
    );
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
            children: [
              _buildAppBar(context),
              _buildTopRecipeInfo(context),
              _buildGalery(context),
              _buildIngredients(context),
              _buildHowToCook(context),
              _buildAditionalInfo(context),
              _buildSaveTo(context),
              _buildPostToFeed(context),
              _buildRemoveFromCookBook(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 15.0,
              ),
              Text('Back to My Recipes',
                  style: TextStyle(
                    fontSize: 12.0,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Edit Recipe',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 21.0,
          ),
        ),
      ],
    );
  }

  Widget _buildTopRecipeInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/login-bg.jpeg'),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recipe Name',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextField(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGalery(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: const EdgeInsets.all(
          8.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: ShadowPallet.defaultShadow,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gallery',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.edit_outlined,
                  color: ColorPallet.green,
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            _buildGalleryPhoto(context),
            const SizedBox(height: 10.0),
            GridView.custom(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              childrenDelegate: SliverChildListDelegate([
                _buildGalleryPhoto(context),
                _buildGalleryPhoto(context),
                _buildGalleryPhoto(context, especial: true),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryPhoto(BuildContext context, {bool especial = false}) {
    return Stack(
      children: [
        Opacity(
          opacity: especial ? 0.3 : 1.0,
          child: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/login-bg.jpeg'),
              ),
            ),
          ),
        ),
        especial
            ? Align(
                alignment: Alignment.center,
                child: Text('12+',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
              )
            : Container()
      ],
    );
  }

  Widget _buildIngredients(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: const EdgeInsets.all(
          8.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: ShadowPallet.defaultShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingredients',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.edit_outlined,
                  color: ColorPallet.green,
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            _buildIngreditsGrid(context),
            const SizedBox(height: 10.0),
            Text('Lemonade, coconut, peppers, egg + 5 more',
                style: TextStyle(
                  fontSize: 12.0,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildIngreditsGrid(BuildContext context) {
    return GridView.custom(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      childrenDelegate: SliverChildListDelegate([
        _buildIngredientPhoto(context),
        _buildIngredientPhoto(context),
        _buildIngredientPhoto(context),
        _buildIngredientPhoto(context),
        _buildIngredientPhoto(context, especial: true),
      ]),
    );
  }

  Widget _buildIngredientPhoto(BuildContext context, {especial = false}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: especial ? 0.3 : 1.0,
          child: CircleAvatar(
            radius: 10.0,
            backgroundImage: AssetImage('assets/login-bg.jpeg'),
          ),
        ),
        especial
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  '5+',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  Widget _buildHowToCook(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: const EdgeInsets.all(
          8.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: ShadowPallet.defaultShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'How to cook',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.edit_outlined,
                  color: ColorPallet.green,
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorPallet.green,
                    ),
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: ColorPallet.green,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    'Heat a Belgian waffle iron.',
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorPallet.green,
                    ),
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: ColorPallet.green,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    'Mix the flour, sugar, and baking powder, together in a mixing bowl. Stirin 1 cup  eggnog, butter, and the egg until well blended. Add more eggnog if neeeded tomake pourable batter.',
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorPallet.green,
                    ),
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: ColorPallet.green,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    'Lightyle grease or spray the waffle iron with non-stick cooking spray. Pour some batter onto the preheated waffle iron, ...',
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAditionalInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: const EdgeInsets.all(
          8.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: ShadowPallet.defaultShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Additional Info',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.edit_outlined,
                  color: ColorPallet.green,
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Serving time',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    '12 minutes',
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Nutrition Facts',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    '222 calories\n6.2 g fat\n7.2 g carbohydrates\n28.6 g protein\n68 mg cholesterol\n',
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Tags',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    'Sweet, Coconut, Quick, Easy, Homemade',
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveTo(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Save to'),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 50.0,
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
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Container(
                  height: 50.0,
                  child: ElevatedButton(
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
                    child: Text('Save Recipe',
                        style: TextStyle(color: ColorPallet.green)),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget _buildPostToFeed(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.5,
              primary: Color(0xFFFF31BF74),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
          onPressed: () {},
          child: Text('Post to Feed'),
        ),
      ),
    );
  }

  Widget _buildRemoveFromCookBook(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextButton.icon(
        style: TextButton.styleFrom(primary: Colors.black87),
        onPressed: () {},
        icon: const Icon(
          Icons.delete_outline,
          size: 18.0,
        ),
        label: const Text('Remove from Cookbook',
            style: TextStyle(
              fontSize: 13.0,
            )),
      ),
    );
  }
}
