import dotenv from "dotenv";
dotenv.config();
import express from "express";


const app = express();

app.get('/',(req, res)=>res.send('home'))
app.get('/status',(req, res)=>res.send('status'))

const port = ((process.env.PORT as unknown) as number) ?? 8080;
app.listen(port, "0.0.0.0", () => {
    console.log(
      "Running at http://0.0.0.0" + `:${port} ` + Date()
    );
  });