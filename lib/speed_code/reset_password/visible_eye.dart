import 'package:flutter/material.dart';

class VisibleEye extends StatefulWidget {
  const VisibleEye(
      {super.key, this.isVisible = false, required this.onChanged});
  final bool isVisible;
  final ValueChanged<bool> onChanged;
  @override
  State<VisibleEye> createState() => _VisibleEyeState();
}

class _VisibleEyeState extends State<VisibleEye> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _isVisible = widget.isVisible;
  }

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
    widget.onChanged(_isVisible);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _changeVisible,
      icon: Icon(
        _isVisible ? Icons.visibility_off_outlined : Icons.visibility_rounded,
        color: Colors.black,
      ),
    );
  }
}
