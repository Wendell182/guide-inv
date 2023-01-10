import 'package:flutter/material.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              'Índice',
              style: TextStyle(overflow: TextOverflow.clip, fontSize: 14),
              softWrap: true,
              maxLines: 2,
            ),
          ),
          Expanded(
            child: Text(
              'Data',
              style: TextStyle(overflow: TextOverflow.clip, fontSize: 14),
              softWrap: true,
              maxLines: 2,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Valor',
                style: TextStyle(overflow: TextOverflow.clip, fontSize: 14),
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 4.0, left: 32.0),
              child: Text(
                'V/ Í-1',
                style: TextStyle(overflow: TextOverflow.clip, fontSize: 14.0),
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 12.0, left: 32.0),
              child: Text(
                'V/ 1º Í',
                style: TextStyle(overflow: TextOverflow.clip, fontSize: 14.0),
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
