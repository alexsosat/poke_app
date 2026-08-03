import "package:flutter/material.dart";
import "package:flutter_common_classes/extensions/theme_extension.dart";
import "package:percent_indicator/linear_percent_indicator.dart";

import "../../../business/entities/pokemon_stats_entity.dart";

/// Section to display the pokemon stats
class PokemonStatsSection extends StatelessWidget {
  /// Section to display the pokemon stats
  const PokemonStatsSection({
    required this.color,
    required this.stats,
    super.key,
  });

  /// Colors of the stats
  final Color color;

  /// The stats data
  final PokemonStatsEntity stats;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.titleMedium?.copyWith(
      color: color,
    );

    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("HP", style: textStyle),
            Text("ATK", style: textStyle),
            Text("DEF", style: textStyle),
            Text("SATK", style: textStyle),
            Text("SDEF", style: textStyle),
            Text("SPD", style: textStyle),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          width: 1,
          height: 140,
          color: context.colorScheme.outline,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LinearPercentIndicator(
                animation: true,

                percent: stats.hp / 255,
                backgroundColor: color.withValues(alpha: 0.2),
                progressColor: color,
              ),
              const SizedBox(
                height: 20,
              ),
              LinearPercentIndicator(
                animation: true,

                percent: stats.attack / 190,
                backgroundColor: color.withValues(alpha: 0.2),
                progressColor: color,
              ),
              const SizedBox(
                height: 20,
              ),
              LinearPercentIndicator(
                animation: true,

                percent: stats.defense / 250,
                backgroundColor: color.withValues(alpha: 0.2),
                progressColor: color,
              ),
              const SizedBox(
                height: 20,
              ),
              LinearPercentIndicator(
                animation: true,

                percent: stats.specialAttack / 194,
                backgroundColor: color.withValues(alpha: 0.2),
                progressColor: color,
              ),
              const SizedBox(
                height: 20,
              ),
              LinearPercentIndicator(
                animation: true,

                percent: stats.specialDefense / 250,
                backgroundColor: color.withValues(alpha: 0.2),
                progressColor: color,
              ),
              const SizedBox(
                height: 20,
              ),
              LinearPercentIndicator(
                animation: true,
                percent: stats.speed / 200,
                backgroundColor: color.withValues(alpha: 0.2),
                progressColor: color,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
