import React, { useState, useEffect, useRef } from 'react'
import { urlLearn } from '../url/urlTest'
import { useParams } from 'react-router-dom';
import { useSelector } from 'react-redux';
import axios from 'axios';
import { Link } from 'react-router-dom'
import './LearnListCourse.css'
export default function LearnListCourse() {
    const token = useSelector(state => state.loginReducer.token);
    const dataUser = useSelector(state => state.loginReducer);
    const learn = urlLearn;
    const textInput = useRef();
    const [error, setError] = useState("");
    const { classes, Lsubject } = useParams();
    const [course, setListCourse] = useState([]);
    useEffect(() => {
        axios.get(`${learn}?c=${classes}&s=${Lsubject}&user=${dataUser.username}`, {
            headers: {
                "Authorization": token
            }
        }).then(resp => {
            if (resp.data.length == 0) {
                setError("Không tồn tại khóa học nào cả!")
            }
            else {
                setError("")
            }
            setListCourse(resp.data);
        });
    }, []);
    function handleSearch() {
        axios.get(`${learn}/search?c=${classes}&s=${Lsubject}&search=${textInput.current.value}`, {
            headers: {
                "Authorization": token
            }
        }).then(resp => {
            if (resp.data.length == 0) {
                setError("Không tồn tại khóa học nào cả!")
            }
            else {
                setError("")
            }
            setListCourse(resp.data);
        });
    }
    return (
        <div>
            <div className="d-flex justify-content-end" style={{ marginTop: '7rem', marginRight: '10rem' }}>
                <div className="d-flex" style={{ width: '20%' }}>
                    <input type="search" className="form-control rounded" ref={textInput} placeholder="Tìm kiếm bài học" aria-label="Search" aria-describedby="search-addon" />
                    <span className="input-group-text border-0" id="search-addon">
                        <svg onClick={handleSearch} xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                        </svg>
                    </span>
                </div>
            </div>
            <div className="container1" style={{ marginTop: '55px' }}>
                <p className='erroroutput'>{error}</p>
                <div className="row row-cols-2" style={{ alignItems: 'center', 'justifyContent': 'center' }}>
                    {course.map((item) =>
                        <div className="cookie-card">
                            <span className="title">{item.name}</span>
                            <p className="description">Làm những bài tập thú vị về {item.name}. </p>
                            <div className="actions">
                                <button className="accept btn"><Link style={{ textDecoration: 'none', color: 'white' }} as={Link} to={"course/" + item.id}>Vào Học</Link></button>
                            </div>
                        </div>
                    )}
                </div>
            </div>

        </div>
    )
}
