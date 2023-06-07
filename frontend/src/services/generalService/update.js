import axios from 'axios'

export default (module, type_data, item) => {
    let url = module + '/' + type_data + '/' + item.id

    let request = axios.$http.put(url, item)
    return request.then(response => {
        return response.data
    })
}
