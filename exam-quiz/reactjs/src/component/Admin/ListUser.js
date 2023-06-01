import React, { useEffect, useState } from "react";
import { Outlet, Link, useNavigate } from "react-router-dom";
import "./list.css";
import "./statistics.css";
import axios from 'axios';
import { urlQuestions } from "../url/urlTest";
function ListUser() {
  const listQuestion = urlQuestions;
  const [questionList, setQuestionList] = useState([]);
  useEffect(() => {
    axios.get(listQuestion).then(resp => {
        setQuestionList(resp.data);
      
    });
}, []);

  return (
    <React.Fragment>
        
        <h1 style={{color: "#290b75; text-align: center"}}>Danh Sách Người Dùng</h1>
        <div className="row m-5" >
        
            <table className="table table-hover">
              <thead>
                <tr>
                  <th style={{width:"5%"}}>STT</th>
                  <th style={{width:"75%"}}>Tên người dùng</th>
                  <th style={{width:"20%"}}>Chức năng</th>
                </tr>
              </thead>
  
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Lê Thanh Tâm </td>
                  <td ><button class=" btn btn-secondary m-2"type="button"  data-toggle="modal" data-target="#exampleModal" ><i class="fa-solid fa-user-lock"></i></button>
                    <button class=" btn btn-success"type="button"  data-toggle="modal" data-target="#exampleModal1"><i class="fa-solid fa-unlock"></i></button></td>
                  </tr>
                <tr>
                  <td>2</td>
                  
                  <td>Nguyễn Thị Thanh Trang </td>
                  
                  <td ><button class=" btn btn-secondary m-2 "type="button"  data-toggle="modal" data-target="#exampleModal" ><i class="fa-solid fa-user-lock"></i></button>
                    <button class=" btn btn-success"type="button"  data-toggle="modal" data-target="#exampleModal1"><i class="fa-solid fa-unlock"></i></button></td>
                   </tr>
                <tr>
                  <td>3</td>
                  
                  <td>Lê Ngọc Tuấn</td>
                  
                  <td ><button class=" btn btn-secondary m-2"type="button"  data-toggle="modal" data-target="#exampleModal" ><i class="fa-solid fa-user-lock"></i></button>
                    <button class=" btn btn-success"type="button"  data-toggle="modal" data-target="#exampleModal1"><i class="fa-solid fa-unlock"></i></button></td>
                  </tr>
                <tr>
                  <td>4</td>
                  
                  <td>Trần Thị Thanh Nga </td>
                  
                  <td ><button class=" btn btn-secondary m-2 "type="button"  data-toggle="modal" data-target="#exampleModal" ><i class="fa-solid fa-user-lock"></i></button>
                    <button class=" btn btn-success"type="button"  data-toggle="modal" data-target="#exampleModal1"><i class="fa-solid fa-unlock"></i></button></td>
                   </tr>
                <tr>  </tr>
                <tr>
                    <td>5</td>
                    
                    <td>Trương Hữu Nghĩa</td>
                    
                    <td ><button class=" btn btn-secondary m-2 "type="button"  data-toggle="modal" data-target="#exampleModal" ><i class="fa-solid fa-user-lock"></i></button>
                    <button class=" btn btn-success"type="button"  data-toggle="modal" data-target="#exampleModal1"><i class="fa-solid fa-unlock"></i></button></td>
                   </tr>
                <tr> </tr>
                  <tr>
                    <td>6</td>
                    
                    <td>Hồ Đắc Đạt</td>
                    <td ><button class=" btn btn-secondary m-2"type="button"  data-toggle="modal" data-target="#exampleModal" ><i class="fa-solid fa-user-lock"></i></button>
                    <button class=" btn btn-success"type="button"  data-toggle="modal" data-target="#exampleModal1"><i class="fa-solid fa-unlock"></i></button></td>
                   </tr>
                <tr> </tr>
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
      
     <div className="modal fade" id="exampleModal" tabIndex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div className="modal-dialog" role="document">
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title" id="exampleModalLabel">Danh sách người dùng</h5>
              <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div className="modal-body">
              Bạn chắc chắn muốn chặn người dùng này ?
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-dismiss="modal">Quay lại</button>
              <button type="button" className="btn btn-danger">Chặn</button>
            </div>
          </div>
        </div>
      </div>
      <div className="modal fade" id="exampleModal1" tabIndex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div className="modal-dialog" role="document">
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title" id="exampleModalLabel">Danh sách người dùng</h5>
              <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div className="modal-body ">
              
                    Bạn chắc chắc muốn bỏ chặn người dùng này ?
                  
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-dismiss="modal">Quay lại</button>
              <button type="button" className="btn btn-danger">Bỏ chặn</button>
            </div>
          </div>
        </div>
      </div>
 
    </React.Fragment>
  );
}
export default ListUser;
