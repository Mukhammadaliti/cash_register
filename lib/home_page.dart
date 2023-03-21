// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'second_page.dart';

class Invoice {
  String firstName;
  String lastName;
  String amount;
  String invoiceNumber;
  DateTime date;

  Invoice(
      {required this.firstName,
      required this.lastName,
      required this.amount,
      required this.invoiceNumber,
      required this.date});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _amountController = TextEditingController();
  final List<Invoice> _invoices = [];
  addInvoice() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        final invoice = Invoice(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          amount: _amountController.text,
          invoiceNumber: '${_invoices.length + 1}',
          date: DateTime.now(),
        );
        _invoices.add(invoice);

        _firstNameController.clear();
        _lastNameController.clear();
        _amountController.clear();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              kvitansiyalar: _invoices,
            ),
          ),
        );
      });
    }
  }

  RegExp _nameRegExp = RegExp(r"^[a-zA-Z]+$");

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.yellow, width: 2.0),
                          ),
                          labelText: 'First Name',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.yellow, width: 2.0),
                          ),
                          labelText: 'Last Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          // filled: true,
                          // fillColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.yellow, width: 2.0),
                          ),
                          labelText: 'Amount',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              addInvoice();
                            },
                            child: const Text('Добавить'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondPage(
                                    kvitansiyalar: _invoices,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Список',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
