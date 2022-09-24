const mongoose = require('mongoose');



const ratingSchema = mongoose.Schema({
    userId: {
        type: String,
        required: true,
    },
    userName: {
        type: String,
        
    },
    userComment: {
        type: String,
        
    },
    rating: {
        type:Number,
        required: true,
    }
});


module.exports = ratingSchema;