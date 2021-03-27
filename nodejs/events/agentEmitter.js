const { EventEmitter } = require("events");
const Agent = require("../agent");
const db = require("../models");

const agentEmitter = new EventEmitter();
const agent = new Agent(agentEmitter);

agentEmitter.on("connect", function () {
  agent.start();
});

agentEmitter.on("disconnect", function () {
  agent.stop();
});

agentEmitter.on("addMetric", function (agentHost) {
  db.Host.findOrCreate({
    where: { hostName: agentHost.hostName, macAddress: agentHost.macAddress },
    defaults: {
      hostName: agentHost.hostName,
      macAddress: agentHost.macAddress,
      totalMemory: agentHost.totalMemory,
    },
  })
    .then(async (currentHost) => {
      try {
        if (currentHost.length) {
          await db.MemoryHistory.create({
            memory: agentHost.freeMemory,
            HostId: currentHost[0].id,
          });
          console.log("Information has been entered correctly");
        }
      } catch (err) {
        console.error("Problem creating host", err);
      }
    })
    .catch(function (err) {
      console.error("Problem with bd comunication", err);
    });
});
agentEmitter.on("removeMetric", async function (id) {
  try {
    let memoryHistory = await db.MemoryHistory.findByPk(id);
    memoryHistory.destroy({ force: true });
    console.log(`Memory History with id ${id} was removed`);
  } catch (err) {
    console.error("Problem deleting data from memory", err);
  }
});

module.exports = agentEmitter;
