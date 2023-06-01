import React, { useEffect, useState } from 'react'
import { examList } from '../url/urlTest'
import axios from 'axios';
import CardQuestion from './CardQuestion';
import DisplayClock from '../Clock/DisplayClock';
import { useLocation, useNavigate, useParams } from 'react-router-dom';
import { useSelector } from 'react-redux'
import "./ExamTest.css";
export default function ExamTest() {
    const token = useSelector(state => state.loginReducer.token);
    const exam = examList;
    const { classes, subject } = useParams();
    const navigate = useNavigate();
    const location = useLocation();
    const [questionList, setQuestionList] = useState([]);
    const [answer, setAnswer] = useState(new Map());
    const onSubmit = (event) => {
        event.preventDefault();
        submitExamToServer();
    }

    function handleCheckBox(data) {
        setAnswer(answer.set(data[0], data[1]));
    }

    function submitExamToServer() {
        axios.post(exam, JSON.stringify(Object.fromEntries(answer)), {
            headers: {
                'Content-Type': 'application/json',
                "Authorization": token
            }
        }).then(resp => {
            navigate("/result", {
                state: [resp.data, questionList]
            })
        })
    }

    function timeOutExam() {
        submitExamToServer();
    }

    useEffect(() => {
        if (((location.state - new Date().getTime()) / 1000).toFixed() < 0) {
            navigate("/");
            return;
        }

        axios.get(`${exam}?c=${classes}&s=${subject}`, {
            headers: {
                "Authorization": token
            }
        }).then(resp => {
            setQuestionList(resp.data);
            let map = new Map();
            for (let item of resp.data) {
                map.set(item.id, []);
            }
            setAnswer(map);
        });
    }, []);

    useEffect(() => {
        window.addEventListener("beforeunload", alertUser);
        return () => {
            window.removeEventListener("beforeunload", alertUser);
        };
    }, []);

    const alertUser = (e) => {
        e.preventDefault();
        e.returnValue = "";
    };

    return (
        <div class="container">
            <DisplayClock time={((location.state - new Date().getTime()) / 1000).toFixed()} handleOverTimeExam={timeOutExam} />
            <div>
                <form id="examForm" onSubmit={onSubmit}>
                    {questionList.map((item, index) =>
                        <CardQuestion
                            item={item}
                            index={index + 1}
                            name={item.id}
                            handleCheckBox={(data) => handleCheckBox(data)}
                            key={`question-${item.id}`} />)}
                    <div style={{ display: "flex", justifyContent: "center", marginTop: "5px" }}>
                        <button class="btn btn-success" type="submit">Kết thúc thi</button>
                    </div>
                </form>
            </div >
        </div >
    )
}
