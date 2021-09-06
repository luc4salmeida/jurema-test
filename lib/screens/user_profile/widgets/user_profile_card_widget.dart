import 'package:flutter/material.dart';
import 'package:jurema/models/user_model.dart';

class UserProfileCardWidget extends StatelessWidget {
  final UserModel? model;

  const UserProfileCardWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                'assets/profile-image.jpeg',
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model?.name ?? '',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(model?.title ?? '',
                    style: TextStyle(
                      fontSize: 12.0,
                    )),
                const SizedBox(
                  height: 13.0,
                ),
                Row(
                  children: [
                    Text('${model?.followers ?? 0} followers',
                        style: TextStyle(
                          fontSize: 12.0,
                        )),
                    Text(' • '),
                    Text('${model?.likes ?? 0} likes',
                        style: TextStyle(
                          fontSize: 12.0,
                        )),
                  ],
                )
              ],
            ),
          ],
        ),
        Icon(
          Icons.edit_outlined,
          color: Colors.black54,
          size: 18.0,
        ),
      ],
    );
  }
}
