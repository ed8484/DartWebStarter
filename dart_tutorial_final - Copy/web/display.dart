import 'dart:html';
import 'dairy.dart';
import 'cart.dart';
import 'fruit.dart';
import 'vegetable.dart';
import 'groceryitem.dart';


class Display {

  List<GroceryItem> itemList;

  DivElement outDiv;
  InputElement quantityInput;
  ButtonElement addBtn;

DivElement headerDiv = new DivElement();
ButtonElement clearCartBtn = new ButtonElement();
ButtonElement viewCartBtn = new ButtonElement();

Cart cart;

Display() {

  itemList = new List<GroceryItem>();

  cart = new Cart();

  loadEventListeners();

}

  void populateList() {

    itemList.add(new Dairy("milk.jpeg", "Milk", 1.99, quantityInput, addBtn, outDiv, "milkDiv"));
    itemList.add(new Fruit("banana.jpeg", "Banana", 1.25, quantityInput, addBtn, outDiv, "bananaDiv"));
    itemList.add(new Fruit("apple.jpeg", "Apple", 1.15, quantityInput, addBtn, outDiv, "appleDiv"));
    itemList.add(new Fruit("strawberry.jpeg", "Strawberry", 1.05, quantityInput, addBtn, outDiv, "strawDiv"));
    itemList.add(new Vegetable("carrots.jpeg", "Carrots", 1.15, quantityInput, addBtn, outDiv, "carrotDiv"));
    itemList.add(new Vegetable("tomatoes.jpeg", "Tomatoes", 1.35, quantityInput, addBtn, outDiv, "tomatoesDiv"));
    itemList.add(new Vegetable("broccoli.jpeg", "Broccoli", 1.35, quantityInput, addBtn, outDiv, "broccoliDiv"));
  }

  void createMainHeader() {


        // we give our headerDiv some bootstrap classes
        headerDiv.className = "col-md-8 bg-dark text-white text-center px-2 py-3 mt-0";
       
       // margin auto and opacity to 0.8 which will make it a bit see through
        headerDiv.style.margin="auto";
        headerDiv.style.opacity = "0.8";
        
        // we append our headerDiv to the document body
        document.body.append(headerDiv);

        // clear button with bootstrap classes that give it a red color and margin-right of 5
        clearCartBtn.className="col-md-2 btn btn-danger mr-5 ";
        clearCartBtn.style.margin="auto";

        // text shown on the clear cart button
        clearCartBtn.text = "Clear Cart";

        // same as above except different color and margin-left is set to 5
        viewCartBtn.className="col-md-2 btn btn-info ml-5 ";

        //we now set some attributes for our button, data target means which item/div/etc is it looking for
        //in this case it's shop-cart which is the id of our cart div, data-toggle will allow
        // us to easily toggle back and forth(hide and show modal)

        viewCartBtn.setAttribute("data-toggle", "modal");
        viewCartBtn.setAttribute("data-target", "#shop-cart");
        viewCartBtn.style.margin="auto";

        // text set as cart items:0 to give a visual of number of items in the cart at present
        viewCartBtn.text = "Cart Items: 0";

        


        // both elements, clearcart button and viewcart button appended to headerDiv
        headerDiv.append(clearCartBtn);
        headerDiv.append(viewCartBtn);

    }

  void addItem(Event e) {

    for(var item in itemList) {
      if((item.getAddButton()== e.target && !cart.cartItems.contains(item) && quantityValidCheck(item))) {


        cart.addItemToCart(item);

        viewCartBtn.text = "Cart Items: ${cart.cartItems.length}";

        cart.displayCartItems();
      }

    if(int.parse(item.getQuantityInput().value) <= 0) {

      cart.cartItems.remove(item);

      viewCartBtn.text = "Cart Items: ${cart.cartItems.length}";
    }
  else {  item.getQuantityInput().value;
    cart.displayCartItems();

  }


  }

}

  void showItems() {

    for(var item in itemList){

      String id = item.id;

      item.createOutDiv(outDiv, id);
      item.createAddButton(addBtn);
      item.createQuantityInput(quantityInput);
      item.displayItem();

      item.getAddButton().onClick.listen(addItem);
    }
  }
    
   void clearCart(Event e){
      // clear the cart items list using the clear method
      cart.cartItems.clear();

      // make sure the view cart button now reflects the fact we have no items in the cart by setting it to 0
      viewCartBtn.text = "Cart Items: 0";

      // finally we set the cart body to reflect that there is 0 items in the cart by using the cartItems.length method
      // which gets us the size of our list(since we cleared it, it should respond back with a 0);
      cart.cartBody.innerHtml="You have ${cart.cartItems.length} items in your cart.";
      
      
    }
    // we need to create a listener for the clear cart button
    void loadEventListeners() {
      clearCartBtn.onClick.listen(clearCart);
    }


    // create a method that has a return of type boolean...it checks if the quantity value is greater or equal to 1
    // you can use this to simplify the above check and not make above code too messy
    
    bool quantityValidCheck(GroceryItem item) {
      if(int.parse(item.getQuantityInput().value) >= 1){
        return true;
      }else {
        return false;
      }
    }

  

}
  