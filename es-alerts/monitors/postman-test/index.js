const query = require("./query");
const triggers = require("./triggers");

const INDICES = ["testing-docker"];

const SCHEDULE = {
  period: {
    interval: 3,
    unit: "MINUTES",
  },
};

module.exports = {
  type: "monitor",
  name: "postman-queries",
  enabled: true,
  schedule: SCHEDULE,
  inputs: [
    {
      search: {
        indices: INDICES,
        query,
      },
    },
  ],
  triggers,
};
