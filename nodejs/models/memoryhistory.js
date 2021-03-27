"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class MemoryHistory extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      this.belongsTo(models.Host, {
        foreignKey: {
          allowNull: false,
        },
      });
    }
  }
  MemoryHistory.init(
    {
      memory: DataTypes.INTEGER,
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
      modelName: "MemoryHistory",
    }
  );
  return MemoryHistory;
};
