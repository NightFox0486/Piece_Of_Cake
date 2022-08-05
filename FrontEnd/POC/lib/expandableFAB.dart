import 'package:flutter/material.dart';

class ExpandableFAB extends StatefulWidget {
  const ExpandableFAB({Key? key, required this.children, required this.distance}) : super(key: key);

  final List<Widget> children;
  final double distance;

  @override
  State<ExpandableFAB> createState() => _ExpandableFABState();
}

class _ExpandableFABState extends State<ExpandableFAB> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  bool _open = false;


  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
        value: _open ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        vsync: this);
    
    _expandAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad
    );
  }

  void toggle() {
    setState(() {
      _open = !_open;
      if(_open) {
        _controller.forward();
      }else{
        _controller.reverse();
      }
    });
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
