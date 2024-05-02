import express from "express";
import { placeOrder } from "../controllers/orderController.js";
import { verifyToken } from "../config/jwt.js";

const orderRouter = express.Router();

// Order APIs
orderRouter.post("/place-order", placeOrder)

// Order APIs with token check
// orderRouter.post("/place-order", verifyToken, placeOrder)

export default orderRouter