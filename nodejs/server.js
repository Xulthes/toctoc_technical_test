const express = require("express");
const app = express();
const cors = require("cors");
const db = require("./models");
const agentEmitter = require("./events/agentEmitter");

// Setting
const port = process.env.PORT || 8000;

// req.body
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(cors());

//Routes
app.get("/", (req, res) => {
  res.send("Hola TocToc.com");
});

app.get("/get/resource/host", (req, res) => {
  return db.Host.findAll({
    limit: 1,
    order: [["createdAt", "DESC"]],
  })
    .then((hosts) => {
      if (hosts.length) return res.send(hosts);
      else return res.send(null);
    })
    .catch((err) => {
      console.error("There was an error querying hosts", JSON.stringify(err));
      return res.send(err);
    });
});

app.get("/get/resource/memory/:id", (req, res) => {
  const hostId = parseInt(req.params.id);
  const formatDate = () => {
    return db.sequelize.fn(
      "strftime",
      db.sequelize.literal("'%d/%m/%Y %H:%M'"),
      db.sequelize.fn("datetime", db.sequelize.col("createdAt"), "-03:00")
    );
  };
  return db.MemoryHistory.findAll({
    limit: 30,
    attributes: [[formatDate(), "date"], "memory", "id"],
    group: [formatDate(), "date"],
    where: { hostId },
    order: [["id", "DESC"]],
  })
    .then((memoryHistories) => res.send(memoryHistories))
    .catch((err) => {
      console.error(
        "There was an error querying memory histories",
        JSON.stringify(err)
      );
      return res.send(err);
    });
});

//Start server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
  //Check Squelize connection to SQLite 3 creating tables if these do not exist
  db.sequelize
    .sync()
    .then(() => {
      console.log("Connected to DB");
    })
    .catch((error) => {
      console.error(error);
    });
  //Start Host Agent
  agentEmitter.emit("connect");
});
