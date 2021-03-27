import express, { Application } from "express";

export default (): Application => {
  const app = express();

  app.get("/", (_req, res) => {
    res.send("Welcome to MyShot");
  });

  app.get("/status", (_req, res) => {
    res.send("Operational🌟 " + Date());
  });
  app.get("/authors", (_req, res) => {
    res.send("good question")
  });
  return app;
};