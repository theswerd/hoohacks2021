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
  app.listen(port, "0.0.0.0", () => {
    console.log("Running at http://0.0.0.0" + `:${port} ` + Date());
  });
};

start();
