import React,  { useState, useEffect } from 'react';
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

    function Product({ datas }) {
        const [cart, setCart] = useState([]);

        useEffect(() => {
            // Load cart data from localStorage on component mount
            const storedCart = localStorage.getItem('cart');
            if (storedCart) {
            setCart(JSON.parse(storedCart));
        }
    }, []);

  const addToCart = (event, product) => {
    
    event.preventDefault(); // Prevent the default form submission behavior
  
    // Check if the product is already in the cart
    const existingProduct = cart.find((item) => item.id === product.id);
  
    if (existingProduct) {
      // If the product exists in the cart, increase its quantity
      const updatedCart = cart.map((item) =>
        item.id === product.id
          ? { ...item, quantity: item.quantity + 1 }
          : item
      );
      setCart(updatedCart);
      localStorage.setItem('cart', JSON.stringify(updatedCart));
    } else {
      // If the product is not in the cart, add it with a quantity of 1
      const updatedCart = [...cart, { ...product, quantity: 1 }];
      setCart(updatedCart);
      localStorage.setItem('cart', JSON.stringify(updatedCart));
    }
  };
    return (
        <div className="container mt-5">
            <div className="row">
                <div className="col-md-12">
                    <div className="row">
                        {datas.map((product) => (
                            <div className="col-md-3" key={product.id}>
                                <div className="card shadow-lg border-0">
                                    <div className="card-body">
                                        <h3>{product.name}</h3>
                                        <h3>{formatRupiah(product.price)}</h3>
                                        <button className="btn btn-primary" onClick={(event) => addToCart(event, product)}>Add To Cart</button>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Product;

// Check if the 'product' element exists before rendering
if (document.getElementById('product')) {
    const productElement = document.getElementById('product');
    const datas = JSON.parse(productElement.getAttribute('data-products'));
    const Index = ReactDOM.createRoot(document.getElementById('product'));
    Index.render(
      <React.StrictMode>
        <Product datas={datas} />
      </React.StrictMode>
    );
}