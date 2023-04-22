const mongoose = require('mongoose');

const dataSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String
    },
    description: {
        required: false,
        type: String,
    },
    image: {
        required: false,
        type: String,
    },
    keywords: {
        required: false,
        type: Array,
    },
    neighbourhood: {
        required: false,
        type: String,
    },
    coordinates: {
        required: false,
        type: Array
    }
})

module.exports = mongoose.model('Data', dataSchema)