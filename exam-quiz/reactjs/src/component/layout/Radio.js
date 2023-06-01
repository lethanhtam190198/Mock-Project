import React, { useState } from 'react'

export default function Radio(props) {
    const [selected, setSelected] = useState("");

    const handleState = (event) => {
        setSelected(event.target.value);
        props.handleState([props.id, [event.target.value]]);
    }

    return (
        <React.Fragment>
            {props.list.map(item =>
                <tr key={item}>
                    <td>
                        <input type="radio"
                            checked={selected === item}
                            onChange={(e) => handleState(e)}
                            name={props.name}
                            value={item}
                        />
                    </td>
                    <label>{item.substring(1)}</label>
                </tr>
            )}
        </React.Fragment>
    );
}
