import axios from 'axios'

export default (module, type_data, extraOpts = {}) => {
    let url = module + '/' + type_data

    if (typeof(extraOpts) !== 'object') {
        url += `${extraOpts}`
    } else if (extraOpts.id) {
        url += `${extraOpts.id}`
    }

    let request = axios.$http.delete(url, extraOpts)
    return request.then(response => {
        return response.data
    })
}
