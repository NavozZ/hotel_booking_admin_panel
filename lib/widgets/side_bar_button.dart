import 'package:flutter/material.dart';

class SideBarButton extends StatefulWidget {
  final String buttonText;
  final GestureTapCallback onTap;

  const SideBarButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  _SideBarButtonState createState() => _SideBarButtonState();
}

class _SideBarButtonState extends State<SideBarButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            gradient: isHovered
                ? const LinearGradient(colors: [Colors.amber, Colors.orange])
                : const LinearGradient(
                    colors: [Color(0xFF3E2723), Color(0xFF4E342E)]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: isHovered ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
