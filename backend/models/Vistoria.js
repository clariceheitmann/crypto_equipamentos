const {DataTypes} = require('sequelize')
const db = require('../db/conn')

const Vistoria = db.define('Vistoria',{
    codVistoria:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    status:{
        type: DataTypes.ENUM('PENDENTE','REALIZADA'),
        allowNull: false
    },
    data:{
        type: DataTypes.DATE,
        allowNull: false,
        unique: true
    },
    idEquipamento:{
        type: DataTypes.INTEGER,
        allowNull: false,
        references:{
            key: 'codEquipamento',
            model: 'equipamentos'
        }
    },
},{
    timestamps: false,
    tableName: 'vistorias'
})

module.exports = Vistoria