import 'package:flutter/material.dart';
class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _isExpanded = false;

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _isExpanded ? 200.0 : 100.0,
              height: _isExpanded ? 200.0 : 100.0,
              color: _isExpanded ? Colors.blue : Colors.red,
              alignment: _isExpanded ? Alignment.center : Alignment.topCenter,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: 75),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleContainer,
              child: Text('Toggle Container'),
            ),
          ],
          
        ),
      ),
    );
  }
} 