import React, { useEffect, useState } from 'react'
import { urlLogin } from '../url/urlTest'
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { login } from '../../action/actionLogin';
import "./NghiaTH11Login.css"
import { Link } from 'react-router-dom'

export default function LoginForm() {
    const loginUrl = urlLogin;
    const [valid, setValid] = useState("");
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const onSubmit = (event) => {
        event.preventDefault();
        let formData = Object.fromEntries(new FormData(event.target));
        axios.post(loginUrl, formData, {
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(resp => {
            dispatch(login(resp.data));
            navigate("/");
            window.location.reload();

        }).catch(error => {
            setValid("Sai Email hoặc mật khẩu!")
        })

    }

    return (
        <React.Fragment>
            <div className="sign-in-htm">
                <form onSubmit={onSubmit}>
                    <h2>Chào mừng trở lại !</h2><br />
                    <div className="group">
                        <label for="user" className="label">Email</label>
                        <input id="user" type="text" className="input-login" name='username' />
                        <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp;</p>
                    </div>
                    <div className="group">
                        <label for="pass" className="label">Password</label>
                        <input id="pass" type="password" className="input-login" data-type="password" name='password' />
                    </div>
                    <p className='valid-login'>{valid}</p>
                    <div className="group">
                        <input type="submit" className="button" value="Đăng Nhập" />
                    </div>
                    <div className="hr"></div>
                    <Link
                        role="button"
                        to='/forgot-password'
                        as={Link}
                    >
                        Quên Mật khẩu
                    </Link>
                </form>
            </div>
        </React.Fragment>
    )
}
