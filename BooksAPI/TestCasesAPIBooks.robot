*** Settings ***
Documentation      Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource           ResourceAPI.robot
Suite Setup        Conectar minha API




*** Test Cases ***
Buscar listagem de todos os livros
    Requisitar todos os livros
    Conferir o status code    200
    Conferir o reason         OK
    Conferir se retorna "200" livros na lista

Buscar um livro especifico
    Requisitar o livro "14"
    Conferir o status code    200
    Conferir o reason         OK