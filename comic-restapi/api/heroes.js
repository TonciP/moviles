
const HeroesController = require('../controllers/HeroesController');
const express = require('express');

const router = express.Router();

router.get("/all", HeroesController.findAllHeroes);

router.get("/:id", HeroesController.findById);

module.exports = router;