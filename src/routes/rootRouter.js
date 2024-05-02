import express from "express";
import userRouter from "./userRouter.js";
import resRouter from "./resRouter.js";
import orderRouter from "./orderRouter.js";

const rootRouter = express.Router();
rootRouter.use("/user", userRouter);
rootRouter.use("/restaurant", resRouter);
rootRouter.use("/order", orderRouter);

export default rootRouter;
