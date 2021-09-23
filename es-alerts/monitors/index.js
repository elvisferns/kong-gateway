const axios = require("axios");
const _ = require("lodash");

const { URL } = require('./constants');
// const postmanMonitor = require("./monitors/postman-test");

const REQUIRED_KEYS = ["name", "enabled"];

const createMonitor = async (monitor = {}) => {
  try {
    if (!_.isEqual(_.intersection(Object.keys(monitor), REQUIRED_KEYS), REQUIRED_KEYS)) {
      throw new Error("Missing required fields");
    }
    
    const url = URL + "/monitors";
    const res = await axios.post(url, monitor, {
      headers: {
        "kbn-xsrf": "anything",
      },
    });
    console.log("🚀 ~ file: index.js ~ line 17 ~ createMonitor ~ res", res);
  } catch (error) {
    console.error(error);
  }
};

module.exports = {
  createMonitor,
}