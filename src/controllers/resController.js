import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { response } from "../config/response.js";
import { decodeToken } from "../config/jwt.js";

let model = initModels(sequelize);

const getLikebyId = async (req, res) => {
  try {
    const { resId } = req.params;

    const data = await model.like_res.findAll({
      where: {
        res_id: resId,
      },
    });

    response(res, data, "Success", 200);
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

const getLikebyUserId = async (req, res) => {
  try {
    const { userId } = req.params;

    const likeData = await model.like_res.findAll({
      where: {
        user_id: userId,
      },
      include: ["restaurant"],
    });

    // const resIds = likeData.map((like) => like.res_id);

    // const resData = await model.restaurant.findAll({
    //   where: {
    //     res_id: resIds,
    //   },

    // });

    // const data = likeData.map((like) => {
    //   const resDetails = resData.find((res) => res.res_id === like.res_id);

    //   return {
    //     ...like.dataValues,
    //     restaurant: resDetails.res_name,
    //     res_desc: resDetails.res_desc,
    //   };
    // });

    response(res, likeData, "Success", 200);
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

const likeRes = async (req, res) => {
  try {
    const { res_id } = req.body;
    const { token } = req.headers;
    const { data } = decodeToken(token);

    const checkLike = await model.like_res.findOne({
      where: {
        user_id: data.userId,
        res_id,
      },
    });

    if (checkLike) {
      checkLike.destroy();
    } else {
      const newData = {
        user_id: data.userId,
        res_id,
        date_like: new Date(),
        dislike: 0,
      };

      model.like_res.create(newData);
    }

    response(res, checkLike ? "Unliked" : "Liked", "Success", 200);
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

const dislikeRes = async (req, res) => {
  try {
    const { res_id } = req.body;
    const { token } = req.headers;
    const { data } = decodeToken(token);

    const checkDislike = await model.like_res.findOne({
      where: {
        user_id: data.userId,
        res_id,
      },
    });

    let resMes = "";

    if (checkDislike) {
      if (checkDislike.dislike == 1) {
        checkDislike.destroy();
        resMes = "Un-disliked";
      } else {
        checkDislike.set({
          dislike: 1,
        });
        await checkDislike.save();
        resMes = "Disliked";
      }
    } else {
      const newData = {
        user_id: data.userId,
        res_id,
        date_like: new Date(),
        dislike: 1,
      };

      model.like_res.create(newData);
      resMes = "Disliked";
    }
    response(res, resMes, "Success", 200);
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

const getRateById = async (req, res) => {
  try {
    const { resId } = req.params;

    const data = await model.rate_res.findAll({
      where: {
        res_id: resId,
      },
    });

    response(res, data, "Success", 200);
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

const getRateByUserId = async (req, res) => {
  try {
    const { userId } = req.params;

    const data = await model.rate_res.findAll({
      where: {
        user_id: userId,
      },
      include: ["restaurant"],
    });

    response(res, data, "Success", 200);
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

const rateRes = async (req, res) => {
  try {
    const { res_id, rating } = req.body;
    const { token } = req.headers;
    const { data } = decodeToken(token);

    const checkRate = await model.rate_res.findOne({
      where: {
        user_id: data.userId,
        res_id,
      },
    });

    if (checkRate) {
      checkRate.set({
        amount: rating,
      });
      await checkRate.save();
    } else {
      const newData = {
        user_id: data.userId,
        res_id,
        amount: rating,
        date_rate: new Date(),
      };

      model.rate_res.create(newData);
    }

    response(
      res,
      checkRate ? "Rating Updated" : "Rating Added",
      "Success",
      200
    );
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

export {
  getLikebyId,
  getLikebyUserId,
  likeRes,
  dislikeRes,
  getRateById,
  getRateByUserId,
  rateRes,
};
