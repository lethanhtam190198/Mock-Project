import React, { useEffect, useState } from 'react'

export default function CheckBox(props) {
    const [state, setState] = useState([]);
    const [displayState, setDisplayState] = useState([]);
    const handleChange = (event) => {
        const target = event.target;
        var value = target.value;
        if (target.checked) {
            setState([...state, value]);
            return;
        }
        setState(state.filter(x => x !== value));
    }

    useEffect(() => {
        setDisplayState(props.state);
        props.handleState([props.id, state]);
    }, [displayState, state]);

    return (
        <React.Fragment>
            {
                displayState.map((item, index) =>
                    <tr key={item + index}>
                        <td>
                            <input
                                checked={state.includes(item)}
                                name={props.id} type="checkbox" value={item}
                                onChange={(event) => handleChange(event)}
                            /> {displayState[index].substring(1)}

                        </td>
                    </tr>)
            }
        </React.Fragment>
    )
}

