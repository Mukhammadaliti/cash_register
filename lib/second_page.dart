import 'package:cash_register/home_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
    this.kvitansiyalar,
  }) : super(key: key);
  final List<Invoice>? kvitansiyalar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: kvitansiyalar!.length,
              itemBuilder: (context, index) {
                final invoice = kvitansiyalar![index];
                return ListTile(
                  title: Text('${invoice.firstName} ${invoice.lastName}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${invoice.amount} Сом'),
                      Text('№${invoice.invoiceNumber}'),
                      Text('Дата: ${invoice.date.toString()}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // body: DataTable(
      //   columns: [
      //     DataColumn(label: Text('Имя')),
      //     DataColumn(label: Text('Фамилия')),
      //     DataColumn(label: Text('Авто номер')),
      //     DataColumn(label: Text('Сумма')),
      //     DataColumn(label: Text('Дата')),
      //   ],
      //   rows: kvitansiyalar!
      //       .map(
      //         (kvitansiya) => DataRow(

      //           cells: [
      //             DataCell(Text(kvitansiya.firstName)),
      //             DataCell(Text(kvitansiya.lastName)),
      //             DataCell(Text(kvitansiya.amount)),
      //             DataCell(
      //               Text(
      //                 DateFormat('dd.MM.yyyy hh:mm').format(
      //                   kvitansiya.date,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //       .toList(),
    );
  }
}
