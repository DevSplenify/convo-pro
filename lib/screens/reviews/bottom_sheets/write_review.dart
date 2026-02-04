part of '../reviews.dart';

void showWriteReviewBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
    ),
    backgroundColor: AppTheme.c.background.main!,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 10.h,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.c.background.main!,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),
                ),

                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  padding: Space.hf(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Handle bar
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 12.h),
                          width: 38.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                      Space.yf(20),
                      BottomsheetHeader(title: "Write a Review"),
                      Space.yf(24),
                      TappableRating(
                        initialRating: 0,
                        onRatingChanged: (rating) {
                          debugPrint('Selected rating: $rating');
                        },
                      ),
                      Space.yf(10),
                      AppContainerTextField(
                        name: 'Description',
                        hint: 'write your review here',
                        maxLines: 3,

                        maxLength: 250,

                        type: ContainerTextFieldType.multiline,
                      ),

                      // The meal list widget
                      Space.yf(24),
                      AppButton(
                        label: 'Submit Review',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

/// A tappable star rating widget
class TappableRating extends StatefulWidget {
  final int initialRating;
  final int maxRating;
  final ValueChanged<int> onRatingChanged;

  const TappableRating({
    super.key,
    this.initialRating = 0,
    this.maxRating = 5,
    required this.onRatingChanged,
  });

  @override
  State<TappableRating> createState() => _TappableRatingState();
}

class _TappableRatingState extends State<TappableRating> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  void _updateRating(int value) {
    setState(() => _rating = value);
    widget.onRatingChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating, (index) {
        final isSelected = index < _rating;

        return GestureDetector(
          onTap: () => _updateRating(index + 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SvgPicture.asset(
              isSelected
                  ? 'assets/svgs/star_filled.svg'
                  : 'assets/svgs/star_bordered.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
        );
      }),
    );
  }
}
