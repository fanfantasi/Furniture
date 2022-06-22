import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedToggle extends StatefulWidget {
  final List<IconData> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;

  const AnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  }) : super(key: key);
  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: Get.width * 0.15,
        height: 24,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                initialPosition = !initialPosition;
                var index = 0;
                if (!initialPosition) {
                  index = 1;
                }
                widget.onToggleCallback(index);
                setState(() {});
              },
              child: Container(
                width: Get.width * 0.15,
                height: 24,
                decoration: ShapeDecoration(
                  color: widget.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    widget.values.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        widget.values[index],
                        color: Theme.of(context).colorScheme.secondary,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
              alignment: initialPosition
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: Get.width * 0.08,
                height: 24,
                decoration: ShapeDecoration(
                  color: widget.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Icon(
                  initialPosition ? widget.values[0] : widget.values[1],
                  color: Colors.white,
                  size: 16,
                ),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
