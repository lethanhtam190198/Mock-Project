import React, { useState, useEffect } from 'react'
import { urlLearn } from '../url/urlTest'
import { useParams } from 'react-router-dom';
import { useSelector } from 'react-redux';
import axios from 'axios';
import './LearnView.css'
import { GlobalDelimiter } from '../url/urlTest';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';

export default function LearnView() {
  const token = useSelector(state => state.loginReducer.token);
  const learn = urlLearn;
  const { classes, Lsubject, course } = useParams();
  const [question, setListQuestion] = useState([]);
  const [currentQuestion, setCurrentQuestion] = useState([]);
  const [answer, setAnswer] = useState([]);
  const [page, setPage] = useState(0);
  const [error, setError] = useState("");
  const [flipped, setFlipped] = useState(false);
  const [isHovered, setIsHovered] = useState(false);
  const [show, setShow] = useState(false);
  const delimiter = GlobalDelimiter;
  const handleHover = () => {
    setIsHovered(!isHovered);
  };

  const handleClick = () => {
    setFlipped(!flipped);
  };

  const handleTransitionEnd = () => {
    setIsHovered(false);
  };
  useEffect(() => {
    axios.get(`${learn}/getquestioncourse?u=${course}`, {
      headers: {
        "Authorization": token
      }
    }).then(resp => {
      console.log(resp.data)
      console.log(resp.data.length)
      if (resp.data.length === 0) {
        setError("Không tồn tại câu hỏi nào trong khóa học này!");
      }
      else {
        setListQuestion(resp.data);
        setPage(1);
        setCurrentQuestion(resp.data.slice(0, 1));

      }
    });
  }, []);
  useEffect(() => {
    setAnswer(currentQuestion[0]?.trueAnswer.split(delimiter).concat(currentQuestion[0]?.falseAnswer.split(delimiter)).sort(() => Math.random() - 0.5));
  }, [currentQuestion]);
  function handleLeftPage() {
    if (flipped) {
      setFlipped(!flipped)
    }
    if (page > 1) {
      setCurrentQuestion(question.slice(page - 2, page - 1))
      setPage(page - 1)
    }
    if (page == 1) {
      setCurrentQuestion(question.slice(0, 1))
    }
  }
  function handleRightPage() {
    if (flipped) {
      setFlipped(!flipped)
    }
    if (page < question.length) {
      setCurrentQuestion(question.slice(page, page + 1))
      setPage(page + 1)
    }
    if ((page) == question.length) {
      setCurrentQuestion(question.slice(question.length - 1, question.length))
    }
  }
  function handleReport() {
    axios.get(`${learn}/report?re=${currentQuestion[0].id}`, {
      headers: {
        "Authorization": token
      }
    })
    handleClose();
  }
  function handleShow() {
    setShow(true);
  }
  function handleClose() {
    setShow(false);
  }
  return (

    <div>
      <div className="flashcard" style={{ marginTop: '2rem' }}>
        <div className='container_f'>
          <div className={`flip_box${flipped ? ' flipped' : ''}`}>
            <div className='front'>
              <p className='f_title'>{error}{currentQuestion[0]?.content}</p>
              {answer?.map((item) =>
                <p className='f_answer'>{item.substring(1)}</p>
              )}
            </div>

            <div className='back'>
              {currentQuestion[0]?.trueAnswer.split(delimiter)?.map((item) =>
                <p className="b_question">{item.substring(1)}</p>
              )}
            </div>
          </div>
          <div className="r_wrap">
            <div className={`b_round${isHovered ? ' b_round_hover' : ''}`}></div>
            <div
              className={`s_round${isHovered ? ' s_round_hover' : ''}${flipped ? ' s_round_back' : ''}`}
              onMouseEnter={handleHover}
              onMouseLeave={handleHover}
              onClick={handleClick}
              onTransitionEnd={handleTransitionEnd}
            >
              <div className={`s_arrow${flipped ? ' s_arrow_rotate' : ''}`}></div>
            </div>
          </div>
        </div>

        <button className="button_r" variant="primary" onClick={handleShow}>
          <svg viewBox="0 0 64 512" fill="currentColor" height="16" width="16" xmlns="http://www.w3.org/2000/svg" className="svgIcon">
            <path d="M64 64c0-17.7-14.3-32-32-32S0 46.3 0 64V320c0 17.7 14.3 32 32 32s32-14.3 32-32V64zM32 480a40 40 0 1 0 0-80 40 40 0 1 0 0 80z" />
          </svg>
        </button>
        <Modal show={show} onHide={handleClose}>
          <Modal.Header closeButton>
            <Modal.Title>Xác nhận báo cáo</Modal.Title>
          </Modal.Header>
          <Modal.Body>Bạn có xác nhận báo cáo câu {currentQuestion[0]?.content} không?</Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={handleClose}>
              Hủy
            </Button>
            <Button variant="primary" onClick={handleReport} style={{ backgroundColor: 'red', borderColor: 'red' }}>
              Xác Nhận
            </Button>
          </Modal.Footer>
        </Modal>
        <div className="d-flex justify-content-end" style={{ marginTop: '2rem', marginRight: '7px', marginLeft: '51rem' }}>
          <button className="button_f" onClick={(e) => {
            e.preventDefault();
            window.location.href = 'http://localhost:3000/class/' + classes + '/Lsubject/' + Lsubject + '/';
          }}>Thoát</button>
        </div>
      </div>
      <div className="d-flex justify-content-center" style={{ marginTop: '-4rem' }}>
        <button className="paginate left" onClick={handleLeftPage}><i></i><i></i></button>
        <div className="counter">{page + "/" + question.length}</div>
        <button className="paginate right" onClick={handleRightPage}><i></i><i></i></button>
      </div>
      <div className="group_question">
        <p className="group_question_title">Các câu hỏi có trong bài học này:</p>
        {question.map((item) =>
          <div className="card_t">
            <p className="card_title">{item.content}</p>
          </div>
        )}
      </div>
    </div>
  )
}