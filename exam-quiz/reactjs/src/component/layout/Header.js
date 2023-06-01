import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import "./header.css"
import { useDispatch, useSelector } from 'react-redux'
import { logout } from '../../action/actionLogin';
import { urlNameVip } from '../url/urlTest';
import axios from 'axios';
import { urlLoad } from '../url/urlTest';


export default function Header() {
    const dataUser = useSelector(state => state.loginReducer);
    const token = useSelector(state => state.loginReducer.token);
    const urlName = urlNameVip;
    const [dataVip, setDataVip] = useState([]);
    const [dataAvatar, setdataAvatar] = useState([]);
    const urlAvatars= urlLoad;

    const dispatch = useDispatch();

    useEffect(() => {
        axios.get(`${urlName}/${dataUser.username}`, {
            headers: {
                "Authorization": token
            }
        }).then(resp => {
            setDataVip(resp.data);
        });
    }, []);

    useEffect(() => {
        axios.get(`${urlAvatars}/${dataUser.username}`, {
            headers: {
                "Authorization": token
            }
        }).then(resp => {
            setdataAvatar(resp.data);
            setdataAvatar.preventDefault();
        });
    }, []);

    return (
        <React.Fragment>
            <div>
                <div className="header-total">
                    <nav className="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0 logo-header">
                        <Link as={Link} className="navbar-brand" to='/'>
                            <img className="logo-header" src={process.env.PUBLIC_URL + '/images/logo-no-background.png'} />
                        </Link>
                        <button type="button" className="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                            <span className="navbar-toggler-icon"></span>
                        </button>
                        <div className="collapse navbar-collapse" id="navbarCollapse">
                            <div className="navbar-nav mx-auto menu-home">
                                <Link as={Link} className="nav-item nav-link active" to='/'>Trang chủ</Link>

                                <div className="nav-item dropdown">
                                    <a href="#" className="nav-link dropdown-toggle" data-bs-toggle="dropdown">Lớp
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-down" viewBox="0 0 16 16">
                                            <path fillRule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                    </a>
                                    <div className="dropdown-menu rounded-0 rounded-bottom border-1 shadow-sm m-0">
                                        <li> <Link as={Link} className="dropdown-item" to='/class/1' style={{ textDecoration: 'none' }}>Lớp 1</Link></li>
                                        <li> <Link as={Link} className="dropdown-item" to='/class/2' style={{ textDecoration: 'none' }}>Lớp 2</Link></li>
                                        <li> <Link as={Link} className="dropdown-item" to='/class/3' style={{ textDecoration: 'none' }}>Lớp 3</Link></li>
                                        <li> <Link as={Link} className="dropdown-item" to='/class/4' style={{ textDecoration: 'none' }}>Lớp 4</Link></li>
                                        <li> <Link as={Link} className="dropdown-item" to='/class/5' style={{ textDecoration: 'none' }}>Lớp 5</Link></li>
                                    </div>
                                </div>
                                {dataUser?.role === "ROLE_ADMIN" &&
                                    <Link className="nav-item nav-link"> Quản lý câu hỏi</Link>
                                }
                                {dataUser?.role === "ROLE_ADMIN" &&
                                    <Link className="nav-item nav-link"> Thống kê</Link>
                                }
                                {/* <a href="classes.html" className="nav-item nav-link">Thống kê</a> */}
                            </div>
                            {dataUser?.username === undefined &&
                                <React.Fragment>
                                    <Link
                                        role="button"
                                        to='/login'
                                        as={Link}
                                        className="btn btn-danger rounded-pill d-lg-block login-home">
                                        Đăng nhập
                                    </Link>
                                    <Link
                                        role="button"
                                        to='/register'
                                        as={Link}
                                        className="btn btn-primary rounded-pill d-lg-block signin-home">
                                        Đăng Ký
                                    </Link>
                                </React.Fragment>
                            }

                            {dataUser?.username !== undefined && <React.Fragment>
                                <div className="avartar-signin-total">
                                    <div className="nav-item dropdown">
                                        <button className="button-avatar-signin">
                                            <img className="avatar-signin" src={dataAvatar.avatar} />
                                        </button>
                                        <div className="dropdown-menu rounded-bottom shadow-sm mt-1 dropdown-menu-info">

                                            <Link
                                                className=" dropdown-item"
                                                role="button"
                                                to='/editprofile'
                                            >
                                                Thông tin cá nhân
                                            </Link>
                                            {dataUser?.role !== "ROLE_ADMIN" && dataVip[0]?.name !== undefined && <React.Fragment>
                                                <Link
                                                    className="dropdown-item"
                                                    role="button"
                                                    to='/vip-registration'
                                                    as={Link}
                                                >
                                                    Đăng ký Vip
                                                </Link>
                                            </React.Fragment>}
                                            <Link
                                                className=" dropdown-item"
                                                role="button"
                                                to='/login'
                                                onClick={() => dispatch(logout())}
                                            >
                                                Đăng xuất
                                            </Link>
                                        </div>
                                    </div>
                                </div>
                            </React.Fragment>}
                            {dataUser?.username !== undefined && dataVip[0]?.name === undefined && dataUser?.role !== "ROLE_ADMIN" && <React.Fragment>
                                <Link
                                    className="btn btn-primary rounded-pill d-lg-block signin-home "
                                    role="button"
                                    to='/vip-registration'
                                    as={Link}
                                >
                                    Đăng ký Vip
                                </Link>
                            </React.Fragment>}

                        </div>
                    </nav>
                </div>
            </div>
        </React.Fragment>
    )
}
