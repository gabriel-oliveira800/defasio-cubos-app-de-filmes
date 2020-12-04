import 'package:movies/src/models/companie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'year_time.dart';

class BudgetCompanies extends StatelessWidget {
  final int budget;
  final Companie companie;

  const BudgetCompanies({
    Key key,
    @required this.budget,
    @required this.companie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final money = NumberFormat("#,##0.00", "pt_BR");

    return Padding(
      child: Column(
        children: [
          YearTimeMovie(
            subtitle: 'ORÇAMENTO: ',
            alignment: Alignment.centerLeft,
            title: budget == 0 ? '-' : '\$ ${money.format(budget)}',
          ),
          SizedBox(height: 4),
          YearTimeMovie(
            subtitle: 'PRODUTORAS: ',
            alignment: Alignment.centerLeft,
            title: companie == null ? '-' : companie.name,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
    );
  }
}
