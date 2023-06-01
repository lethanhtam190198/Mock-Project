import React, { useEffect, useState } from "react";
import { Outlet, Link, useNavigate } from "react-router-dom";
import "./list.css";
import "./statistics.css";
import axios from 'axios';
import { urlQuestions } from "../url/urlTest";
function Statistics() {
  const listQuestion = urlQuestions;
  const [questionList, setQuestionList] = useState([]);
  useEffect(() => {
    axios.get(listQuestion).then(resp => {
        setQuestionList(resp.data);
      
    });
}, []);

  return (
    <React.Fragment>
      <h1 style={{color: "#290b75; text-align: center"}}>Your Smile Thống Kê</h1>
        <div className="row" style={{marginLeft:"80px"}}>
        <div className="card m-5" >
           <h3 className="title p-3">Doanh thu</h3>
            <h6 className="description">Tổng số doanh thu của trang là</h6>
            <div className="rating "></div>
            <a href="#" className="link">689.982.000 VND</a>
          </div>
          <div className="card m-5" >
           <h3 className="title p-3">Người dùng</h3>
             <h6 className="description">Tổng số người dùng  là</h6>
            
            <div className="rating"></div>
            <a href="#" className="link">653.455 Người</a>
          </div>
          <div className="card m-5 ">        
            <h3 className="title p-3">Người dùng vip</h3>
            <h6 className="description">Tổng số người dùng vip là</h6>

            <div className="rating"></div>
            <a href="#" className="link">8.980 Người</a>
          </div>
        </div>
    </React.Fragment>
  );
}
export default Statistics;
