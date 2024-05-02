import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { response } from "../config/response.js";
import { decodeToken } from "../config/jwt.js";

let model = initModels(sequelize);

const placeOrder = async (req, res) => {
  try {
    const { food_id, amount, code, arr_sub_id } = req.body;
    const { token } = req.headers;
    const { data } = decodeToken(token);

    const newOrder = {
      user_id: data.userId,
      food_id,
      amount,
      code,
      arr_sub_id,
      date_order: new Date(),
    };

    await model.food_order.create(newOrder);

    response(res, "Order Added", "Success", 200);
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

export { placeOrder };
