import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Modals/transaction.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPcOfTotal;

  ChartBar(this.label, this.spendingAmount,this.spendingPcOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(child: Text(" \$ ${spendingAmount.toStringAsFixed(2)} ")),
      SizedBox(height: 4,),
      Container(height: 60,width: 10,child: Stack(
        children: [
          Container(decoration: BoxDecoration(
            border: Border.all( color: Colors.grey,width: 1.0),
            color: Color.fromRGBO(220, 220, 220, 1),
            borderRadius: BorderRadius.circular(10)
          ),),
          FractionallySizedBox(heightFactor: spendingPcOfTotal,child:  Container(decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)
          ),),)
        ],
      ),),
      SizedBox(height: 4,),
      Text("  ${label} "),
    ]);
  }
}
