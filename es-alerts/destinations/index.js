const axios = require("axios");
const { readdirSync } = require("fs");
const path = require("path");
const _ = require("lodash");
const { URL } = require("../constants");

const REQUIRED_KEYS = ["name", "type"];

const createDestination = async (name = "") => {
  try {
    if (!name) {
      throw new Error("no name provided");
    }

    // check if dir exists
    // eslint-disable-next-line no-undef
    readdirSync(path.join(__dirname, name));

    // eslint-disable-next-line no-undef
    const destPayload = require(path.join(__dirname, name));
    console.log("🚀 ~ file: index.js ~ line 17 ~ createDestination ~ destPayload", destPayload);

    if (!_.isEqual(_.intersection(Object.keys(destPayload), REQUIRED_KEYS), REQUIRED_KEYS)) {
      throw new Error("Missing required fields");
    }

    const url = URL + "/destinations";
    const { data = {} } = await axios.post(url, destPayload, {
      headers: {
        "kbn-xsrf": "anything",
      },
    });
    console.log("🚀 ~ file: index.js ~ line 30 ~ createDestination ~ res", res)
  } catch (error) {
    console.error(error);
  }
}

module.exports = {
  createDestination,
};
