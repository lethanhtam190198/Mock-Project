import React, { useMemo, useState } from 'react'

export default function SelectListObject(props) {
    const [state, setState] = useState([]);
    useMemo(() => {
        fetch(
            props.url,
            {
                method: 'get',
                headers: {
                    Accept: 'application/json',
                    'Content-Type': 'application/json',
                },
            }
        )
            .then((response) => response.json())
            .then((data) => {
                setState(data);
            });

    }, [props]);

    return (
        <div>
            <select className="form-select"
                defaultValue={props.value ?? ""}
                aria-label="Default select example"
                name={props.name}
            >
                <option disabled value="">Choice</option>
                {state.map(item =>
                    <option value={item.id}
                        key={item.id}>{item.name ?? item.position}
                    </option>
                )}
            </select>
        </div>
    )
}
