import 'package:contact_list/models/contact.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: ListView(
        children: showContacts(),
      ),
    );
  }
}

List<Contact> createContacts() {
  List<Contact> contacts = [];
  contacts
      .add(Contact('Thomas Anderson', 'The Matrix', Icons.sentiment_neutral));
  contacts.add(
      Contact('Frank Slade', 'Scent of a woman', Icons.sentiment_satisfied));
  contacts.add(Contact(
      'Mildred Hayes',
      'Three Billboards OUtside Ebbing, Missouri',
      Icons.sentiment_dissatisfied));
  contacts
      .add(Contact('Bruce Wayne', 'The Dark Night', Icons.sentiment_neutral));
  contacts.add(
      Contact('Jamal Malik', 'The Millionaire', Icons.sentiment_satisfied));
  return contacts;
}

List<ListTile> showContacts() {
  List<Contact> contacts = createContacts();
  for (int i = 0; i < 20; i++) {
    contacts.addAll(createContacts());
  }

  List<ListTile> list = [];
  for (var contact in contacts) {
    list.add(ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.subtitle),
      leading: CircleAvatar(
        backgroundColor: Colors.amber[600],
        child: Icon(contact.icon),
      ),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => true,
    ));
  }
  return list;
}
