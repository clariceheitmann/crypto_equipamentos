const Vistoria = require('../models/Vistoria')
const Equipamento = require('../models/Equipamento')

const cadastrar = async(req,res) =>{
    const valores = req.body 

    if(!valores.status || !valores.data || !valores.idEquipamento){
        return res.status(400).json({message: 'Preencha todos os campos!'})
    }

    try{
        const equipamento = await Equipamento.findByPk(valores.idEquipamento)

        if(!equipamento){
            return res.status(404).json({message: 'Equipamento não encontrado!'})
        }

        await Vistoria.create({
            status: valores.status,
            data: valores.data,
            idEquipamento: valores.idEquipamento,
        })
        return res.status(200).json({message: 'Vistoria cadastrada com sucesso!'})
    }catch(err){
        console.error('Erro ao cadastrar vistoria!',err)
        return res.status(500).json({message: 'Erro ao cadastrar vistoria!'})
    }
}

module.exports = {cadastrar}