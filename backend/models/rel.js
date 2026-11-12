const Funcionario = require('./Funcionario')
const Cliente = require('./Cliente')
const Equipamento = require('./Equipamento')
const Vistoria = require('./Vistoria')

Cliente.hasMany(Equipamento,{
    foreignKey: 'idCliente',
    as: 'equipamentosCliente',
    onDelete: 'CASCADE'
})

Equipamento.belongsTo(Cliente,{
    foreignKey: 'idCliente',
    as: 'clienteEquipamento',
    allowNull: false
})

Vistoria.hasMany(Equipamento,{
    foreignKey: 'idVistoria',
    as: 'equipamentosVistoria',
    onDelete: 'CASCADE'
})

Equipamento.belongsTo(Vistoria,{
    foreignKey: 'idVistoria',
    as: 'vistoriaEquipamento',
    allowNull: false
})

module.exports = {Funcionario, Cliente, Equipamento, Vistoria}