import React from "react";
import "./successpayment.css";
import { Link } from 'react-router-dom'

function SuccessPayment() {
    return (
        <>
            <div style={{marginTop:50}} className="body-pay-success">
                <div className="card-pay-succces">
                    <div className="circle">
                        <i className="checkmark">✓</i>
                    </div>
                    <h1 className="h1-pay-success">Bạn đã thanh toán thành công</h1>
                    <p className="title-pay-succces">Chúng tôi xin chân thành cảm ơn<br />sự đúng góp của bạn!</p>
                    <Link
                        role="button"
                        to='/'
                        as={Link}
                        className="btn btn-success">
                        Trở về trang chủ
                    </Link>
                </div>
            </div>
        </>
    )
}

export default SuccessPayment;