import dotenv from "dotenv";
dotenv.config();
import express from "express";
import debug from "./routes/debug";
import { Client } from "pg";

const port = ((process.env.PORT as unknown) as number) ?? 8080;

const app = express();

let start = async () => {
  const client = new Client();
  await client.connect();
  app.use("/", debug());
  app.post("/signup", (req, res) => {
    client.query(
      "INSERT INTO Users (username, password, type) VALUES ($1, $2, $3) RETURNING id",
      [req.body.username, req.body.password, req.body.type],
      (err, dbres) => {
        if (err) {
          res.status(501).send({
            err: err,
            message: "We had a database error 😭",
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
