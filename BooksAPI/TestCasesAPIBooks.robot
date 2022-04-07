*** Settings ***
Documentation      Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource           ResourceAPI.robot
Suite Setup        Conectar minha API




*** Test Cases ***
Buscar listagem de todos os livros
    Requisitar todos os livros

 
