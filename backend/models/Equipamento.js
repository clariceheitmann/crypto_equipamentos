const {DataTypes} = require('sequelize')
const db = require('../db/conn')

const Equipamento = db.define('Equipamento',{
    codEquipamento:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    modelo:{
        type: DataTypes.STRING(100),
        allowNull: false
    },
    fabricante:{
        type: DataTypes.STRING(100),
        allowNull: false,
        unique: true
    },
    numeroSerie:{
        type: DataTypes.STRING(100),
        allowNull: false
    },
    idCliente:{
        type: DataTypes.INTEGER,
        allowNull: false,
        references:{
            key: 'codCliente',
            model: 'clientes'
        }
    },
},{
    timestamps: false,
    tableName: 'equipamentos'
})

module.exports = Equipamento