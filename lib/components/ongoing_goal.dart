import 'package:flutter/material.dart';

class OngoingGoal extends StatelessWidget {
  final String goalName;
  final double goalTargetAmount;
  final double dailyTarget;
  final double collectedAmount;
  final Color cardColor;

  const OngoingGoal({
    super.key,
    required this.goalName,
    required this.goalTargetAmount,
    required this.dailyTarget,
    required this.collectedAmount,
    required this.cardColor,
  });

  // Calculate progress percentage
  double get progressPercentage {
    if (goalTargetAmount == 0) {
      return 0.0; // Avoid division by zero
    } else {
      return (collectedAmount / goalTargetAmount) * 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 35, right: 10),
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goalName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(18, 18, 18, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Full Targets',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(112, 139, 62, 1),
                    ),
                  ),
                  Text(
                    '\$${goalTargetAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(18, 18, 18, 1),
                    ),
                  )
                ]),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Daily Targets',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(112, 139, 62, 1),
                            ),
                          ),
                          Text(
                            '\$${dailyTarget.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(18, 18, 18, 1),
                            ),
                          )
                        ]),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 1.0,
                      height: 25,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Collected',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(112, 139, 62, 1),
                            ),
                          ),
                          Text(
                            '\$${collectedAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(18, 18, 18, 1),
                            ),
                          )
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Black Overlay
        Positioned(
            top: 70,
            right: 0,
            child: Container(
              width: 60,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromRGBO(18, 18, 18, 1),
              ),
            )),
        // Green Circle
        Positioned(
            top: 50,
            right: 7,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cardColor,
              ),
            )),
        // Black Clipper
        Positioned(
            top: 70,
            right: 0.2,
            child: Container(
              width: 10,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                // color: Colors.blue,
                color: Color.fromRGBO(18, 18, 18, 1),
              ),
            )),
        // Black Down Overlay
        Positioned(
            bottom: 0,
            right: 90,
            child: Container(
              width: 60,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromRGBO(18, 18, 18, 1),
              ),
            )),
        // Green Down Circle
        Positioned(
            bottom: 28,
            right: 109,
            child: Container(
              width: 60,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cardColor,
              ),
            )),
        // Black Clipper
        Positioned(
            bottom: 25,
            right: 109,
            child: Container(
              width: 70,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                // color: Colors.blue,
                color: Color.fromRGBO(18, 18, 18, 1),
              ),
            )),
        // Progress Indicator
        Positioned(
          bottom: 15,
          right: -1,
          child: Container(
            height: 110,
            width: 110,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(18, 18, 18, 1),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    child: Container(
                        width: 72,
                        height: 72,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(53, 53, 53, 1),
                        ))),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: progressPercentage / 100,
                    strokeWidth: 8,
                    color: cardColor,
                    backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  '${progressPercentage.toInt()}%',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: cardColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
