import { getHomepage } from "../controllers/homeController.js";
import { Router } from "express";

const homeRouter = Router();

homeRouter.get("/", getHomepage);

export default homeRouter;
