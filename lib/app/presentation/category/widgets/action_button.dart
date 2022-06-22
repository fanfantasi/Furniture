import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final IconData iconPath;
  final bool active;

  const ActionButton({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        children: [
          Icon(
            iconPath,
            color: active
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).primaryIconTheme.color,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: active
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).primaryIconTheme.color,
                    fontSize: 14.0),
              ),
              if (active)
                Positioned(
                  top: -3,
                  right: -12,
                  child: Icon(
                    CupertinoIcons.checkmark_alt_circle,
                    size: 12,
                    color: Theme.of(context).primaryColor,
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
