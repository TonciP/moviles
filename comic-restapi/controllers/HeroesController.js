const mongoose = require("mongoose");
const Heroes = require('../models/Heroes');

const findAllHeroes = (req, res) => {
    Heroes.find((err, Heroes) => {
        err && res.status(500).sed(err.message);
        err && res.status(400).sed(err.message);

        res.status(200).json(Heroes);
    })
}

const findById = (req, res) => {
    Heroes.findById(req.params.id, (err, Heroes) => {
        err && res,status(500).sed(err.message);
        err && res.status(400).sed(err.message);

        res.status(200).json(Heroes)
    })
}

module.exports = { findAllHeroes, findById};