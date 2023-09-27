import React from 'react';
import ReactDOM from 'react-dom/client';

function Example() {
    return (
        <div className="container mt-5 mb-5">
            <div className="row justify-content-center">
                <div className="col-md-4">
                    <img src="/assets/image/shop.jpg" alt="shop-example" className='img-fluid'  />
                </div>
                <div className="col-md-8">
                    <div className="card mb-3">
                        <div className="card-body">
                            <h3 className='text-center fw-bold mb-0'>Wellcome to E - Commerce By Dimas Maulana (Dimdevs)</h3>
                        </div>
                    </div>
                    <div className="card">
                        <div className="card-body">
                            <img src="/assets/image/banner.jpg" className='img-fluid' alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Example;

if (document.getElementById('example')) {
    const Index = ReactDOM.createRoot(document.getElementById("example"));

    Index.render(
        <React.StrictMode>
            <Example/>
        </React.StrictMode>
    )
}