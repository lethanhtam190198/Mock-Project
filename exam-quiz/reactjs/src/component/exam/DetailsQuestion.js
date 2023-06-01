import React, { useEffect, useState } from 'react'
import { GlobalDelimiter } from '../url/urlTest';

export default function DetailsQuestion(props) {
    const [answers, setAnswer] = useState([]);
    const delimiter = GlobalDelimiter;
    useEffect(() => {
  
        setAnswer(props.question.trueAnswer.split(delimiter)
            .concat(props.question.falseAnswer.split(delimiter))
            .sort(() => Math.random() - 0.5));
    }, []);

    function checkWrongSelectAnswer(answer, itemCheck) {
        return answer.split(",").some(x => x.substring(0, 1).toUpperCase() === "F" && x === itemCheck.split(",")[0] );
    }
    function checkTrueSelectAnswer(answer, itemCheck) {
        return answer.split(",").some(x => x.substring(0, 1).toUpperCase() === "T" && x === itemCheck.split(",")[0] );
    }
    return (
        <div>
            <button type="button" className="btn btn-outline-info showButton" data-bs-toggle="modal" data-bs-target={`#exampleModal${props.id}`}>
                <i class="fa-solid fa-exclamation"></i>
            </button>
            <div className="modal fade" id={`exampleModal${props.id}`} tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div className="modal-dialog">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Chi tiết câu hỏi</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div className="modal-body">
                            Nội dung câu hỏi:
                            <div>
                                {props.question.title}
                            </div>
                            {
                            answers.map(item =>
                                <p key={item}
                                    style={checkWrongSelectAnswer(props.answer, item)
                                        && props.answer.includes(item.substring(0, 1))
                                        ? { background: "red" }
                                        : checkTrueSelectAnswer(props.answer, item)
                                            && props.answer.includes(item.substring(0, 1))
                                            ?
                                            { background: "green" }
                                            : { background: "white" }}>
                                    {item.substring(1)}
                                </p>)
                                }
                        </div>
                        <div className="modal-footer">
                            <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Xem xong</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
