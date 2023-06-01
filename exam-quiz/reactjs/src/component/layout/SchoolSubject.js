import React from 'react'
import { Link } from 'react-router-dom'
import "./SchoolSubject.css"


export default function SchoolSubject() {
    const time = new Date().getTime() + (10 * 60 * 1000);
    return (
        <div style={{marginTop:100}}>
            <div className="group-card">
                <div className="card-school">
                    <div className="card-details">
                        <p className="text-title">Toán</p>
                        <img className="card-img-top" alt="" src={"../image-toan.jpg"} />
                    </div>
                    <div className="group-button">
                        <button className="card-button1"><Link as={Link} className="navbar-brand1" to="subject/1" state={time}>Thi</Link></button>
                        <button className="card-button2"><Link as={Link} className="navbar-brand2" to="Lsubject/1">Học</Link></button>
                    </div>
                </div>
                <div className="card-school">
                    <div className="card-details">
                        <p className="text-title">Tiếng Việt</p>
                        <img className="card-img-top" alt="" src={"../image-viet.jpg"} />
                    </div>
                    <div className="group-button">
                        <button className="card-button1"><Link as={Link} className="navbar-brand1" to="subject/2" state={time}>Thi</Link></button>
                        <button className="card-button2"><Link as={Link} className="navbar-brand2" to="Lsubject/2">Học</Link></button>
                    </div>
                </div>
                <div className="card-school">
                    <div className="card-details">
                        <p className="text-title">Tiếng Anh</p>
                        <img className="card-img-top" alt="" src={"../image-anh.jpg"} />
                    </div>
                    <div className="group-button">
                        <button className="card-button1"><Link as={Link} className="navbar-brand1" to="subject/3" state={time}>Thi</Link></button>
                        <button className="card-button2"><Link as={Link} className="navbar-brand2" to="Lsubject/3">Học</Link></button>
                    </div>
                </div>
            </div>
        </div >
    )
}
