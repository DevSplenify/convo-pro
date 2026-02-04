part of '../faqs.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Frequently Asked Questions',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: Space.z!,
              itemCount: faqList.length,
              separatorBuilder: (_, _) => Space.yf(12),
              itemBuilder: (context, index) {
                final item = faqList[index];

                return ExpandableCard(
                  question: item['question']!,
                  answer: item['answer']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
