part of '../reviews.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(type: AppBarType.withText, title: 'Reviews'),
      floatingActionButton: Padding(
        padding: Space.hf(24),
        child: AppButton(
          label: 'Write a Review',
          onPressed: () {
            showWriteReviewBottomSheet(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: reviewsList.length,
              padding: Space.z,
              separatorBuilder: (context, index) => Space.yf(10),
              itemBuilder: (context, index) {
                return ReviewCard(review: reviewsList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
