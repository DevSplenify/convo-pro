part of '../quiz.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    final currentQuestion = state.questions[state.currentQuestionIndex];
    final selectedAnswer = state.getSelectedAnswer();

    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Gratitude Quiz',
      ),
      floatingActionButton: Padding(
        padding: Space.hf(24),
        child: AppButton(
          label: state.isLastQuestion ? 'Submit Quiz' : 'Next Question',
          onPressed: () {
            if (state.hasAnsweredCurrent) {
              if (state.isLastQuestion) {
                // Navigate to quiz completed screen
                AppRoutes.quizCompleted.push(context);
              } else {
                state.nextQuestion();
              }
            }
          },
          isDisabled: !state.hasAnsweredCurrent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),

        child: Column(
          children: [
            // Header section with question counter and progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${state.currentQuestionIndex + 1} of ${state.totalQuestions}',
                  style: AppText.inter.b2!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${((state.currentQuestionIndex + 1) / state.totalQuestions * 100).toInt()}% Complete',
                  style: AppText.inter.b2!.copyWith(
                    color: AppTheme.c.text.main,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Space.yf(5),

            // Progress bar
            SizedBox(
              height: 8.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: LinearProgressIndicator(
                  value: state.progress,
                  backgroundColor: AppTheme.c.primary.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppTheme.c.primary.main!,
                  ),
                ),
              ),
            ),
            Space.yf(25),

            Text(
              currentQuestion['question'],
              style: AppText.b1!.copyWith(height: 1.0),
            ),

            Space.yf(25),

            // Answer options
            ...List.generate((currentQuestion['options'] as List).length, (
              index,
            ) {
              final isSelected = selectedAnswer == index;
              final optionLabels = ['A', 'B', 'C', 'D', 'E', 'F'];

              return GestureDetector(
                onTap: () => state.selectAnswer(index),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  padding: Space.all(12, 20),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.c.primary.shade200
                        : AppTheme.c.white,
                    borderRadius: UIProps.buttonRadius,
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.c.primary.main!
                          : AppTheme.c.lightGrey.shade300!,
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Option label (A, B, C, D)
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.c.primary.shade700,
                        ),
                        child: Center(
                          child: Text(
                            optionLabels[index],
                            style: AppText.inter.b1!.copyWith(
                              color: AppTheme.c.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Space.xf(10),
                      Expanded(
                        child: Text(
                          currentQuestion['options'][index],
                          style: AppText.inter.b2!.copyWith(
                            color: AppTheme.c.text.shade800,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            // Fixed bottom navigation button
          ],
        ),
      ),
    );
  }
}
