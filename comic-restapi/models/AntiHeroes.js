const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const AntiHeroesSchema = new Schema({
    name: {type: String},
    alterEgo: {type: String},
    imagePath: {type: String},
    biography: {type: String},
    caracteristics: {type: String},
    abilities: {type: String},
    movies: {type: String},
})

module.exports = Heroes = mongoose.model('AntiHeroes', AntiHeroesSchema);