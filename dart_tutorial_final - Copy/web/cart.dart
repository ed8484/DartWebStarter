import 'dart:html';
import 'groceryitem.dart';

//this class represents our shopping cart

class Cart {

  //declare our cart items list
  List<GroceryItem> cartItems;

  //declare our elements for the cart
  DivElement cartDiv;
  DivElement cartDialog;
  DivElement cartContent;
  DivElement cartHeader;
  DivElement cartBody;
  DivElement cartFooter;

  //declare our submit button
  ButtonElement submitBtn;

  Cart() {

    cartDiv = new DivElement();
    cartDialog = new DivElement();
    cartContent = new DivElement();
    cartHeader = new DivElement();
    cartBody = new DivElement();
    cartFooter = new DivElement();
    submitBtn = new ButtonElement();

    createCart();

    cartItems = new List<GroceryItem>(); 

    loadEventListener();
  }

  

// create cart
    void createCart() {
      
      // give cart an id and a bootstrap class of modal
      cartDiv.id = "shop-cart";
      cartDiv.className = "modal";
      cartDiv.style.margin="auto";
      cartDiv.style.width="600px";
      cartDiv.style.height="600px";
      
      // next is our cart dialog with a class which has to be modal-dialog(bootstrap class), also we
      // set a background color
      cartDialog.className="modal-dialog";
      cartDialog.style.backgroundColor="#ccc";
     

      // similar as above, class has to be modal content
      cartContent.className = "modal-content";
      
      // header with a text of shop cart, class of modal-header
      cartHeader.className="modal-header text-white text-center";
      cartHeader.style.backgroundColor="#000ccc";
      cartHeader.text = "Shop Cart";
    
      // cart body with text and modal-body class
      cartBody.className="modal-body";
      cartBody.style.backgroundColor="#fff";
      cartBody.text = "You have 0 items in your cart";

      // cart footer with class of modal-footer and dark background
      cartFooter.className="modal-footer";
      cartFooter.style.backgroundColor="#ccc";

      // finally we have the submit button that strethes all the way inside the footer and has
      // submit text
      submitBtn.className="btn btn-primary btn-block";
      submitBtn.text = "Submit";
      

      // we append the submit button to the cart footer as that is where the button should appear
      cartFooter.append(submitBtn);

      // we now combine all items together by first appending cartDiv to the document body
      document.body.append(cartDiv);

      // we then append rest of items to the cartDiv
      cartDiv.append(cartDialog);
      cartDiv.append(cartContent);
      cartDiv.append(cartHeader);
      cartDiv.append(cartBody);
      cartDiv.append(cartFooter);

 }

void addItemToCart(GroceryItem item){
  cartItems.add(item);
}

void displayCartItems(){
  String output = "";
  for(var item in cartItems) {
    output += "<ul> ${item.getImage()} ${item.getItemName()} \$${item.getItemPrice()} // quantity: ${item.getQuantityInput().value}</ul>";
  }
  cartBody.innerHtml = output;
}

  void loadEventListener() {
    submitBtn.onClick.listen(closeModal);
  }

void closeModal(Event e) {
  submitBtn.setAttribute("data-dismiss", "modal");

  }
}