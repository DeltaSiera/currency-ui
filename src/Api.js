import axios from 'axios'

const SERVER_URL = ' http://localhost:9000/api/currencies/';

const instance = axios.create({
    baseURL: SERVER_URL,
    timeout: 1000
});

export default {
    getNewest: () => instance.get('newest', {
        transformResponse: [function (data) {
            return data ? JSON.parse(data) : data
        }]
    }),
    getCountries: () => instance.get('countries', {
        transformResponse: [function (data) {
            return data ? JSON.parse(data) : data
        }]
    }),
    getNewestByName: (name) => instance.get(name, {
        transformResponse: [function (data) {
            return data ? JSON.parse(data) : data
        }]
    }),

}
