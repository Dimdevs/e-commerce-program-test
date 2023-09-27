import { bottom } from '@popperjs/core';
import React from 'react';
import ReactDOM from 'react-dom/client';

function Footer() {
    return (
        <footer className='p-3 bg-primary'>
            <div className='row'>
                <div className="col-4">
                    <h1 className='text-white fw-bold'>E - Commerce</h1>
                </div>
                <div className="col-8">
                    <h3 className='text-white fw-bold'>Menu</h3>
                    <ul className='text-decoration-none underlist-none'> 
                        <li className='text-decoration-none'><a className='text-decoration-none text-white' href="/">Home</a></li>
                        <li className='text-decoration-none'><a className='text-decoration-none text-white' href="/about">About</a></li>
                        <li className='text-decoration-none'><a className='text-decoration-none text-white' href="/product">Product</a></li>
                    </ul>
                </div>
            </div>
        </footer>

    );
}

export default Footer;

if (document.getElementById('footer')) {
    const Index = ReactDOM.createRoot(document.getElementById("footer"));

    Index.render(
        <React.StrictMode>
            <Footer/>
        </React.StrictMode>
    )
}
