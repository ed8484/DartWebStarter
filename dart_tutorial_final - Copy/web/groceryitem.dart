// import dart:html library so we can manipulate the DOM
import 'dart:html';


// create an abstract class that will be a blueprint for all the related classes that will extend it

abstract class GroceryItem {

    // we will need to know the image of the item, name of the item and price of the item
   //  also need to have input element that will be quantity amount and add to cart button
    // these will be private variables

    String _image;
    String _itemName;
    double _itemPrice;

    InputElement _quantityInput;
    ButtonElement _addBtn;

    DivElement _outputDiv;
    String _id;


    // Our constructor will take in all the values above 
    
    GroceryItem(this._image, this._itemName, this._itemPrice, this._quantityInput, this._addBtn, this._outputDiv, this._id){

     
 }

    void createOutDiv(DivElement outDiv, String divId){

    // we create our new outDiv    

      outDiv = new DivElement();

      // assign the new div an id to be whatever is passed into this method

      outDiv.id = divId;

      // give it bootstrap classes to style the div, give it responsive
      // design, dark background, white text, left aligned, padding of 2 on all sides, margin-top-2 and center it with margin-auto

      outDiv.className = "col-md-8 bg-dark text-white text-left p-2 mt-2";
      outDiv.style.margin="auto";

      // we now assign our _outputDiv to outDiv

      _outputDiv = outDiv;


      // finally we use the append function to show output div on the page

      document.body.append(_outputDiv);

    }

    // let's now create an input element to add quantity amount choice

    void createQuantityInput(InputElement qtyInput){

      // we create a new input element

      qtyInput = new InputElement();

      // we give it some bootstrap classes to style it, 1 size column on medium screens, dark text, 
      // padding of 2 in all directions and margin auto, and we float the item to the far right corner

      qtyInput.className = "col-md-1 text-dark p-2 ml-3 mt-1 float-right";

      // we assign content type to be number(instead of text for example) and we give it 
      // an initial value of 1(this is what will be the default when quantity amount is shown)

      qtyInput.type = "number";
    
      qtyInput.value = "1";
      qtyInput.min = "0";

      // finally we assign our _quantityinput to the newly created qtyInput

      _quantityInput = qtyInput;

     
    }

    void createAddButton(ButtonElement btn){

      // first we create a new button element

      btn = new ButtonElement();

      // just like we have been doing it to other elements, we assign it some bootstrap classes
      // those classes will have this effect: it will have 2 columns on medium screens or bigger, padding of 2, margin-auto 
      // and floated to the far right of the screen

      btn.className = "col-md-2 btn btn-success p-2 ml-3 mt-1 float-right";

      // we assign it text to display on the button

      btn.text = "Add";

      // finally we assign _addBtn variable to the new btn we created

      _addBtn = btn;

    }


    
    void displayItem() {

      // here we call the innerhtml function of the outputdiv and we set it
      // to be values of getimage, itemname and itemprice 

      _outputDiv.innerHtml = "${getImage()} ${_itemName} \$${_itemPrice}";
      
      
      // we append the quantityinput element and also the addbtn element

       _outputDiv.append(_addBtn);
      _outputDiv.append(_quantityInput);
    

    }

  // here we make a  method that returns a string, in this case a path to where
  // our image is located 

    String getImage() {
      
      String img = "<img src='../images/${_image}'>";
  
      return img;
    }

    
   

    String getItemName() {
      return _itemName;
    }


    InputElement getQuantityInput() {
      return _quantityInput;
    }

    ButtonElement getAddButton() {
      return _addBtn;
    }

    double getItemPrice() {
      return _itemPrice;
    }
  
  DivElement get outputDiv => _outputDiv;
  String get id => _id; 


}
