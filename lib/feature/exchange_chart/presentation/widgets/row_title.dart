import 'package:flutter/material.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Text(
            'Dia',
            style: TextStyle(overflow: TextOverflow.clip, fontSize: 12),
            softWrap: true,
            maxLines: 2,
          ),
        ),
        Expanded(
          child: Text(
            'Data',
            style: TextStyle(overflow: TextOverflow.clip, fontSize: 12),
            softWrap: true,
            maxLines: 2,
          ),
        ),
        Expanded(
          child: Text(
            'Valor',
            style: TextStyle(overflow: TextOverflow.clip, fontSize: 12),
            softWrap: true,
            maxLines: 2,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              'Variação a D-1',
              style: TextStyle(overflow: TextOverflow.clip, fontSize: 12),
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              'Variação ao 1º dia',
              style: TextStyle(overflow: TextOverflow.clip, fontSize: 12),
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
