const mongoose = require("mongoose");
const Heroes = require("./Heroes");
const Villains = require("./Villains");
const AntiHeroes = require("./AntiHeroes");
const Aliens = require("./Aliens");
const Humans = require("./Humans");

const Schema = mongoose.Schema;

const ComicSchema = new Schema({
    heroes: {type: String},
    villains: {type: String},
    antiheroes: {type: String},
    aliens: {type: String},
    humans: {type: String}
})

module.exports = Heroes = mongoose.model('comic', ComicSchema);