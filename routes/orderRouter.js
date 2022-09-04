const express = require('express');
const orderController = require('../controllers/orderController');

const router = express.Router();

router.post("", orderController.postOrders);
router.post("/items", orderController.postOrderItems);
router.get("/:order_id(\\d+)", orderController.getOrderByOrderId);
router.get("/item/:order_item_id", orderController.getOrderItemByOrderItemId);
router.delete("/:order_id", orderController.deleteOrders);
router.delete("/item/:order_item_id", orderController.deleteOrderItems);

module.exports = {
    router
}