"use strict";
const { Model } = require("sequelize");
const moment = require("moment");
module.exports = (sequelize, DataTypes) => {
  class Host extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Host.init(
    {
      hostName: DataTypes.STRING,
      macAddress: DataTypes.STRING,
      totalMemory: DataTypes.INTEGER,
      createdAt: {
        type: DataTypes.DATE,
        get() {
          return moment(this.getDataValue("createdAt"))
            .tz("America/Santiago")
            .format();
        },
      },
      updatedAt: {
        type: DataTypes.DATE,
        get() {
          return moment(this.getDataValue("updatedAt"))
            .tz("America/Santiago")
            .format();
        },
      },
    },
    {
      sequelize,
      modelName: "Host",
    }
  );
  return Host;
};
