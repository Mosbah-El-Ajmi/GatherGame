const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const {getAllMissionsActives, getMissionsActivesByJoueur, getMissionsActivesNomsByJoueur, getMissionsActivesByStatus, getMissions24hByJoueur, updateStatutV, updatePhoto, updateStatutL} = require('../controllers/missionsActive')

router.get('/:tok', getAllMissionsActives);
router.get('/joueur/:id/:tok', getMissionsActivesByJoueur);
router.get('/joueurNoms/:id/:tok', getMissionsActivesNomsByJoueur);
router.get('/status/:id/:tok', getMissionsActivesByStatus);
router.get('/24h/:id/:tok', getMissions24hByJoueur);
router.put('/validation/:id/:tok', updateStatutV);
router.put('/abandon/:id/:tok', updateStatutL)
router.put('/photo/:id/:tok', updatePhoto);

module.exports = router;
