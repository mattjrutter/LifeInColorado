class Animal {
  String name;
  String habitat;
  num weight;
  String image;
  Eggs laysEggs;

  Animal({
    this.name,
    this.habitat,
    this.weight,
    this.image,
    this.laysEggs
  });

  num lbstokg(num weight){
    weight = weight * 0.45359;
    weight = num.parse(weight.toStringAsFixed(3));
    return weight;
  }

  num lbstoOz(num weight){
    weight = weight * 16.0;
    weight = num.parse(weight.toStringAsFixed(2));
    return weight;
  }

  num lbstograms(num weight){
    weight = weight * 0.4535923;
    weight = weight * 1000;
    weight = num.parse(weight.toStringAsFixed(2));
    return weight;
  }
}


class Mammal extends Animal{
  String gestationPeriod;
  String hairColor;

  Mammal(
      name,
      habitat,
      weight,
      this.gestationPeriod,
      this.hairColor,
      laysEggs,
      image) :
        super(name: name, habitat: habitat, weight: weight, laysEggs: laysEggs, image: image);
}


class Bird extends Animal{
  num flightSpeed;
  String beakType;

  Bird(
      name,
      habitat,
      weight,
      this.flightSpeed,
      this.beakType,
      laysEggs,
      image) :
        super(name: name, habitat: habitat, weight: weight, laysEggs: laysEggs, image: image);

  num mphtokpm(num speed){
    speed = speed * 1.609344;
    speed = num.parse(speed.toStringAsFixed(2));
    return speed;
  }
}

class Reptile extends Animal{
  num length;
  String diet;

  Reptile(
      name,
      habitat,
      weight,
      this.length,
      this.diet,
      laysEggs,
      image) :
        super(name: name, habitat: habitat, weight: weight, laysEggs: laysEggs, image: image);

  num intocm(num length){
    length = length * 2.54;
    length = num.parse(length.toStringAsFixed(2));
    return length;
  }
}

abstract class Eggs{
  String egg();
}

class yesEggs implements Eggs{
  String egg(){
    return "Yes";
  }
}

class noEggs implements Eggs{
  String egg(){
    return "No";
  }
}
/*
@startuml

class Animal{
String  name
String  habitat
num     weight
String  image
Eggs    laysEggs
lbstokg(num)
lbstoOz(num)
lbstograms(num)
}

class Mammal {
String  gestationPeriod
String  hairColor
}

class Bird {
num     flightSpeed
String  beakType
mphtokpm(num)
}

class Reptile {
num     length
String  diet
intocm(num)
}

abstract class Eggs{
egg()
}

class yesEggs {
egg()
}

class noEggs {
egg()
}

Animal <|-- Mammal
Animal <|-- Bird
Animal <|-- Reptile
Animal *-- Eggs
Eggs <|.. yesEggs
Eggs <|.. noEggs

class StatefulWidget {
createElement()
createState()
}

abstract class Widget {
Key key
}
note top of PageClass : This represents \n each page class
PageClass <|-- StatefulWidget
StatefulWidget <|-- Widget

@enduml
*/