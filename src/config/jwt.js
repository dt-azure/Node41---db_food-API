import jwt from "jsonwebtoken";

export const createToken = (data) => {
  return jwt.sign({ data: data }, "SECRET_CODE", { expiresIn: "3d" });
};

export const decodeToken = (token) => {
  return jwt.decode(token);
};

export const checkToken = (token) => {
  return jwt.verify(token, "SECRET_CODE", (error) => error);
};

export const verifyToken = (req, res, next) => {
  const { token } = req.headers;
  const error = checkToken(token);

  if (error == null) {
    next();
    return;
  }

  res.status(401).send(error.name);
};
