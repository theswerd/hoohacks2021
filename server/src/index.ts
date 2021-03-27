import dotenv from "dotenv";
dotenv.config();
import express from "express";
import debug from "./routes/debug";


const app = express();
app.use("/", debug());



const port = ((process.env.PORT as unknown) as number) ?? 8080;
app.listen(port, "0.0.0.0", () => {
    console.log(
      "Running at http://0.0.0.0" + `:${port} ` + Date()
    );
  });