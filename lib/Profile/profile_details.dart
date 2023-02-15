import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ProfilePNewage extends StatefulWidget {
  const ProfilePNewage({super.key});


  @override
  _ProfileNewPageState createState() => _ProfileNewPageState();
}

class _ProfileNewPageState extends State<ProfilePNewage> {
  String _name = "John Doe";
  String _email = "johndoe@example.com";
  final String _profilePictureUrl = "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate =
        DateFormat('dd-MM-yyyy').format(selectedDate);
        dateController.text = formattedDate.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      body: Container(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_profilePictureUrl),
              radius: 80,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: dateController,
              decoration: const InputDecoration(
                //icon of text field
                  labelText: "Enter Date" //label text of field
              ),
              readOnly: true,

              onTap: () {
                _selectDate(context);
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _updateProfileData();
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfileData() async {
    // TODO: Implement update profile data functionality
    String newName = _nameController.text;
    String newEmail = _emailController.text;

    // Call API to update the user's profile data
    // ...

    setState(() {
      _name = newName;
      _email = newEmail;
    });
  }
}