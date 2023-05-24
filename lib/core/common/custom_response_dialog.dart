import 'package:flutter/material.dart';
import 'package:flutter_retrofit/core/common/custom_card_round.dart';

import '../../utils/theme/text_theme.dart';

class CustomResponseDialog extends StatefulWidget {
  final String title, descriptions;
  final Image? img;
  final void Function()? onRetry;
  final void Function()? eventBtn;
  final eventBtnTitle;

  const CustomResponseDialog({
    Key? key,
    required this.title,
    required this.descriptions,
    this.img,
    this.onRetry,
    this.eventBtn,
    this.eventBtnTitle = '',
  }) : super(key: key);

  @override
  _CustomResponseDialogState createState() => _CustomResponseDialogState();
}

class _CustomResponseDialogState extends State<CustomResponseDialog> {
  final double _radius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return CustomRoundCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.title,
            style: BaseTextTheme.boldFont.copyWith(fontSize: 22),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            widget.descriptions,
            style: BaseTextTheme.boldFont.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.onRetry != null)
                TextButton(
                    onPressed: widget.onRetry, child: const Text('Retry')),
              if (widget.eventBtn != null)
                TextButton(
                    onPressed: widget.eventBtn,
                    child: Text(widget.eventBtnTitle)),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close')),
            ],
          )
        ],
      ),
    );
  }
}
