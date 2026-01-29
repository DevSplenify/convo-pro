part of '../home.dart';

class _UserHeader extends StatelessWidget {
  const _UserHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Space.hf(23).copyWith(
        bottom: 19.h,
        top: MediaQuery.of(context).padding.top,
        left: 26.w,
      ),
      decoration: BoxDecoration(
        color: AppTheme.c.primary.main,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56.h,
            height: 56.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.c.white!, width: 1.w),
              image: DecorationImage(
                image: AssetImage('assets/pngs/pp.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Space.xf(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Space.yf(5),
              Text('Hi, Shinomiya!', style: AppText.b1b!.cl(AppTheme.c.white!)),
              Space.yf(4),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/calendar.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                  Space.xf(4),
                  Text(
                    'Tue, 25 Jan 2025',
                    style: AppText.inter.l1bm!.cl(AppTheme.c.white!),
                  ),
                ],
              ),
            ],
          ),
          Space.xm!,
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentGeometry.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/notification.svg',
                width: 32.w,
                height: 32.h,
              ),
              Positioned(
                right: -4,

                child: Container(
                  padding: Space.all(7.5, 1),
                  decoration: BoxDecoration(
                    color: AppTheme.c.error.main,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '3',
                      style: AppText.inter.l2b!.cl(AppTheme.c.white!),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
