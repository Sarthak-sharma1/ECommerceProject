function  add_to_cart(pid, pname, price) {
    let  cart = localStorage.getItem("cart");
    if (cart == null) {
        // no cart yet
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        //  console.log("Product is added for the first time");
        showToast("Item added Successfully");

    } else {

        // cart is already present...
        let pcart = JSON.parse(cart);
        let oldcart = pcart.find((item) => item.productId == pid);
        if (oldcart) {
//            Quantity Increase 

            oldcart.productQuantity = oldcart.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldcart.productId) {
                    item.productQuantity = oldcart.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            //  console.log("product quantity is increased");
            showToast(oldcart.productName + "  quantity is increased  , Quantity = " + oldcart.productQuantity);
        } else {
//     Add The Product Again to cart    

            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            //console.log("product is added");
            showToast("Product is added to cart");

        }
    }
    updateCart();
}
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("cart is empty");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart Doesn't have any item</h3>");
       $(".checkout-btn").attr('disabled', true);
    } else {
//        there is something to show in cart...
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);

        let table = `
 <table class='table'>
<thead class='thread-light'>
       
       <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        </tr>
       
       
        </thead>
     `;

        let totalPrice = 0;
        cart.map((item) => {

            table += `      

<tr>
            
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity * item.productPrice}</td>
            <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
            </tr>


                        `;
            totalPrice += item.productPrice * item.productQuantity;

        });

        table = table + ` 
<tr>
<td colspan='5'  class='text-right font-weight-bold m-5'>
Total Price : ${totalPrice}
</td>
</tr>
</table>`;
        $(".cart-body").html(table);
         $(".checkout-btn").attr('disabled', false);
    }


}
// Function Delete item from Cart

function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pid);
    localStorage.setItem('cart', JSON.stringify(newcart));
    showToast("Item Removed Successfully");
    updateCart();
}



$(document).ready(function () {
    updateCart();
});

function showToast(message) {
    var toast = document.createElement("div");
    toast.classList.add("toast");
    toast.innerText = message;
    document.body.appendChild(toast);

    setTimeout(function () {
        toast.classList.add("show");
        setTimeout(function () {
            toast.remove();
        }, 2000);
    }, 100);
}
function goToCheckOut() {
    window.location = "checkout.jsp";
}

