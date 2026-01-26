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

## Exemplos de Análises

### Visão Geral do Grafo

Visualizar todos os nós e relacionamentos do banco de dados para validar o modelo de grafo e entender como as entidades estão conectadas.

```cypher
MATCH (n)-[r]->(m)
RETURN n, r, m;
```

<img width="862" height="628" alt="image" src="https://github.com/user-attachments/assets/fddc7a38-82bc-4030-8e6f-a2a5fd37893b" />

### Recomendação: Usuários com Gostos Parecidos

Encontrar usuários que assistiram aos mesmos conteúdos, indicando perfis com interesses semelhantes.
- Pares de usuários com maior sobreposição de interesses
- Base para sistemas de recomendação colaborativa
- Possibilidade de sugerir novos conteúdos com base em perfis similares

```cypher
MATCH (u1:User)-[:WATCHED]->(c)<-[:WATCHED]-(u2:User)
WHERE u1 <> u2
RETURN u1.name AS user1, u2.name AS user2, count(c) AS sharedContent
ORDER BY sharedContent DESC;
```
<img width="1031" height="463" alt="image" src="https://github.com/user-attachments/assets/0f77b26c-76a3-482b-944b-b39252230c1e" />

### Recomendações de Conteúdo por Gênero Preferido

Sugerir conteúdos com base nos gêneros mais assistidos por cada usuário.
- Gêneros preferidos de cada usuário
- Conteúdos ainda não assistidos, mas alinhados ao perfil
- Exemplo simples de recomendação baseada em conteúdo (content-based)

```
MATCH (u:User)-[:WATCHED]->(c)-[:IN_GENRE]->(g)
WITH u, g, count(*) AS freq
ORDER BY freq DESC
MATCH (g)<-[:IN_GENRE]-(rec)
WHERE NOT (u)-[:WATCHED]->(rec)
RETURN u.name AS user, g.name AS favoriteGenre, rec.title AS recommendation
LIMIT 10;
```

<img width="1063" height="456" alt="image" src="https://github.com/user-attachments/assets/c6b82baf-d956-4e9e-b712-698f412f8003" />

### Usuários Conectados por Conteúdos em Comum (Grafo)

Visualizar como usuários estão conectados entre si através de filmes e séries que ambos assistiram, formando clusters de gostos parecidos.

- Usuários ligados indiretamente por conteúdos em comum
- Formação de grupos (clusters) com interesses semelhantes
- Base visual para sistemas de recomendação colaborativa

<img width="1402" height="417" alt="image" src="https://github.com/user-attachments/assets/a4c062b5-2617-45aa-abe7-c09e0bf1e0be" />

## Fechamento do Projeto

Este projeto demonstra como bancos de dados em grafo permitem:

- Modelar relações complexas de forma natural
- Navegar facilmente entre usuários, conteúdos e características
- Criar bases para sistemas de recomendação

Mesmo com um conjunto pequeno de dados, já é possível observar padrões de consumo e relações relevantes entre usuários e conteúdos.


