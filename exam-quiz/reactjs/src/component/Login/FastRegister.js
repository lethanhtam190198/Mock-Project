import React, { useState } from 'react'
import "./NghiaTH11Login.css"
import { urlRegister } from '../url/urlTest';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { login } from '../../action/actionLogin';

const initFormValue = {
    parentName: "",
    childrenName: "",
    phone: "",
    email: "",
    password: "",
    confirmPassword: "",
};

const isEmptyValue = (value) => {
    return !value || value.trim().length < 1;
};

const isEmailValid = (email) => {
    return /^[a-zA-Z0-9]+@+[a-zA-Z0-9]+.+[A-z]/.test(email);
}

export default function FastRegister() {

    const [formValue, setFormValue] = useState(initFormValue);
    const [formError, setFormError] = useState({});

    const handleChange = (event) => {
        console.log(event.target);
        const { value, name } = event.target;
        setFormValue({
            ...formValue,
            [name]: value,
        });
    }

    const validateForm = () => {
        const error = {};

        if (isEmptyValue(formValue.parentName)) {
            error["parentName"] = "Trường này không được trống";
        }
        if (isEmptyValue(formValue.childrenName)) {
            error["childrenName"] = "Trường này không được trống";
        }
        if (isEmptyValue(formValue.phone)) {
            error["phone"] = "Trường này không được trống";
        }
        if (isEmptyValue(formValue.email)) {
            error["email"] = "Trường này không được trống";
        } else {
            if (!isEmailValid(formValue.email)) {
                error["email"] = "Email không đúng định dạng"
            }
        }
        if (isEmptyValue(formValue.password)) {
            error["password"] = "Trường này không được trống";
        }
        if (isEmptyValue(formValue.confirmPassword)) {
            error["comfirmPassword"] = "Trường này không được trống";
        } else if (formValue.confirmPassword !== formValue.password) {
            error["comfirmPassword"] = "Mật Khẩu không trùng khớp"
        }

        setFormError(error);

        return Object.keys(error).length === 0;

    }

    let register = urlRegister;
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const [valid, setValid] = useState("");
    const onSubmit = (event) => {
        event.preventDefault();
        let formData = Object.fromEntries(new FormData(event.target));
        axios.post(register, formData, {
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(resp => {
            dispatch(login(resp.data));
            navigate("/");
        }).catch(error => {

            setValid("Email đã được sử dụng!");
        });
        if (validateForm()) {
            console.log("form value", formValue)
        } else {
            console.log("form invalue", formValue);

        }

    }


    return (
        <React.Fragment>
            <div className='space-top'></div>
            <div>
                <div className='login-body'>
                    <div className='login-wrap'>
                        <div className="login-html">
                            <input id="tab-2" type="radio" name="tab" className="sign-up" checked />
                            <label for="tab-2" className="tab">Đăng ký nhanh</label>
                            <div className="login-form">
                                <div className="sign-up-htm">
                                    <form onSubmit={onSubmit}>
                                        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                                            <div className="group" style={{ width: '45%' }}>
                                                <label className="label">Tên phụ huynh</label>
                                                <input
                                                    type="text"
                                                    id='parentName'
                                                    className="input-login"
                                                    name="parentName"
                                                    value={formValue.nameParent}
                                                    onChange={handleChange} />
                                                <p style={{ margin: "0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; {formError.parentName}</p>
                                            </div>
                                            <div style={{ width: '50%' }} className="group">
                                                <label className="label">Tên học sinh</label>
                                                <input
                                                    type="text"
                                                    id='childrenName'
                                                    className="input-login"
                                                    name='childrenName'
                                                    value={formValue.nameStudent}
                                                    onChange={handleChange} />
                                                <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; {formError.childrenName}</p>
                                            </div>
                                        </div>
                                        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                                            <div style={{ width: '40%' }} className="group">
                                                <label className="label">Số điện thoại</label>
                                                <input
                                                    type="text"
                                                    className="input-login"
                                                    id='phone'
                                                    name='phone'
                                                    value={formValue.phone}
                                                    onChange={handleChange} />
                                                <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; {formError.phone}</p>
                                            </div>
                                            <div style={{ width: '55%' }} className="group">
                                                <label className="label">Email</label>
                                                <input
                                                    type="text"
                                                    id='email'
                                                    className="input-login"
                                                    name='email'
                                                    value={formValue.email}
                                                    onChange={handleChange} />
                                                <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; {formError.email}{valid}</p>
                                            </div>
                                        </div>
                                        <div className="group">
                                            <label className="label">Mật khẩu</label>
                                            <input
                                                type="password"
                                                id='password'
                                                className="input-login"
                                                name='password'
                                                value={formValue.password}
                                                onChange={handleChange} />
                                            <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; {formError.password}</p>
                                        </div>
                                        <div className="group">
                                            <label className="label">Nhập lại mật khẩu</label>
                                            <input
                                                type="password"
                                                id='comfirm-password'
                                                className="input-login"
                                                name='confirmPassword'
                                                value={formValue.confirmPassword}
                                                onChange={handleChange}
                                            />
                                            <p style={{ margin: "0px 5px 10px 0px", color: 'red', fontSize: "15px" }} className="error-feedback"> &nbsp; {formError.comfirmPassword}</p>
                                        </div>
                                        <div className="group">
                                            <input type="submit" className="button" value="Đăng ký" />
                                        </div>
                                        <div className="hr"></div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    )
}
