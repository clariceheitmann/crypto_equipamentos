const CryptoJS = require('crypto-js')
const CHAVE_SECRETA = 'segredo'
const Equipamento = require('../models/Equipamento')
const Cliente = require('../models/Cliente')

const cadastrar = async(req,res) =>{
    const valores = req.body 

    if(!valores.modelo || !valores.fabricante || !valores.numeroSerie || !valores.idCliente){
        return res.status(400).json({message: 'Preencha todos os campos!'})
    }

    try{
        const cliente = await Cliente.findByPk(valores.idCliente)

        if(!cliente){
            return res.status(404).json({message: 'Cliente não encontrado!'})
        }

        const numeroSerieCriptografada = CryptoJS.AES.encrypt(valores.numeroSerie, CHAVE_SECRETA).toString()

        await Equipamento.create({
            modelo: valores.modelo,
            fabricante: valores.fabricante,
            numeroSerie: numeroSerieCriptografada,
            idCliente: valores.idCliente,
        })
        return res.status(200).json({message: 'Equipamento cadastrado com sucesso!'})
    }catch(err){
        console.error('Erro ao cadastrar equipamento!',err)
        return res.status(500).json({message: 'Erro ao cadastrar equipamento!'})
    }
}

const atualizar = async(req,res) =>{
    const id = req.params.id 
    const valores = req.body 

    try{
        const equipamento = await Equipamento.findByPk(id)

        if(!equipamento){
            return res.status(404).json({message: 'Equipamento não encontrado!'})
        }

        const dadosAtualizados = {...valores}

        if(valores.numeroSerie){
            dadosAtualizados.numeroSerie = CryptoJS.AES.encrypt(Equipamento.numeroSerie, CHAVE_SECRETA).toString()

            await Equipamento.update(dadosAtualizados, {where: {codEquipamento: id}})

            return res.status(200).json({message: 'Equipamento cadastrado com sucesso!'})
        }
    }catch(err){
        console.error('Erro ao atualizar equipamento!',err)
        return res.status(500).json({message: 'Erro ao atualizar equipamento!'})
    }
}

module.exports = {cadastrar, atualizar}