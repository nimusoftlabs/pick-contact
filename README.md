With this plugin a Flutter app can ask its user to select a contact from his/her address book. The information associated with the contact is returned to the app.

This plugin uses the operating system's native UI for selecting contacts and does not require any special permissions from the user.

Currently, the plugin only supports picking phone numbers.

## Using

The easiest way to use this library is to call the class as follows. 
Multiple instances are not being created since thanks to a factory constructor it always 
returns an internal singleton:

```dart
import 'package:pick_contact/pick_contact.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PickContact _pickContact = PickContact();
  Contacts? _contacts;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pick Contact'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                color: Colors.blue,
                child: const Text(
                  "Pick Contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () async {
                  final pickedContact = await _pickContact.getContact();
                  setState(() {
                    _contacts = pickedContact;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                _contacts == null
                    ? 'No contact selected yet'
                    : _contacts.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
