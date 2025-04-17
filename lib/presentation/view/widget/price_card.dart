import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:intl/intl.dart';

class PriceWidget extends StatefulWidget {
  final Color? color;
  final double etherAmount;
  const PriceWidget({
    super.key,
    this.color,
    required this.etherAmount,
  });

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.icons.iconEthereum.svg(
              height: 16,
              color: widget.color,
            ),
            SizedBox(
              width: Constant.small_padding,
            ),
            Text(
              "1.0103",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(1.1),
              style: TextStyle(
                color: widget.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          width: Constant.small_padding,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "(",
              style: TextStyle(
                color: widget.color,
              ),
            ),
            Assets.icons.dirhamSymbol.svg(
              height: 10,
              color: widget.color,
            ),
            SizedBox(
              width: Constant.small_padding / 2,
            ),
            Text(
              NumberFormat.currency(
                decimalDigits: 0,
                symbol: '',
              ).format(22233),
              style: TextStyle(
                color: widget.color,
              ),
            ),
            Text(
              ")",
              style: TextStyle(
                color: widget.color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
