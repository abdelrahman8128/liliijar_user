import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liliijar/db/db.dart';
import 'package:liliijar/models/request_model.dart';

import '../cubit/cubit.dart';

void showRequestForm(BuildContext Context,
    List<DateTime> occupied) {
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  showModalBottomSheet(
    context: Context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Enter Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    dbInsert('requests', RequestModel(
                      name: nameController.text,
                      phone: phoneController.text,
                      days: occupied,
                      productID: cubit.get(Context).product.id,
                      productName: cubit.get(Context).product.title,


                    ).toMap());

                    Navigator.pop(context);
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      );
    },
  );
}
