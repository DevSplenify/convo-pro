part of '../reviews.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(12),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.radiusM,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Star Rating
          Row(
            children: List.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.only(right: index < 4 ? 5.5 : 0),
                child: SvgPicture.asset(
                  index < review.rating
                      ? 'assets/svgs/star_filled.svg'
                      : 'assets/svgs/star_bordered.svg',
                  width: 12.5.w,
                  height: 12.5.h,
                ),
              );
            }),
          ),
          Space.yf(8),
          // User Info and Comment
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Container(
                width: 33.w,
                height: 33.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(review.avatarPath!),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: AppTheme.c.lightGrey.main!,
                    width: 2.w,
                  ),
                ),
                child: Center(
                  child: review.avatarPath == null
                      ? Icon(Icons.person, size: 20.sp, color: Colors.grey[400])
                      : null,
                ),
              ),
              Space.xf(10),
              // Name and Comment
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.name, style: AppText.inter.l1bm),
                    Space.yf(2),
                    Text(
                      review.comment,
                      style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
