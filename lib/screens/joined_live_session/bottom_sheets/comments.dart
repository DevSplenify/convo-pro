part of '../joined_live_session.dart';

void showCommentsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
    ),
    backgroundColor: AppTheme.c.background.main!,
    builder: (BuildContext context) {
      return CommentsBottomSheetContent();
    },
  );
}

class CommentsBottomSheetContent extends StatefulWidget {
  const CommentsBottomSheetContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommentsBottomSheetContentState createState() =>
      _CommentsBottomSheetContentState();
}

class _CommentsBottomSheetContentState
    extends State<CommentsBottomSheetContent> {
  String? replyingTo;
  String? replyingToCommentId;
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // Track expanded replies
  Set<String> expandedReplies = {};

  // Mock data - replace with your actual data source
  final List<Comment> comments = List.generate(
    10,
    (index) => Comment(
      id: 'comment_$index',
      username: 'selindiana',
      text:
          'My eyes are having a zesty party thanks to this fantastic fatlay! 🎉✨',
      timestamp: '30 m',
      likes: 100,
      avatarUrl: 'assets/pngs/pp.png',
      replyCount: index == 2 ? 50 : 0, // One comment has 50 replies
      replies: index == 2
          ? List.generate(
              3,
              (replyIndex) => Comment(
                id: 'reply_${index}_$replyIndex',
                username: 'selindiana',
                text:
                    'My eyes are having a zesty party thanks to this fantastic fatlay! 🎉✨',
                timestamp: '30 m',
                likes: 100,
                avatarUrl: '',
                replyCount: 0,
              ),
            )
          : null,
    ),
  );

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleReply(String username, String commentId) {
    setState(() {
      replyingTo = username;
      replyingToCommentId = commentId;
    });
    _focusNode.requestFocus();
  }

  void _cancelReply() {
    setState(() {
      replyingTo = null;
      replyingToCommentId = null;
    });
    _commentController.clear();
  }

  void _toggleReplies(String commentId) {
    setState(() {
      if (expandedReplies.contains(commentId)) {
        expandedReplies.remove(commentId);
      } else {
        expandedReplies.add(commentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: AppTheme.c.background.main!,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        ),
        child: Column(
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

            // Header
            Padding(
              padding: Space.hf(24),
              child: BottomsheetHeader(title: "760 Comments"),
            ),

            Space.yf(16),

            // Comments List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  final isExpanded = expandedReplies.contains(comment.id);

                  return Column(
                    children: [
                      CommentItem(
                        comment: comment,
                        onReply: () =>
                            _handleReply(comment.username, comment.id),
                        isReply: false,
                      ),

                      // Show replies if expanded
                      if (comment.replies != null &&
                          comment.replies!.isNotEmpty)
                        if (isExpanded)
                          ...comment.replies!.map(
                            (reply) => Padding(
                              padding: EdgeInsets.only(left: 48.w),
                              child: CommentItem(
                                comment: reply,
                                onReply: () =>
                                    _handleReply(reply.username, comment.id),
                                isReply: true,
                              ),
                            ),
                          ),

                      // View more replies button
                      if (comment.replyCount > 0 && !isExpanded)
                        GestureDetector(
                          onTap: () => _toggleReplies(comment.id),
                          child: Padding(
                            padding: EdgeInsets.only(left: 44.w, bottom: 16.h),
                            child: Row(
                              children: [
                                Text(
                                  'View ${comment.replyCount} More Replies',
                                  style: AppText.inter.l2b!.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppTheme.c.text.shade800!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            // Comment Input
            // Comment Input (single smooth container + reply logic intact)
            Container(
              padding: Space.all(
                24,
              ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 14.h),
              decoration: BoxDecoration(color: AppTheme.c.background.main),
              child: Container(
                padding: Space.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.c.white,
                  borderRadius: UIProps.buttonRadius,
                  border: Border.all(
                    color: AppTheme.c.accent.purple!,
                    width: 1.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40E9B3F7),
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TEXT INPUT
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        focusNode: _focusNode,
                        maxLines: 1,
                        textInputAction: TextInputAction.send,
                        style: AppText.inter.b2!.copyWith(
                          color: AppTheme.c.text.main!,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintText: replyingTo != null
                              ? 'Reply to $replyingTo'
                              : 'write your comment here',
                          hintStyle: AppText.inter.b2!.copyWith(
                            color: AppTheme.c.text.main!,
                          ),
                        ),
                        onChanged: (_) => setState(() {}),
                        onSubmitted: (_) {
                          if (_commentController.text.isNotEmpty) {
                            _sendComment();
                          }
                        },
                      ),
                    ),

                    // CLOSE REPLY
                    if (replyingTo != null)
                      GestureDetector(
                        onTap: _cancelReply,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Icon(
                            Icons.close,
                            size: 18.w,
                            color: AppTheme.c.text.main,
                          ),
                        ),
                      ),
                    // SEND ICON (INSIDE CONTAINER)
                    GestureDetector(
                      onTap: _commentController.text.isEmpty
                          ? null
                          : _sendComment,
                      child: SvgPicture.asset(
                        'assets/svgs/send.svg',
                        width: 24.w,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          AppTheme.c.text.shade800!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendComment() {
    if (_commentController.text.isEmpty) return;

    // send logic here

    _commentController.clear();
    _cancelReply();
    _focusNode.unfocus();
  }
}

class CommentItem extends StatelessWidget {
  final Comment comment;
  final VoidCallback onReply;
  final bool isReply;

  const CommentItem({
    super.key,
    required this.comment,
    required this.onReply,
    this.isReply = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 18.r,
            backgroundColor: Color(0xFFE0E0E0),
            backgroundImage: comment.avatarUrl.isNotEmpty
                ? AssetImage(comment.avatarUrl)
                : null,
            child: comment.avatarUrl.isEmpty
                ? Icon(Icons.person, size: 18.w, color: Colors.grey)
                : null,
          ),
          Space.xf(8),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.username, style: AppText.inter.l1b!),
                Space.yf(4),
                Row(
                  children: [
                    Expanded(
                      child: Text(comment.text, style: AppText.inter.l1!),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle like
                          },
                          child: SvgPicture.asset(
                            'assets/svgs/like.svg',
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                        Space.yf(4),
                        Text('${comment.likes}', style: AppText.inter.l2bm!),
                      ],
                    ),
                  ],
                ),
                Space.yf(4),
                Row(
                  children: [
                    Text(
                      comment.timestamp,
                      style: AppText.inter.l2b!.cl(AppTheme.c.text.main!),
                    ),
                    Space.xf(4),
                    Icon(
                      Icons.circle,
                      size: 4.r,
                      color: AppTheme.c.lightGrey.shade600!,
                    ),
                    Space.xf(4),
                    GestureDetector(
                      onTap: onReply,
                      child: Text(
                        'Reply',
                        style: AppText.inter.l2b!.cl(AppTheme.c.text.main!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Space.xf(12),

          // Like button
        ],
      ),
    );
  }
}
