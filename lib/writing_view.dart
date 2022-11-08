import 'package:flutter/material.dart';

import 'package:quis/question_widget.dart';
import 'package:quis/writing_model.dart';

import 'custom_app_bar.dart';

class WritingView extends StatefulWidget {
  const WritingView({super.key});

  @override
  State<WritingView> createState() => _WritingViewState();
}

class _WritingViewState extends State<WritingView> {
  final WritingViewModel _viewModel = WritingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Writing Quiz',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Text(
              "Please Answer the following questions ",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Image.asset(
              "assets/images/good_luck.png",
              height: 240.0,
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _viewModel.questions.length,
              itemBuilder: (BuildContext context, int index) {
                List answers = _viewModel.questions[index]['answers'];
                return QuestionWidget(
                  viewModel: _viewModel,
                  questionText:
                      '${index + 1}. ${_viewModel.questions[index]['question']}',
                  answers: answers,
                  correctAnswer: _viewModel.questions[index]['correctAnswer'],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(fontSize: 24),
                              ))
                        ],
                        // title: Text(FirebaseAuth.instance.currentUser!.displayName!),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Text("Your score is"),
                              Text("${_viewModel.score}/10"),
                            ],
                          ),
                        ),
                      );
                    }));
              },
              child: const Text('Finish Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
