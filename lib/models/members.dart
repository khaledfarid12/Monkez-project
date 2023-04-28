// ignore: depend_on_referenced_packages

class Members {
  String id;
  String name;
  String address;
  String urlphoto;
  String pos;

  Members(this.id, this.name, this.address, this.urlphoto, this.pos);
}

List<Members> members = [
  Members('1', "kayla", "Champs-Élysées \nactor,\nparis, france.",
      "Assets/images/kyla.png", "wife"),
  Members('2', "Alex", "sartouville \n teacher ,\nparis, france.",
      "Assets/images/father.png", "father"),
  Members('3', "Andria", "Saint-Denis \n banker,\nparis, france.",
      "Assets/images/child.png", "son"),
  Members('4', "Patrick", "patrickjohn1020 \nInstructor,\nCanada,Toronto.",
      "Assets/images/Patrick.png", "husban")
];
