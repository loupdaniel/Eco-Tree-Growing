import 'package:app/components/challenge_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_page.dart';

class ChallngeListPage extends StatelessWidget {
  const ChallngeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                final value = watch.read(challengeModelProvider);
                return GridView.builder(
                  itemCount: value.challenges.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 5 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return ChallengeListTile(
                      challgeName: value.challenges[index][0],
                      achievementCondition: value.challenges[index][1],
                      additionalExplanation: value.challenges[index][2],
                      index: value.challenges[index][4],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
