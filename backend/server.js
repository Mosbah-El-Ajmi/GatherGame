const express = require("express");
const mysql = require("mysql");
const app = express();
const port = 3001; // ou tout autre port de votre choix
const cors = require("cors");
const bodyParser = require("body-parser");
const multer = require("multer");
const cloudinary = require("cloudinary").v2;

cloudinary.config({
  cloud_name: "dyowth3mr",
  api_key: "546283929715615",
  api_secret: "2EfPhfrS0fWCma7ttCEXkFNyXXk",
});

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

app.use(
  cors({
    origin: "http://localhost:3000",
    optionsSuccessStatus: 200, // Some legacy browsers choke on 204
  })
);

// Route to handle file upload
app.post("/upload", upload.single("photo"), async (req, res) => {
  try {
    const result = await new Promise((resolve, reject) => {
      const stream = cloudinary.uploader.upload_stream(
        {
          folder: "GETG",
          format: "jpg", // Convert to JPEG format
          quality: "auto", // Automatically adjust quality
        },
        (error, result) => {
          if (error) {
            return reject(error);
          }
          resolve(result);
        }
      );
      stream.end(req.file.buffer);
    });

    // Log the URL of the uploaded image
    console.log(result.secure_url);
    res.status(200).send(result.secure_url);
  } catch (error) {
    console.error(error);
    res.status(500).send("Error uploading image");
  }
});

//donnée connecxion db
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Ephec123@",
  database: "dev",
});

// Établir la connexion à la base de données
connection.connect((err) => {
  if (err) {
    console.error("Erreur lors de la connexion à la base de données :", err);
    return;
  }
  console.log("Connexion à la base de données MySQL réussie");
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//routes
const missionsRouter = require("./route/missions");
const missionsActiveRouter = require("./route/missionsActive");
const joueursRouter = require("./route/joueurs");
const utilisateursRouter = require("./route/utilisateurs");
const historyRouter = require("./route/history");

app.use("/missions", missionsRouter);
app.use("/missions_active", missionsActiveRouter);
app.use("/joueurs", joueursRouter);
app.use("/utilisateurs", utilisateursRouter);
app.use("/history", historyRouter);
//
app.listen(port, () => {
  console.log(`Serveur backend écoutant sur le port ${port}`);
});
