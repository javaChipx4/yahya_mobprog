import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yahya_mobprog/constants.dart';
import 'package:yahya_mobprog/widgets/custom_text.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final String profileImage;
  final String postContent;
  final String date;
  final int? numOfLikes;
  final bool? hasImage;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.profileImage,
    required this.postContent,
    required this.date,
    this.numOfLikes,
    this.hasImage,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtilSp = ScreenUtil().setSp(10);
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilFontUserNameSize = ScreenUtil().setSp(15);
    final screenUtilIconSize = ScreenUtil().setSp(15);

    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.all(screenUtilSp),
      child: Padding(
        padding: EdgeInsets.all(screenUtilSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(profileImage),
                ),
                SizedBox(width: screenUtilWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: screenUtilFontUserNameSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: screenUtilIconSize,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            if (hasImage == true)
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AspectRatio(
                  aspectRatio: 1.9,
                  child: Image.asset(
                    'assets/images/iron_man.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: _PostActionButton(
                    icon: Icons.thumb_up,
                    label: numOfLikes.toString(),
                    color: fbPrimary,
                  ),
                ),
                Expanded(
                  child: _PostActionButton(
                    icon: Icons.comment,
                    label: 'Comment',
                  ),
                ),
                Expanded(
                  child: _PostActionButton(icon: Icons.redo, label: 'Share'),
                ),
              ],
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(8),
                    ),
                    height: ScreenUtil().setHeight(32),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(18),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: 'Write a comment...',
                              fontSize: ScreenUtil().setSp(11),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        _CommentActionIcon(icon: Icons.camera_alt_outlined),
                        _CommentActionIcon(icon: Icons.emoji_emotions_outlined),
                        _CommentActionIcon(icon: Icons.photo_library_outlined),
                        _CommentActionIcon(icon: Icons.gif),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentActionIcon extends StatelessWidget {
  const _CommentActionIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: Colors.grey,
      iconSize: ScreenUtil().setSp(14),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints.tightFor(width: 24, height: 24),
      visualDensity: VisualDensity.compact,
    );
  }
}

class _PostActionButton extends StatelessWidget {
  const _PostActionButton({
    required this.icon,
    required this.label,
    this.color = fbDarkPrimary,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Icon(icon, size: ScreenUtil().setSp(14)),
      label: CustomText(
        text: label,
        fontSize: ScreenUtil().setSp(12),
        color: color,
      ),
    );
  }
}
