import React, { useEffect, useState } from 'react'
import CheckBox from '../layout/CheckBox';
import Radio from '../layout/Radio';
import { GlobalDelimiter } from '../url/urlTest';

export default function CardQuestion(props) {
    const [state, setState] = useState([]);
    const delimiter = GlobalDelimiter;
    const [type, setType] = useState("one true answer");
    const handleState = (data) => {
        props.handleCheckBox(data);
    }

    useEffect(() => {
        if (props.item.trueAnswer.includes(delimiter)) {
            setType("more true answer");
        }
        setState(props.item.trueAnswer.split(delimiter).concat(props.item.falseAnswer.split(delimiter)).sort(() => Math.random() - 0.5));
        console.log(state);
    }, []);

    return (
        <div>
            <fieldset className="border p-2 card-question-tam">
                <legend className="float-none w-auto p-2 title-question-tam">Câu hỏi {props.index}:</legend>
                <div className="container-question">
                    <div className=" wrap-item-left">{props.item.title} </div>

                    <div className="warp-item-right">
                        <table>
                            <tbody>
                                {type === "more true answer" && <CheckBox
                                    state={state}
                                    id={props.item.id}
                                    handleState={(e) => handleState(e)}
                                />}
                                {type === "one true answer" && <Radio
                                    id={props.item.id}
                                    list={state}
                                    handleState={(e) => handleState(e)}
                                />}
                            </tbody>

                        </table>
                    </div>
                </div>
            </fieldset>
        </div>
    )
}
