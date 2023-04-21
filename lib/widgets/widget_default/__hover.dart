// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OnHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  final int miliseconds;
  final Matrix4? transform;
  const OnHover({
    Key? key,
    required this.builder,
    this.miliseconds = 200,
    this.transform,
  }) : super(key: key);

  @override
  State<OnHover> createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  Matrix4? hovered;

  @override
  void initState() {
    super.initState();
    if (widget.transform != null) {
      hovered = widget.transform;
    } else {
      hovered = Matrix4.identity()..scale(1.06);
    }
  }

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTranformation = isHovered ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        color: Colors.transparent,
        clipBehavior: Clip.none,
        transformAlignment: Alignment.center,
        duration: Duration(milliseconds: widget.miliseconds),
        transform: hoveredTranformation,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
