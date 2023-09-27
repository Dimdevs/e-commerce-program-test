import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom/client';

function formatRupiah(number) {
    // Convert the number to a string with 2 decimal places
    const formattedNumber = Number(number).toFixed(2);
    
    // Add thousands separator
    const parts = formattedNumber.split('.');
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    
    // Combine the parts with rupiah symbol
    return `Rp ${parts.join(',')}`;
    }

function Cart() {
    const handleCheckout = () => {
        // Collect the data needed for the checkout process
        const checkoutData = {
          cartItems: cartItems, // The items in the cart
          total: total, // The total price
          paymentMethods: paymentMethods, // The selected payment methods
        };
    
        // Send a POST request to your Laravel API
        fetch('/api/checkout', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(checkoutData),
        })
          .then((response) => response.json())
          .then((data) => {
            // Handle the API response, e.g., display a success message or redirect
            console.log('Checkout successful', data);
            // Optionally, you can clear the cart or perform other actions
          })
          .catch((error) => {
            console.error('Checkout error', error);
            // Handle any errors from the API request
          });
      };
      
    const [cartItems, setCartItems] = useState([]);
  const [total, setTotal] = useState(0);
  const [grandTotal, setGrandTotal] = useState(0);
  const [paymentMethods, setPaymentMethods] = useState([]);

  useEffect(() => {
    // Load cart data from localStorage when the component mounts
    const storedCart = localStorage.getItem('cart');
    if (storedCart) {
      const parsedCart = JSON.parse(storedCart);
      setCartItems(parsedCart);
    }

    // Parse payment methods data from data-payments attribute
    const paymentData = document.getElementById('cart').getAttribute('data-payments');
    const parsedPayments = JSON.parse(paymentData);
    setPaymentMethods(parsedPayments);
  }, []);

  useEffect(() => {
    // Calculate the total price of items in the cart
    const newTotal = cartItems.reduce((acc, item) => acc + item.price * item.quantity, 0);
    setTotal(newTotal);

    // Calculate the grand total
    setGrandTotal(newTotal);
  }, [cartItems]);

  const handleAddNewItem = () => {
    const newItem = { name: 'New Product', price: 0, quantity: 1 };
    setCartItems([...cartItems, newItem]);
  };

  const handleDeleteItem = (index) => {
    const updatedCart = [...cartItems];
    updatedCart.splice(index, 1);
    setCartItems(updatedCart);
  };

  const handleInputChange = (index, field, value) => {
    const updatedCart = [...cartItems];
    updatedCart[index][field] = value;
    setCartItems(updatedCart);
  };
  return (
    <div className="container mt-5 mb-5">
      <h2 className='mb-4 text-center fw-bold'>Shopping Cart</h2>
      <button className="btn btn-primary mb-3" onClick={handleAddNewItem}>New</button>
      <table className="table table-bordered shadow-sm">
        <thead>
          <tr>
            <th>#</th>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {cartItems.map((item, index) => (
            <tr key={index}>
              <td>{index + 1}</td>
              <td><input type="text" value={item.name} onChange={(e) => handleInputChange(index, 'name', e.target.value)} /></td>
              <td><input type="number" value={item.price} onChange={(e) => handleInputChange(index, 'price', parseFloat(e.target.value))} /></td>
              <td>
                <input
                  type="number"
                  value={item.quantity}
                  onChange={(e) => handleInputChange(index, 'quantity', parseInt(e.target.value))}
                  min="1"
                  onInput={(e) => {
                    if (parseInt(e.target.value) < 1) {
                      alert('Quantity must be at least 1.');
                      e.target.value = '1';
                    }
                  }}
                />
              </td>
              <td>{item.price * item.quantity}</td>
              <td>
                {cartItems.length > 1 && (
                  <button className="btn btn-danger" onClick={() => handleDeleteItem(index)}>Delete</button>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <div className="row">
        <div className="col-md-12 mb-4 mt-4">
            <h2 className='text-center'>Select Payment Method</h2>
            <div className="btn-group" role="group" aria-label="Basic checkbox toggle button group">

            {paymentMethods.map((payment, index) => (
              <React.Fragment key={index}>
                <input type="checkbox" className="btn-check" id={`btncheck${payment.id}`} autoComplete="off" />
                <label className="btn btn-outline-primary" htmlFor={`btncheck${payment.id}`}>{payment.name}</label>
              </React.Fragment>
            ))}

            </div>
        </div>
      </div>
      <div className="row">
        <div className="col-md-12">
            <div className="card">
                <div className="card-body">
                    <div className="row align-items-center">
                        <div className="col-md-6">
                            <button  onClick={handleCheckout} className='btn btn-success'>Checkout All</button>
                        </div>
                        <div className="col-md-6 text-end">
                            <strong>Grand Total: {formatRupiah(grandTotal)}</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  );
}

if (document.getElementById('cart')) {
  const Index = ReactDOM.createRoot(document.getElementById("cart"));
  Index.render(
    <React.StrictMode>
      <Cart />
    </React.StrictMode>
  );
}