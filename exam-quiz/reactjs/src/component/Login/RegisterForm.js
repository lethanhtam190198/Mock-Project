import React from 'react'
import "./NghiaTH11Login.css"

export default function RegisterForm() {
    return (
        <div>
            <div className="sign-up-htm">
                <form>
                    <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                        <div className="group" style={{ width: '45%' }}>
                            <label htmlFor="user" className="label">Tên phụ huynh</label>
                            <input id="user" type="text" className="input-login" />
                            <p style={{ margin: "0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; validate</p>
                        </div>
                        <div style={{ width: '50%' }} className="group">
                            <label htmlFor="text" className="label">Tên học sinh</label>
                            <input type="text" className="input-login" />
                            <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; validate</p>
                        </div>
                    </div>
                    <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                        <div style={{ width: '40%' }} className="group">
                            <label htmlFor="text" className="label">Số điện thoại</label>
                            <input type="text" className="input-login" />
                            <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; validate</p>
                        </div>
                        <div style={{ width: '55%' }} className="group">
                            <label htmlFor="pass" className="label">Email</label>
                            <input id="pass" type="text" className="input-login" />
                            <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; validate</p>
                        </div>
                    </div>
                    <div className="group">
                        <label htmlFor="pass" className="label">Mật khẩu</label>
                        <input id="pass" type="password" className="input-login" data-type="password" />
                        <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; validate</p>
                    </div>
                    <div className="group">
                        <label htmlFor="pass" className="label">Nhập lại mật khẩu</label>
                        <input id="pass" type="password" className="input-login" />
                        <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; validate</p>
                    </div>
                    <div className="group">
                        <input type="submit" className="button" value="Sign Up" />
                    </div>
                    <div className="hr"></div>

                </form>
            </div>
        </div>
    )
}
