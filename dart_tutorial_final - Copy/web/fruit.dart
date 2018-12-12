import 'dart:html';
import 'groceryitem.dart';


class Fruit extends GroceryItem  {

  // our constructor 
  Fruit(String image, String itemName, double itemPrice, InputElement quantityInput, ButtonElement addBtn, DivElement outputDiv, String id) : super(image, itemName, itemPrice, quantityInput, addBtn, outputDiv, id);
}