const axios = require("axios");
const _ = require("lodash");
const path = require("path");
const { readdirSync } = require("fs");

const { URL } = require('../constants');
// const postmanMonitor = require("./monitors/postman-test");

const REQUIRED_KEYS = ["name", "enabled"];

const createMonitor = async (name = 'postman-test') => {
  try {
    if (!name) {
      throw new Error("no name provided");
    }

    // check if dir exists
    // eslint-disable-next-line no-undef
    readdirSync(path.join(__dirname, name));

    // eslint-disable-next-line no-undef
    const monitor = require(path.join(__dirname, name));
    console.log("🚀 ~ file: index.js ~ line 21 ~ createMonitor ~ monitor", monitor)

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