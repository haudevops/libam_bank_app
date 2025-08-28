import 'package:flutter/material.dart';

class BlingTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onSubmitted; // ✅ callback khi submit
  final ValueChanged<String>? onChanged;   // ✅ callback khi thay đổi

  const BlingTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.focusNode,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  State<BlingTextField> createState() => _BlingTextFieldState();
}

class _BlingTextFieldState extends State<BlingTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorAnimation = ColorTween(
      begin: const Color(0xFFF8A442),
      end: const Color(0xFFFFCC66),
    ).animate(_controller);

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
        _controller.reset();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        final borderRadius = BorderRadius.circular(12);

        return Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: widget.focusNode.hasFocus
                ? [
              BoxShadow(
                color: (_colorAnimation.value ?? Colors.orange)
                    .withValues(alpha: 6),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ]
                : [],
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onSubmitted: widget.onSubmitted, // ✅ gọi callback khi submit
            onChanged: widget.onChanged,     // ✅ gọi callback khi thay đổi
            textInputAction: TextInputAction.done, // hiển thị nút "Done"
            decoration: InputDecoration(
              labelText: widget.label,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: Colors.orange.shade300,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: _colorAnimation.value ?? Colors.orange,
                  width: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
