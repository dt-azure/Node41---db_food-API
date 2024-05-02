import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { response } from "../config/response.js";

let model = initModels(sequelize);

const placeOrder = async (req, res) => {
  try {
    const { user_id, food_id, amount, code, arr_sub_id } = req.body;

    console.log(user_id, food_id, amount, code, arr_sub_id)

    const newOrder = {
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
      date_order: new Date(),
    };

    model.food_order.create(newOrder);

    response(res, "Order Added", "Success", 200);
  } catch (error) {
    response(res, "", "Error occurred.", 500);
  }
};

export { placeOrder };
