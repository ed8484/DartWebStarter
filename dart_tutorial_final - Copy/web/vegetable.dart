import 'dart:html';


import 'groceryitem.dart';


class Vegetable extends GroceryItem  {
    
    Vegetable(String image, String itemName, double itemPrice, InputElement quantityInput, ButtonElement addBtn, DivElement outputDiv, String id) : super(image, itemName, itemPrice, quantityInput, addBtn, outputDiv, id);




}