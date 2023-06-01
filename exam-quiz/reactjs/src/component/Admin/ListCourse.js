import React, { useEffect, useState } from "react";
import { Outlet, Link, useNavigate } from "react-router-dom";
import "./list.css";
import "./statistics.css";
import axios from 'axios';
import { urlQuestions } from "../url/urlTest";
function ListCourse() {
  const listQuestion = urlQuestions;
  const [questionList, setQuestionList] = useState([]);
  useEffect(() => {
    axios.get(listQuestion).then(resp => {
        setQuestionList(resp.data);
    });
}, []);

  return (
    <React.Fragment>
      <h1 style={{color: "#290b75; text-align: center"}}>Danh Sách Bài Học</h1>
        <div className="row m-5" >
        
            <table className="table table-hover">
              <thead>
                <tr>
                  <th style={{width:"5%"}}>STT</th>
                  <th style={{width:"55%"}}>Tên chủ đề</th>
                  <th style={{width:"20%"}}>Số lượng bài</th>
                  <th style={{width:"20%"}}>Chức năng</th>
                </tr>
              </thead>
  
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Toán lớp 1: Đếm số </td>
                  <td >212</td>
                  <td ><button className=" btn btn-success m-2" ><i className="fa-solid fa-pen-to-square"></i></button>
                    <button className=" btn btn-danger" type="button"  data-toggle="modal" data-target="#exampleModal"><i className="fa-solid fa-trash"></i></button></td>
               </tr>
                <tr>
                  <td>2</td>
                  
                  <td>Tiếng việt lớp 2 : Đọc diễn cảm </td>
                  <td>342</td>
                  <td ><button className=" btn btn-success m-2" ><i className="fa-solid fa-pen-to-square"></i></button>
                    <button className=" btn btn-danger" type="button"  data-toggle="modal" data-target="#exampleModal"><i className="fa-solid fa-trash"></i></button></td>
                </tr>
                <tr>
                  <td>3</td>
                  
                  <td>Tiếng Anh : Các con vật </td>
                  <td>68</td>
                  <td ><button className=" btn btn-success m-2" ><i className="fa-solid fa-pen-to-square"></i></button>
                    <button className=" btn btn-danger" type="button"  data-toggle="modal" data-target="#exampleModal"><i className="fa-solid fa-trash"></i></button></td>
               </tr>
                <tr>
                  <td>4</td>
                  
                  <td>Toán lớp 2:Hình học </td>
                  <td>65</td>
                  <td ><button className=" btn btn-success m-2" ><i className="fa-solid fa-pen-to-square"></i></button>
                    <button className=" btn btn-danger" type="button"  data-toggle="modal" data-target="#exampleModal"><i className="fa-solid fa-trash"></i></button></td>
                </tr>
              </tbody>
            </table>  
             <nav aria-label="Page navigation example">
            <ul className="pagination">
              
              <li className="page-item"><a className="page-link" href="#">1</a></li>
              <li className="page-item"><a className="page-link" href="#">2</a></li>
              <li className="page-item"><a className="page-link" href="#">3</a></li>
              <li className="page-item">
                <a className="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                  <span className="sr-only">Next</span>
                </a>
              </li>
            </ul>
          </nav>
          </div>  
       
    </React.Fragment>
  );
}
export default ListCourse;
