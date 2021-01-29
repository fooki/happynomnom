import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateFoodDialog extends StatefulWidget {
  final Function(int rating) onRatingSet;

  RateFoodDialog({
    Key key,
    this.onRatingSet,
  }) : super(key: key);


  @override
  _RateFoodDialogState createState() => _RateFoodDialogState();
}

class _RateFoodDialogState extends State<RateFoodDialog> {
  double rating = -1.0;

  void _setTempRating(rating) {
    setState(() {
        this.rating = rating;
    });
  }

  bool _isRatingSet() {
    return rating > 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatingBar.builder(
          initialRating: 0.0,
          minRating: 1.0,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onRatingUpdate: (rating) {
            _setTempRating(rating);
          },
        ),
        _isRatingSet() ? ElevatedButton(
          onPressed: () { widget.onRatingSet(rating.round()); },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 20)
          ),
        ) : Container()
      ],
    );
  }
}
