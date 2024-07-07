import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation.dart';
import 'package:flutter/widgets.dart';

class ToggleButtoncode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CrazySwitch();
  }
}

class CrazySwitch extends StatefulWidget {
  @override
  _CrazySwitchState createState() => _CrazySwitchState();
}

class _CrazySwitchState extends
State<CrazySwitch> with
    SingleTickerProviderStateMixin{

  bool isChecked = false;
  Duration _duration = Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: _duration
    );

    _animation = AlignmentTween(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight
    ).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child){
        return Container(
          width: 80,
          height: 30,
          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
          decoration: BoxDecoration(
              color: isChecked ? Colors.white54 : Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: _animation.value,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_animationController.isCompleted){
                        _animationController.reverse();
                      }else{
                        _animationController.forward();
                      }

                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isChecked ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}