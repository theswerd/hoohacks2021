import dotenv from "dotenv";
dotenv.config();
import express from "express";
import cors from "cors";

import debug from "./routes/debug";
import { Client } from "pg";

console.log("BEGIN");
const port = ((process.env.PORT as unknown) as number) ?? 8080;

const app = express();
app.use(express.json());
app.use(express.urlencoded());
app.use(cors());

console.log("BEGIN 2");

let start = async () => {
  console.log("BEGIN 3");

  const client = new Client();
  await client.connect();
  console.log("BEGIN 4");

  app.use("/", debug());
  app.post("/signup", (req, res) => {
    console.log("REQ BODY", req.body);
    client.query(
      "INSERT INTO Users (username, password, type, photoUrl) VALUES ($1, $2, $3, $4) RETURNING id",
      [req.body.username, req.body.password, req.body.type, "testing"],
      (err, dbres) => {
        if (err) {
          res.status(501).send({
            err: err,
            message: "We had a database error 😭",
            body: req.body,
          });
        } else {
          res.status(200).send(dbres.rows[0]);
        }
      }
    );
  });
  app.post("/signin", (req, res) => {
    console.log("REQ BODY", req.body);
    client.query(
      "SELECT id FROM Users WHERE username = $1 AND password = $2 LIMIT 1",
      [req.body.username, req.body.password],
      (err, dbres) => {
        if (err) {
          res.status(501).send({
            err: err,
            message: "We had a database error 😭",
            body: req.body,
          });
        } else {
          if (dbres.rowCount != 1) {
            res.status(403).send("Login Failed");
          } else {
            res.status(200).send(dbres.rows[0]);
          }
        }
      }
    );
  });

  app.get("/offers", (req, res) => {
    if ((req.headers.authorization?.length ?? 0) > 0) {
      client.query("SELECT * FROM OFFERS", (err, dbres) => {
        if (err) {
          res.status(501).send(err);
        } else {
          res.send(dbres.rows);
        }
      });
    } else {
      res
        .status(501)
        .send("Please send your user id in the authorization header.");
    }
  });

  app.post("/offer", (req, res) => {
    client.query(
      "INSERT INTO Offers (name, description, photoUrl, usesLeft, frontlineWorkers, vacinnated, volunteers) RETURNING ID",
      [
        req.body.name,
        req.body.description,
        "https://google.com",
        req.body.uses,
        req.body.frontlineWorkers,
        req.body.vacinnated,
        req.body.volunteers,
      ],
      (err, dbres) => {
        if (err) {
          res.status(501).send({
            err,
            message: "THERE WAS A DATABASE ERROR SMH",
          });
        } else {
          res.status(200).send(dbres.rows[0]);
        }
      }
    );
  });

  app.listen(port, "0.0.0.0", () => {
    console.log("Running at http://0.0.0.0" + `:${port} ` + Date());
  });
};

start();
