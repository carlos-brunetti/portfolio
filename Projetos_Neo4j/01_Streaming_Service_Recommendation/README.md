# Streaming Service — Graph Database Project (Neo4j)

## Sobre o Projeto

Este projeto tem como objetivo modelar um serviço de streaming utilizando banco de dados em grafo (Neo4j), permitindo análises de comportamento dos usuários e geração de recomendações baseadas em similaridade de consumo.

A proposta é simular um cenário real de negócio, onde usuários assistem a filmes e séries, que por sua vez possuem gêneros, diretores e atores, permitindo análises típicas de plataformas de streaming.

---

## Objetivo de Negócio

Responder perguntas como:

- Quais são os conteúdos mais assistidos?
- Quais usuários possuem gostos semelhantes?
- Quais conteúdos podem ser recomendados para um usuário com base em outros usuários parecidos?
- Quais gêneros e diretores têm maior engajamento?

---

## Diagrama do Modelo (Esboço)

O diagrama abaixo representa a estrutura do grafo, com os principais nós e relacionamentos.

**Nós:**
- User
- Movie
- Series
- Genre
- Director
- Actor

**Relacionamentos:**
- (:User)-[:WATCHED]->(:Movie | :Series)
- (:Movie)-[:IN_GENRE]->(:Genre)
- (:Series)-[:IN_GENRE]->(:Genre)
- (:Movie)-[:DIRECTED_BY]->(:Director)
- (:Series)-[:DIRECTED_BY]->(:Director)
- (:Movie)-[:HAS_ACTOR]->(:Actor)
- (:Series)-[:HAS_ACTOR]->(:Actor)

<img width="773" height="518" alt="diagrama_grafo_streaming" src="https://github.com/user-attachments/assets/8a0ad9ab-3538-40ec-8d03-04d57932cbc8" />

## Criação do Modelo no Neo4j

Todo o script Cypher utilizado está no arquivo:

[`script.cypher`](./script.cypher)
