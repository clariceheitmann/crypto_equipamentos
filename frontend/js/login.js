const btn_login = document.getElementById('btn_login')
const resposta = document.getElementById('resposta')

btn_login.addEventListener('click', (e)=>{
    e.preventDefault()

    const valores = {
        email: document.getElementById('email'),
        senha: document.getElementById('senha'),
    }

    fetch(`http://localhost:3000/login`,{
        method: 'POST',
        headers: {'Content-Type' : 'application/json'},
        body: JSON.stringify(valores)
    })
    .then(res =>{
        localStorage.clear()
        localStorage.getItem('token', dados.token)
        localStorage.getItem('nomeFuncionario', dados.nome)
    })
    .then(dados =>{
        resposta.innerHTML = `<p>${dados.message}</p>`
        document.querySelector('form').reset()
    })
    .catch((err)=>{
        console.error('Erro ao login funcionário!',err)
        resposta.innerHTML = '<p>Erro ao login funcionário</p>'
    })
})