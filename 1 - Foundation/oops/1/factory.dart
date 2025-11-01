main() {
  Contact asas = Contact.withChanges("Ishaq", "helloworld");
  print(asas.email);
  print(asas.name);

  Contact c = Contact();
  print(c);
}

class Contact {
  String name = "";
  String phone = "";
  String email = "";
  String address = "";
  Contact();

  factory Contact.withChanges(String n, String e) {
    var contact = Contact();
    if (e.contains("@")) {
      contact.email = e;
    }
    contact.name = n;
    return contact;
  }
}
