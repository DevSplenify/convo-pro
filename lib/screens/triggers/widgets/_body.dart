part of '../triggers.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Triggers & Patterns',
      ),
      floatingActionButton: Padding(
        padding: Space.hf(24),
        child: AppButton(
          label: 'Create Trigger',
          onPressed: () {
            AppRoutes.addTrigger.push(context);
          },
          buttonType: ButtonType.primaryWithIconLeft,
          iconPath: 'assets/svgs/plus.svg',
          iconSize: 20,
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
            GridView.builder(
              padding: Space.z,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 8.w,
                childAspectRatio: 1.68,
              ),
              itemCount: triggers.length,
              itemBuilder: (context, index) {
                final trigger = triggers[index];
                return TriggersCard(
                  title: trigger['title'],
                  iconPath: trigger['icon'],
                  iconBgColor: trigger['color'],
                  onTap: () {
                    AppRoutes.triggerDetails.push(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TriggerCard {}
