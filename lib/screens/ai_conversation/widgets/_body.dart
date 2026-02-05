part of '../ai_conversation.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Scaffold(
      extendBodyBehindAppBar: state.showChat ? false : true,
      appBar: CustomAppBar(title: 'AI Conversation', type: AppBarType.withText),
      body: GestureDetector(
        onTap: () {
          // Show chat when tapping anywhere on the screen in initial state
          if (!state.showChat) {
            state.showChat = true;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: state.showChat
                ? null
                : DecorationImage(
                    image: AssetImage('assets/pngs/bg_ai.png'),
                    fit: BoxFit.cover,
                  ),
            color: AppTheme.c.background.main,
          ),
          child: Column(
            children: [
              // Chat messages area
              Expanded(
                child: state.showChat ? _ChatMessagesView() : _InitialView(),
              ),

              // Bottom input area
              _BottomInputSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _InitialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Image.asset('assets/svgs/AI.png', width: 125.w, height: 145.h),

        // Title
        Positioned(
          bottom: 0.h,
          top: 380.h,
          child: Column(
            children: [
              Text('Hello I\'m AI Assistant', style: AppText.h3b),
              Space.yf(3),

              // Subtitle
              Text(
                'Your AI digital Partners',
                style: AppText.b1bm!.cl(AppTheme.c.text.main!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChatMessagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      children: [
        _UserMessage(message: 'Hey love ❤️ What can you do?'),
        SizedBox(height: 16.h),
        _AiMessage(message: 'Hi! I\'m your smart AI assistant 😊'),
        SizedBox(height: 16.h),
        _UserMessage(message: 'Nice! Can you tell me today\'s weather?'),
        SizedBox(height: 16.h),
        _AiMessage(
          message:
              'Sure ☀️ It\'s 29°C with clear skies —\nperfect day to go out!',
        ),
        SizedBox(height: 16.h),
        _UserMessage(
          message: 'Cool! Can you make a to-do list for my\nday? 📝',
        ),
        SizedBox(height: 16.h),
        _AiMessage(
          message:
              'Absolutely 🎯\nHere\'s your plan:\n1. Morning workout\n2. Team meeting at 10 AM\n3. Lunch break at 1 PM\n4. Project review (deadline 5 PM)',
        ),
        SizedBox(height: 16.h),
        _UserMessage(message: 'That\'s awesome. Can you motivate me\ntoo? 🙏'),
        SizedBox(height: 16.h),
        _AiMessage(message: 'Thanks buddy, you\'re the best!'),
        SizedBox(height: 80.h),
      ],
    );
  }
}

class _UserMessage extends StatelessWidget {
  final String message;

  const _UserMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: Space.all(12, 8),
            decoration: BoxDecoration(
              color: AppTheme.c.accent.purple,
              borderRadius: UIProps.buttonRadius,
            ),
            child: Text(message, style: AppText.inter.l1),
          ),
        ),
        Space.xf(15),
        CircleAvatar(
          radius: 16.r,
          backgroundColor: Color(0xFFD1D5DB),
          child: Icon(Icons.person, size: 18.sp, color: Colors.white),
        ),
      ],
    );
  }
}

class _AiMessage extends StatelessWidget {
  final String message;

  const _AiMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.c.white,
          ),
          child: Center(
            child: Image.asset('assets/svgs/AI.png', width: 31.w, height: 31.h),
          ),
        ),
        Space.xf(15),
        Flexible(
          child: Container(
            padding: Space.all(12, 8),
            decoration: BoxDecoration(
              color: AppTheme.c.white,
              borderRadius: UIProps.buttonRadius,
            ),
            child: Text(
              message,
              style: AppText.inter.l1!.cl(AppTheme.c.text.shade800!),
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomInputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Padding(
      padding: EdgeInsets.all(
        24.w,
      ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Filter chips (hide during recording)
          if (!state.isRecording) ...[
            Row(
              children: [
                _FilterChip(label: 'Loving Tone'),
                Space.xf(5),
                _FilterChip(label: 'Relationship'),
                Space.xf(5),
                _FilterChip(label: 'First Date'),
              ],
            ),
            Space.yf(12),
          ],

          /// SINGLE MAIN CONTAINER
          Container(
            padding: Space.all(16, 14),
            decoration: BoxDecoration(
              color: AppTheme.c.white,
              borderRadius: UIProps.buttonRadius,
              border: Border.all(color: Color(0xFFE5E7EB)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ───────── NORMAL INPUT ─────────
                if (!state.isRecording)
                  Row(
                    children: [
                      _CircleIcon(icon: AppStaticData.plus, onTap: () {}),
                      Space.xf(12),

                      Expanded(
                        child: TextField(
                          style: AppText.inter.b2!,
                          decoration: InputDecoration(
                            hintText: 'Ask Assistant',
                            hintStyle: AppText.inter.b2!.cl(
                              AppTheme.c.text.main!,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),

                      Space.xf(12),

                      _CircleIcon(
                        icon: 'assets/svgs/microphone.svg',
                        onTap: state.toggleRecording,
                      ),

                      Space.xf(12),

                      _CircleIcon(
                        icon: 'assets/svgs/send.2svg.svg',
                        onTap: () {},
                      ),
                    ],
                  ),

                /// ───────── RECORDING VIEW ─────────
                if (state.isRecording) ...[
                  Padding(padding: Space.hf(9), child: _VoiceRecordingView()),
                  Space.yf(16),

                  /// Mic below waveform
                  Padding(
                    padding: Space.hf(9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 11.r,
                          backgroundColor: Colors.transparent,
                          child: _CircleIcon(
                            icon: 'assets/svgs/bin_filled.svg',
                            onTap: () {},
                            size: 18,
                          ),
                        ),
                        _CircleIcon(
                          icon: 'assets/svgs/microphone.svg',
                          onTap: state.toggleRecording,
                          iconColor: AppTheme.c.primary.main,
                          size: 25,
                        ),
                        CircleAvatar(
                          radius: 11.r,
                          backgroundColor: Colors.transparent,
                          child: _CircleIcon(
                            icon: 'assets/svgs/send.2svg.svg',
                            onTap: () {},
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final double? size;

  const _CircleIcon({
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: SvgPicture.asset(
        icon,
        width: size?.w ?? 24.w,
        height: size?.h ?? 24.h,
        colorFilter: ColorFilter.mode(
          iconColor ?? AppTheme.c.text.shade800!,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(10),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: AppText.inter.l1bm),

          Space.xf(10),
          SvgPicture.asset(
            'assets/svgs/arrow drop down .svg',
            width: 16.w,
            height: 16.h,
          ),
        ],
      ),
    );
  }
}

class _VoiceRecordingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Waveform
        /// 🌊 Static waveform + dots (as in image)
        Row(
          children: [
            /// Bars
            Row(
              children:
                  [
                    6,
                    8,
                    10,
                    14,
                    18,
                    22,
                    26,
                    30,
                    34,
                    38,
                    42,
                    38,
                    34,
                    30,
                    26,
                    22,
                    18,
                    14,
                    10,
                    8,
                    6,
                  ].map((h) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                      child: Container(
                        width: 3.w,
                        height: h.h,
                        decoration: BoxDecoration(
                          color: AppTheme.c.primary.shade600,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    );
                  }).toList(),
            ),

            /// Dots tail
            Row(
              children: List.generate(
                6,
                (_) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                  child: Container(
                    width: 3.w,
                    height: 3.w,
                    decoration: BoxDecoration(
                      color: AppTheme.c.primary.shade600,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        Space.yf(8),

        /// Timer / State text
        Text('2:54', style: AppText.b1!.cl(AppTheme.c.text.main!)),
      ],
    );
  }
}
