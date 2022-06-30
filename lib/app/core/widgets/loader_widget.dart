import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget(
      {Key? key,
      this.opacity = 0.5,
      this.dismissibles = false,
      this.color = Colors.black,
      this.loadingTxt = 'Loading...'})
      : super(key: key);

  final double opacity;
  final bool dismissibles;
  final Color color;
  final String loadingTxt;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: opacity,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10),
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).colorScheme.background,
                size: 26,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(loadingTxt,
                  style: const TextStyle(color: Colors.white70)),
            ),
          ],
        )),
      ],
    );
  }
}
