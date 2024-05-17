const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');

const app = express();
const PORT = 3000;

// Configurer la connexion à la base de données
const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root', // Remplacez par votre nom d'utilisateur MySQL
    password: '', // Remplacez par votre mot de passe MySQL
    database: 'zoo'
});

// Connectez-vous à la base de données MySQL
db.connect((err) => {
    if (err) {
        console.error('Erreur de connexion à la base de données:', err);
        return;
    }
    console.log('Connecté à la base de données MySQL');
});

app.use(bodyParser.json());
app.use(express.static('public'));

app.use(express.static(path.join(__dirname, '')));

// Route pour servir le fichier HTML du formulaire
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '', 'connexion.html'));
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;

    // Vérifier les identifiants dans la base de données
    const query = 'SELECT * FROM utilisateur WHERE username = ? AND password = ?';
    db.query(query, [username, password], (err, results) => {
        if (err) {
            console.error('Erreur lors de la requête:', err);
            res.json({ success: false, message: 'Erreur du serveur' });
            return;
        }

        if (results.length > 0) {
            res.json({ success: true });
        } else {
            res.json({ success: false, message: 'Identifiants invalides' });
        }
    });
});


app.get('/services', (req, res) => {
    const query = 'SELECT * FROM service';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Erreur lors de la récupération des services:', err);
            res.status(500).send('Erreur du serveur');
            return;
        }
        res.json(results);
    });
});

app.listen(PORT, () => {
    console.log(`Le serveur fonctionne sur http://localhost:${PORT}`);
});
