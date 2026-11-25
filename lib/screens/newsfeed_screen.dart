import 'package:flutter/material.dart';
import 'package:yahya_mobprog/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsfeedCard(
          userName: 'Steve Rogers',
          profileImage: 'assets/images/steve rogers.jpg',
          postContent: 'How could you do this to me? I trusted you, Tony. #AvengersAssemble',
          date: '1 mins ago',
          numOfLikes: 1500000,
        ),
        NewsfeedCard(
          userName: 'Tony Stark',
          profileImage: 'assets/images/tony stark.jpg',
          postContent: 'ORE WA DOOM DA. #DOOMSDAY IS HERE #DECEMBER 17, 2026',
          date: 'dec 17, 2026',
          numOfLikes: 3000,
          hasImage: true,
        ),
      ],
    ); // ListView
  }
}
