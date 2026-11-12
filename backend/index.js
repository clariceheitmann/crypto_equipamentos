const express = require('express')
const app = express()
const cors = require('cors')

const hostname = 'localhost'
const PORT = 3000
const conn = require('./db/conn')

require('./models/rel')

const authMiddleware = require('./middleware/auth.middleware')
const authController = require('./controller/auth.controller')
const funcionarioController = require('./controller/funcionario.controller')
const equipamentoController = require('./controller/equipamento.controller')
const clienteController = require('./controller/cliente.controller')
const vistoriaController = require('./controller/vistoria.controller')

app.use(express.urlencoded({extends: true}))
app.use(express.json())
app.use(cors())

app.post('/funcionario', funcionarioController.cadastrar)
app.post('/login', authController.login)

app.use('/', (req,res) =>{
    return res.status(200).json('Aplicação rodando!')
})

app.use(authMiddleware)

app.post('/cliente', clienteController.cadastrar)
app.get('/cliente/buscar/:nome', clienteController.buscarNome)
app.put('/cliente/:id', clienteController.atualizar)
app.delete('/cliente/:id', clienteController.apagar)

app.post('/equipamento', equipamentoController.cadastrar)
app.put('/equipamento/:id', equipamentoController.atualizar)

app.post('/vistoria', vistoriaController.cadastrar)

conn.sync()
    .then(()=>{
        app.listen(PORT, hostname, ()=>{
            console.log(`Aplicação rodando em: http://${hostname}:${PORT}`)
        })
    })
    .catch((err)=>{
        console.error('Erro ao se conectar com o banco de dados!')
    })