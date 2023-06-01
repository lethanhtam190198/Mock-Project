import React, { useEffect, useState } from "react";
import { Outlet, Link, useNavigate } from "react-router-dom";
import "./list.css";
import "./statistics.css";
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import axios from 'axios';
import { urlQuestions } from "../url/urlTest";
function ListQuestion() {
  const listQuestion = urlQuestions;
  const [questionList, setQuestionList] = useState([]);
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  useEffect(() => {
    axios.get(listQuestion).then(resp => {
        setQuestionList(resp.data);
      
    });
}, []);

  return (
    <React.Fragment>
      <h1 style={{color: "#290b75; text-align: center"}}>Danh Sách Câu Hỏi</h1>
        <div className="row" >
        <div className="p-3 border__bottom" >
           <button className="custom-btn btn-1">	<Link to="/admin/createQuestion"> Thêm mới câu hỏi</Link></button>
        </div >
            <table className="table table-hover">
              <thead>
                <tr>
                  <th style={{width:"5%"}}>STT</th>
                  <th style={{width:"75%"}}>Câu hỏi</th>
                  <th style={{width:"20% ;"}} >Chức năng</th>
                </tr>
              </thead>
  
              <tbody>
              {questionList
                ? questionList.map((data) => (
                    <tr key={data.id}>
                      <td>{data.id}</td>
                      <td>{data.content}</td>
                    
                      <td ><button className=" btn btn-success m-2 list" ><i className="fa-solid fa-pen-to-square"></i></button>
                    <button className=" btn btn-danger" type="button"  data-toggle="modal" data-target="#exampleModal"><i className="fa-solid fa-trash"></i></button></td>
               
                    </tr>
                  ))
                : "null"} 
                 
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
          <Modal show={show} onHide={handleClose} animation={false}>
        <Modal.Header closeButton>
          <Modal.Title>Danh sách câu hỏi</Modal.Title>
        </Modal.Header>
        <Modal.Body>Bạn chắc chắn muốn xoá câu hỏi này!</Modal.Body>
        <Modal.Footer>
        <Button className=" custom-btn-2 btn-5" onClick={handleClose}>Quay lại</Button>
          <Button className=" custom-btn-2 btn-3" onClick={handleClose}>
            Xoá
          </Button>
        </Modal.Footer>
      </Modal>
      
    </React.Fragment>
  );
}
export default ListQuestion;
