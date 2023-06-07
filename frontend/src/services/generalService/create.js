import axios from 'axios';

export default (module, typeData, payload) => {
    let url = `${module}/${typeData}`;
    let request = axios.post(url, payload);
    return request.then((response) => {
        return response.data;
    });
}
