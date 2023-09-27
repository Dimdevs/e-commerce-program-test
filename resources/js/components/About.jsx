import React from 'react';
import ReactDOM from 'react-dom/client';

function About() {
    return (
        <div className="container mt-5 mb-5">
            <div className="row">
                <div className="col-md-12">
                            
                    <div className="row">
                        <div className="col-md-4">
                            <div className="card">
                                <div className="card-body">
                                        <img src="/assets/image/shop.jpg" alt="shop-example" className='img-fluid'  />
                                </div>
                            </div>
                        </div>
                        <div className="col-md-8">
                            <div className="card mb-3">
                                <div className="card-body">
                                    <p>E - Commerce Web adalah situs elektronik komersial yang berkantor pusat di Singapura yang dimiliki oleh Sea Limited (sebelumnya dikenal dengan nama Garena), yang didirikan pada 2009 oleh Forrest Li.[1] E - Commerce Web pertama kali diluncurkan di Singapura pada tahun 2015, dan sejak itu memperluas jangkauannya ke Malaysia, Thailand, Taiwan, Indonesia, Vietnam, dan Filipina.[2] Mulai tahun 2019, E - Commerce Web juga sudah aktif di negara Brasil, menjadikannya negara pertama di Amerika Selatan dan luar Asia yang dikunjungi E - Commerce Web.[3] E - Commerce Web sendiri dipimpin oleh Chris Feng, mantan karyawan Rocket Internet yang pernah memimpin Zalora dan Lazada.[4]</p>
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
            </div>
        </div>
    );
}

export default About;

if (document.getElementById('about')) {
    const Index = ReactDOM.createRoot(document.getElementById("about"));

    Index.render(
        <React.StrictMode>
            <About/>
        </React.StrictMode>
    )
}