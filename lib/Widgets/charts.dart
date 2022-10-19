import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Modals/transaction.dart';
import '../Modals/chartValue.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransctions;

  const Chart(this.recentTransctions);

  List<ChartValues> get groupTranstionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransctions.length; i++) {
        if (recentTransctions[i].date.day == weekday.day &&
            recentTransctions[i].date.month == weekday.month &&
            recentTransctions[i].date.year == weekday.year) {
          totalSum += recentTransctions[i].amount;
        }
      }
      return ChartValues(DateFormat.E().format(weekday), totalSum);
    });
  }

  double get totalSpending {
    return groupTranstionValues.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround ,
          children: groupTranstionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
                child: ChartBar(data.day, data.amount, totalSpending>0 ?data.amount/totalSpending:0));
          }).toList(),
        ),
      ),
    );
  }
}
