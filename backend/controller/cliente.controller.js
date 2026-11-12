const CryptoJS = require('crypto-js')
const CHAVE_SECRETA = 'segredo'
const Cliente = require('../models/Cliente')

const cadastrar = async(req,res) =>{
    const valores = req.body 

    if(!valores.nome || !valores.cpf){
        return res.status(400).json({message: 'Preencha todos os campos!'})
    }

    if(valores.cpf.length !== 11){
        return res.status(401).json({message: 'O CPF deve conter 11 dígitos!'})
    }

    try{
        const cpfCriptografada = CryptoJS.AES.encrypt(valores.cpf, CHAVE_SECRETA).toString()

        await Cliente.create({
            nome: valores.nome,
            cpf: cpfCriptografada
        })
        return res.status(200).json({message: 'Cliente cadastrado com sucesso!'})
    }catch(err){
        console.error('Erro ao cadastrar cliente!',err)
        return res.status(500).json({message: 'Erro ao cadastrar cliente!'})
    }
}

const buscarNome = async(req,res) =>{
    const nome = req.params.nome 

    try{
        const cliente = await Cliente.findOne({where: {nome: nome}})

        if(!cliente){
            return res.status(404).json({message: 'Cliente não encontrado!'})
        }

        const bytesCpf = CryptoJS.AES.decrypt(cliente.cpf, CHAVE_SECRETA)
        const cpfDescriptografado = bytesCpf.toString(CryptoJS.enc.Utf8)

        return res.status(200).json({
            codCliente: cliente.codCliente,
            nome: cliente.nome,
            cpf: cpfDescriptografado
        })
    }catch(err){
        console.error('Erro ao consultar cliente!',err)
        return res.status(500).json({message: 'Erro ao consultar cliente!'})
    }
}

const atualizar = async(req,res) =>{
    const id = req.params.id 
    const valores = req.body 

    try{
        const cliente = await Cliente.findByPk(id)

        if(!cliente){
            return res.status(404).json({message: 'Cliente não encontrado!'})
        }

        const dadosAtualizados = {...valores}

        if(valores.cpf){
            if(valores.cpf.length !== 11){
            return res.status(401).json({message: 'O CPF deve conter 11 dígitos!'})
            }
            dadosAtualizados.cpf = CryptoJS.AES.encrypt(cliente.cpf, CHAVE_SECRETA).toString()

            await Cliente.update(dadosAtualizados, {where: {codCliente: id}})

            return res.status(200).json({message: 'Cliente cadastrado com sucesso!'})
        }
    }catch(err){
        console.error('Erro ao atualizar cliente!',err)
        return res.status(500).json({message: 'Erro ao atualizar cliente!'})
    }
}

const apagar = async(req,res) =>{
    const id = req.params.id 

    try{
        const cliente = await Cliente.findByPk(id)

        if(!cliente){
            return res.status(404).json({message: 'Cliente não encontrado!'})
        }

        await Cliente.destroy({where: {codCliente: id}})

        return res.status(200).json({message: 'Cliente apagado com sucesso!'})
    }catch(err){
        console.error('Erro ao apagar cliente!',err)
        return res.status(500).json({message: 'Erro ao apagar cliente!'})
    }
}

module.exports = {cadastrar, buscarNome, atualizar, apagar}