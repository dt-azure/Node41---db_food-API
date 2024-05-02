import express from "express";
import {
  dislikeRes,
  getLikebyId,
  getLikebyUserId,
  getRateById,
  getRateByUserId,
  likeRes,
  rateRes,
} from "../controllers/resController.js";
import { verifyToken } from "../config/jwt.js";

const resRouter = express.Router();

// Like APIs
resRouter.get("/like/:resId", getLikebyId);
resRouter.get("/like-by/:userId", getLikebyUserId);
resRouter.post("/like-res/resId", likeRes);
resRouter.post("/dislike-res/resId", dislikeRes);

// Like APIs with token check
// resRouter.post("/like-res", verifyToken, likeRes);
// resRouter.post("/dislike-res", verifyToken, dislikeRes);

// Rating APIs
resRouter.get("/rate/:resId", getRateById);
resRouter.get("/rate-by/:userId", getRateByUserId);
resRouter.post("/rate-res", rateRes);

// Rating APIs with token check
// resRouter.get("/rate-by/:id", verifyToken, getRateByUserId);
// resRouter.post("/rate-res", verifyToken, rateRes);

export default resRouter;
