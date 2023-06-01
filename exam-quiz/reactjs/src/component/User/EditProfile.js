import React, { useEffect, useState } from 'react'
// import { useLocation } from "react-router-dom";
import '../User/EditProfileStyle.css'
import {/* useDispatch,*/ useSelector, } from 'react-redux'
// import rightBg from '../../images/v978-background-02.jpg'
import { urlLoad } from '../url/urlTest';

import { storage } from "../User/common/firebase";
import { ref, uploadBytes, getDownloadURL, listAll, } from "firebase/storage";
import { v4 } from "uuid";
import axios from 'axios';
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { useNavigate } from "react-router-dom";

const EditProfile = () => {
    const navigate = useNavigate();
    const dataUser = useSelector(state => state.loginReducer);
    const [dataLoad, setDataLoad] = useState([])
    const token = useSelector(state => state.loginReducer.token);


    useEffect(() => {
        axios.get(`${urlLoad}/${dataUser.username}`, {
            headers: {
                "Authorization": token
            }
        }).then(resp => {
            setDataLoad(resp.data);
        });
    }, []);

    const [imgUpload, setImgUpload] = useState(null);
    const [inputImg, setInputImg] = useState("");
    const [imageUrls, setImageUrls] = useState([]);

    const imagesListRef = ref(storage, "images/");

    const uploadImg = (event) => {
        if (event.target.files[0]) {
            setImgUpload(event.target.files[0]);
            setInputImg(URL.createObjectURL(event.target.files[0]));
        }
    };

    const uploadFile = () => {
        if (imgUpload == null) return;
        const imageRef = ref(storage, `images/${imgUpload.name + v4()}`);

        uploadBytes(imageRef, imgUpload).then((snapshot) => {
            getDownloadURL(snapshot.ref).then((url) => {
                setDataLoad({ ...dataLoad, avatar: url });
            });
        });
    };

    useEffect(() => {
        listAll(imagesListRef).then((response) => {
            response.items.forEach((item) => {
                getDownloadURL(item).then((url) => {
                    setImageUrls((prevUrls) => [...prevUrls, url]);
                });
            });
        });
    }, []);

    const handleSubmit = (event) => {
        event.preventDefault();
        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(dataLoad),
            redirect: 'follow'
        };

        fetch("http://localhost:8080/public/editProfile/edit", requestOptions)
            .then(response => response.text())
            .then((result) => {
                toast.success("Cập nhật thông tin thành công!");
                window.location.reload();
            })
          .catch(error => toast.success("Cập nhật thất bại!"));
    }

    return (
        <React.Fragment>
            <div className='space-top'></div>
            <div className="container DatHD7">
                <br />
                <br />
                <div className="row DatHD7" id="main" style={{
                    backgroundColor: '#94D6C2', width: "28rem",
                    height: "90vh",
                }}>
                    <div className="col-md-4 well DatHD7" id="leftPanel DatHD7" style={{ display: 'contents' }}>
                        <div className="row DatHD7">
                            <div className="col-md-12 DatHD7">
                                <div style={{
                                    padding: "3rem", marginTop: "2rem"
                                }}>
                                    {dataLoad.avatar ? (
                                        <img style={{ width: "400px", height: "400px", backgroundImage: "cover", borderRadius: "50%", border: "solid" }}
                                            src={dataLoad.avatar} />) : (
                                        <img style={{ width: "400px", height: "400px", backgroundImage: "cover", borderRadius: "50%", border: "solid" }}
                                            src={inputImg} />
                                    )
                                    }
                                    <input className='form-control' style={{marginTop:'10px'}}
                                        type="file"
                                        onClick={uploadFile}
                                        // multiple
                                        onChange={(event) => {
                                            uploadImg(event);
                                        }}
                                    />
                                    <button style={{ borderRadius:"10px",marginTop: "1rem", width: "50%", height: "50px", backgroundColor: "rgb(90, 112, 250)", marginTop: "30px", color: "white" }} onClick={uploadFile}> Thay đổi ảnh đại diện</button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="col-md-8 well DatHD7" id="rightPanel DatHD7" style={{ backgroundColor: "lightyellow", marginLeft: '1rem', backgroundSize: '100%' }}>
                    <div className="row DatHD7">
                        <div className="col-md-12 DatHD7" style={{
                            marginTop: "7rem",
                            padding: "3rem",
                        }}>
                            <form onSubmit={handleSubmit}>
                                <h2>
                                    Thay đổi thông tin cá nhân
                                </h2>
                                <hr className="colorgraph DatHD7" />
                                <div style={{ display: "none" }}>
                                    <label htmlFor="username">Username</label>
                                    <div className="form-group DatHD7">
                                        <input
                                            type="text"
                                            name=" "
                                            id="username"
                                            className="form-control input-lg DatHD7"
                                            tabIndex="4"
                                            value={dataUser.username}
                                            onChange={(event) => setDataLoad({ ...dataLoad, username: event.target.value })}
                                        />
                                    </div>
                                </div>
                                <div className="row DatHD7">
                                    <div className="col-xs-12 col-sm-6 col-md-6 DatHD7">
                                        <label htmlFor="parentName">Tên bố mẹ</label>
                                        <div className="form-group DatHD7">
                                            <input
                                                type="text"
                                                name="parentName"
                                                id="parentName"
                                                className="form-control input-lg DatHD7"
                                                tabIndex="1"
                                                value={dataLoad.nameOfParent}
                                                onChange={(event) => setDataLoad({ ...dataLoad, nameOfParent: event.target.value })}
                                            />
                                        </div>
                                    </div>
                                    <div className="col-xs-12 col-sm-6 col-md-6 DatHD7">
                                        <label htmlFor="childrenName">Tên của bé</label>
                                        <div className="form-group DatHD7">
                                            <input
                                                type="text"
                                                name="childrenName"
                                                id="childrenName"
                                                className="form-control input-lg DatHD7"
                                                tabIndex="2"
                                                value={dataLoad.nameOfStudent}
                                                onChange={(event) => setDataLoad({ ...dataLoad, nameOfStudent: event.target.value })}
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <label htmlFor="email">Địa chỉ email</label>
                                    <div className="form-group DatHD7">
                                        <input
                                            type="email"
                                            name="email"
                                            id="email"
                                            className="form-control input-lg DatHD7"
                                            tabIndex="4"
                                            value={dataLoad.email}
                                            readOnly
                                        />
                                    </div>
                                </div>
                                <div>
                                    <label htmlFor="phone">Số điện thoại</label>
                                    <div className="form-group DatHD7">
                                        <input
                                            type="text"
                                            name="phone"
                                            id="phone"
                                            className="form-control input-lg DatHD7"
                                            placeholder="Số điện thoại"
                                            tabIndex="4"
                                            value={dataLoad.phone}
                                            onChange={(event) => setDataLoad({ ...dataLoad, phone: event.target.value })}
                                        />
                                    </div>
                                </div>
                                <hr className="colorgraph DatHD7" />
                                <div className="row DatHD7">
                                    <div className="col-xs-12 col-md-6 DatHD7"></div>
                                    <div className="col-xs-12 col-md-6 DatHD7">
                                        <button
                                            style={{ width: "100%", backgroundColor: "rgb(90, 112, 250)" }}
                                            type="submit"
                                            className="button boxed-btn namnb6_2"
                                        >
                                            {" "}
                                            Cập nhật{" "}
                                        </button>{" "}
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    )
}

export default EditProfile