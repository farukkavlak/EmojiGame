import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.type,
    required this.text1,
    required this.text2,
    required this.onPressed,
  }) : super(key: key);

  final String title, description,type,text1,text2;
  final Function() onPressed;
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: widget.type == 'Success' ? 10 : 0),
          Center(child: Text(widget.description,textAlign: TextAlign.center,)),
          SizedBox(height: widget.type == 'Success' ? 15 : 0),
          const Divider(
            height: 1,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: widget.onPressed,
              child: Center(
                child: Text(
                  widget.text1,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              highlightColor: Colors.grey[200],
              onTap: () {
                if(widget.type == "HintError"){
                    Navigator.of(context).pop();
                    
                }
                else if(widget.type == "Success"){
                  widget.onPressed();
                  Navigator.of(context).pop();
                }
                else {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
              child: Center(
                child: Text(
                  widget.text2,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}