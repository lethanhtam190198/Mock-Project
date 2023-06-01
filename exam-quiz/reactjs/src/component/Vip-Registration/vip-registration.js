import React, { useState } from "react";
import "./vip-registration.css";
 import axios from "axios";
 import { urlPay } from '../url/urlTest'
 import { useSelector } from 'react-redux'

function Vip_Registration() {
    const token = useSelector(state => state.loginReducer.token);
    const dataUser = useSelector(state => state.loginReducer);
    const [urlVnpay,setUrlVnpay] = useState();
    const pay = urlPay;
    const onSubmit = (event) => {
        event.preventDefault();
        let formData = Object.fromEntries(new FormData(event.target));
        // console.log(`${pay}${formData.price}`);
        axios.get(`${pay}${formData.price}/${dataUser.username}`, {
            headers: {
                "Authorization": token
            }
        })
        .then((data) => {
          setUrlVnpay(data.data);
          window.open(data.data, "_blank");
        })
        .catch("NOT OKKKK");
    }
    return (
        <React.Fragment>
            <div className="space-vip">

            </div>
            <div className="body-vip">
                <div>
                <div className="">
                    <h2 className="total-name-vip">Your Smile Plus</h2>
                    <h2 className="total-vip-3">Giúp mọi học sinh tự tin khi học</h2>
                </div>
                <div>
                    <h2 className="total-name-vip-2">Các tính năng được nâng cấp:</h2>
                </div>
                <div className="icon-check-vip">
                    <svg style={{marginTop:8}} xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                    </svg>
                    <h3 className="total-info-vip">&nbsp;Kiến thức được nâng cao</h3>
                </div>
                <div className="icon-check-vip">
                    <svg style={{marginTop:8}} xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                    </svg>
                    <h3 className="total-info-vip">&nbsp;Được nhiều khoá học và nhiều bài kiểm tra hơn</h3>
                </div>
                </div>

                <div class="cards-container">
                    <div class="card-vip">
                        <div class="card-header-vip">
                            <h2 className="goi">Gói 1</h2>
                        </div>
                        <div class="card-body-vip">
                        <form onSubmit={onSubmit}>
                            <p>Số tháng nâng cấp 1.</p>
                            <p>Giá: 50.000 VNĐ</p>
                            <input type="hidden" value={50000} name="price"></input>
                            <button  className="button-submit-vip" type="submit">Mua Ngay</button>
                            </form>
                        </div>
                    </div>

                    <div class="card-vip">
                        <div class="card-header-vip">
                            <h2 className="goi">Gói 2</h2>
                        </div>
                        <div class="card-body-vip">
                        <form onSubmit={onSubmit}>
                            <p>Số tháng nâng cấp 3.</p>
                            <p>Giá: 150.000 VNĐ</p>
                            <input type="hidden" value={150000} name="price"></input>
                            <button className="button-submit-vip" type="submit">Mua Ngay</button>
                            </form>
                        </div>
                    </div>

                    <div class="card-vip">
                        <div class="card-header-vip">
                            <h2 className="goi">Gói 3</h2>
                        </div>
                        <div class="card-body-vip">
                        <form onSubmit={onSubmit}>
                            <p>Số tháng nâng cấp 6.</p>
                            <p>Giá: 300.000 VNĐ</p>
                            <input type="hidden" value={300000} name="price"></input>
                            <button className="button-submit-vip" type="submit">Mua Ngay</button>
                            </form>
                        </div>
                    </div>

                    <div class="card-vip">
                        <div class="card-header-vip">
                            <h2 className="goi">Gói 4</h2>
                        </div>
                        <div class="card-body-vip">
                            <form onSubmit={onSubmit}>
                            <p>Số tháng nâng cấp 12.</p>
                            <p>Giá: 600.000 VNĐ</p>
                            <input type="hidden" value={600000} name="price"></input>
                            <button className="button-submit-vip" type="submit">Mua Ngay</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
}

export default Vip_Registration;