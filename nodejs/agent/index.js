const os = require("os");
const getmac = require("getmac").default;

const config = require(__dirname + "/../config/agent.json");

function Agent(agentEmitter) {
  this.host = {
    hostName: os.hostname(),
    macAddress: getmac(),
    freeMemory: os.freemem(),
    totalMemory: os.totalmem(),
  };
  this.interval = null;
  this.emitter = agentEmitter;
}

Agent.prototype.stop = function () {
  clearInterval(this.interval);
};

Agent.prototype.setFreeMemory = function (freeMemory) {
  this.host.freeMemory = freeMemory;
};

Agent.prototype.start = function () {
  let self = this;
  //Memory update will start every 1 second
  this.interval = setInterval(function () {
    self.setFreeMemory(os.freemem());
    self.emitter.emit("addMetric", self.host);
  }, 1000);
  //The process is finished after the time in configuration or 30 min for the test.
  setTimeout(function () {
    self.stop();
  }, config.MIN_DISCONNECT * 60000);
};

module.exports = Agent;
