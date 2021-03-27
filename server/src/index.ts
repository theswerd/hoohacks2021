import dotenv from "dotenv";
dotenv.config();
import express from "express";
import debug from "./routes/debug";
import { Client } from "pg";

console.log('BEGIN');
const port = ((process.env.PORT as unknown) as number) ?? 8080;

const app = express();
app.use(express.json());
app.use(express.urlencoded());
console.log('BEGIN 2');

let start = async () => {
  console.log('BEGIN 3');

  const client = new Client();
  await client.connect();
  console.log('BEGIN 4');

  app.use("/", debug());
  app.post("/signup", (req, res) => {
    console.log('REQ BODY', req.body)
    client.query(
      "INSERT INTO Users (username, password, type, photoUrl) VALUES ($1, $2, $3, $4) RETURNING id",
      [req.body.username, req.body.password, req.body.type, "https://media-exp1.licdn.com/dms/image/C5603AQHjTGI5E6C-jA/profile-displayphoto-shrink_400_400/0/1574749440663?e=1622073600&v=beta&t=7IbOHRZe5S6CGxCg5tpB7VXoi1lc9kyd39AhlTjoQzE"],
      (err, dbres) => {
        if (err) {
          res.status(501).send({
            err: err,
            message: "We had a database error 😭",
            body: req.body
          });
        } else {
          res.status(200).send(dbres.rows);
        }
      }
    );
  });

  app.listen(port, "0.0.0.0", () => {
    console.log("Running at http://0.0.0.0" + `:${port} ` + Date());
  });
};

start();
