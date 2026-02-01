import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/widgets/switch_container.dart';
import 'package:flutter/material.dart';

class SwitchTabBar extends StatefulWidget {
  final List<String> options;
  final List<Widget> tabs;
  final String? initialValue;
  final ValueChanged<int>? onIndexChanged;

  const SwitchTabBar({
    super.key,
    required this.options,
    required this.tabs,
    this.initialValue,
    this.onIndexChanged,
  });

  @override
  State<SwitchTabBar> createState() => _SwitchTabBarState();
}

class _SwitchTabBarState extends State<SwitchTabBar> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Switch tab bar
        SwitchContainer(
          name: "switch_tab",
          options: widget.options,
          initialValue: _selected,
          onChanged: (val) {
            setState(() {
              _selected = val;
              final index = widget.options.indexOf(val);

              // 🔹 share index with parent
              if (widget.onIndexChanged != null) {
                widget.onIndexChanged!(index);
              }
            });
          },
        ),

        Space.yf(12),

        /// Content area
        Expanded(
          child: Builder(
            builder: (context) {
              final index = widget.options.indexOf(_selected);
              return widget.tabs[index];
            },
          ),
        ),
      ],
    );
  }
}
