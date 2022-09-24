//* IMPORTAR OTROS PACKAGES
const express = require("express");
const mongoose = require("mongoose");




//* IMPORTAR DE OTROS ARCHIVOS
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter  = require("./routes/product");
const userRouter  = require("./routes/user");

//* INITIALIZATION

const PORT = process.env.PORT || 3000;
const app = express();
const DB =
  "mongodb+srv://germys:5eucerYw0z7Z@cluster0.ga2lq.mongodb.net/?retryWrites=true&w=majority";

//* MIDDLEWARE

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);


//* CONEXION

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Conexion exitosaa!!!!!!!!");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT,  "0.0.0.0",() => {
  console.log(`connected at port ${PORT}`);
});