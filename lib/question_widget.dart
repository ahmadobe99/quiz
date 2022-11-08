import 'package:flutter/material.dart';
import 'package:quis/writing_model.dart';


class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    this.questionText,
    this.answers,
    this.correctAnswer,
    required this.viewModel,
  }) : super(key: key);

  final String? questionText;
  final List? answers;
  final String? correctAnswer;
  final WritingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    String? radioGroupValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionText!,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Column(
              children: [
                for (int i = 0; i < answers!.length; i++)
                  RadioListTile(
                    value: answers![i],
                    activeColor: Theme.of(context).colorScheme.secondary,
                    title: Text(
                      answers![i],
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    groupValue: radioGroupValue,
                    onChanged: (value) {
                      if (radioGroupValue == null) {
                        if (value == correctAnswer) {
                          viewModel.score += 1;
                        }
                      } else {
                        if (radioGroupValue == correctAnswer &&
                            value != correctAnswer) {
                          viewModel.score -= 1;
                        } else if (radioGroupValue != correctAnswer &&
                            value == correctAnswer) {
                          viewModel.score += 1;
                        }
                      }

                      setState(() {
                        radioGroupValue = value;
                      });
                    },
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}