const {DataTypes} = require('sequelize')
const db = require('../db/conn')

const Cliente = db.define('Cliente',{
    codCliente:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nome:{
        type: DataTypes.STRING(100),
        allowNull: false
    },
    cpf:{
        type: DataTypes.STRING(100),
        allowNull: false,
        unique: true
    }
},{
    timestamps: false,
    tableName: 'clientes'
})

module.exports = Cliente