=========================
0. LIMPAR BANCO
=========================

MATCH (n)
DETACH DELETE n;

=========================
1. CONSTRAINTS
=========================
CREATE CONSTRAINT user_id_unique IF NOT EXISTS
FOR (u:User) REQUIRE u.userId IS UNIQUE;

CREATE CONSTRAINT movie_id_unique IF NOT EXISTS
FOR (m:Movie) REQUIRE m.movieId IS UNIQUE;

CREATE CONSTRAINT series_id_unique IF NOT EXISTS
FOR (s:Series) REQUIRE s.seriesId IS UNIQUE;

CREATE CONSTRAINT genre_name_unique IF NOT EXISTS
FOR (g:Genre) REQUIRE g.name IS UNIQUE;

CREATE CONSTRAINT actor_name_unique IF NOT EXISTS
FOR (a:Actor) REQUIRE a.name IS UNIQUE;

CREATE CONSTRAINT director_name_unique IF NOT EXISTS
FOR (d:Director) REQUIRE d.name IS UNIQUE;


=========================
2. NODES — USERS
=========================

CREATE
(u1:User {userId: 1, name: "User 1"}),
(u2:User {userId: 2, name: "User 2"}),
(u3:User {userId: 3, name: "User 3"}),
(u4:User {userId: 4, name: "User 4"}),
(u5:User {userId: 5, name: "User 5"}),
(u6:User {userId: 6, name: "User 6"}),
(u7:User {userId: 7, name: "User 7"}),
(u8:User {userId: 8, name: "User 8"}),
(u9:User {userId: 9, name: "User 9"}),
(u10:User {userId: 10, name: "User 10"});


=========================
3. NODES — GENRES
=========================
CREATE
(gAction:Genre {name: "Action"}),
(gDrama:Genre {name: "Drama"}),
(gSciFi:Genre {name: "Sci-Fi"}),
(gCrime:Genre {name: "Crime"}),
(gComedy:Genre {name: "Comedy"});


=========================
4. NODES — MOVIES
=========================
CREATE
(m1:Movie {movieId: 1, title: "Inception"}),
(m2:Movie {movieId: 2, title: "The Dark Knight"}),
(m3:Movie {movieId: 3, title: "Interstellar"}),
(m4:Movie {movieId: 4, title: "Fight Club"}),
(m5:Movie {movieId: 5, title: "The Matrix"}),
(m6:Movie {movieId: 6, title: "Pulp Fiction"}),
(m7:Movie {movieId: 7, title: "Forrest Gump"}),
(m8:Movie {movieId: 8, title: "The Shawshank Redemption"}),
(m9:Movie {movieId: 9, title: "Gladiator"}),
(m10:Movie {movieId: 10, title: "Joker"});


=========================
5. NODES — SERIES
=========================

CREATE
(s1:Series {seriesId: 1, title: "Breaking Bad"}),
(s2:Series {seriesId: 2, title: "Stranger Things"}),
(s3:Series {seriesId: 3, title: "Game of Thrones"}),
(s4:Series {seriesId: 4, title: "The Office"}),
(s5:Series {seriesId: 5, title: "Dark"}),
(s6:Series {seriesId: 6, title: "Narcos"}),
(s7:Series {seriesId: 7, title: "Friends"}),
(s8:Series {seriesId: 8, title: "The Boys"}),
(s9:Series {seriesId: 9, title: "Chernobyl"}),
(s10:Series {seriesId: 10, title: "Peaky Blinders"});


=========================
6. NODES — ACTORS
=========================
CREATE
(a1:Actor {name: "Leonardo DiCaprio"}),
(a2:Actor {name: "Christian Bale"}),
(a3:Actor {name: "Keanu Reeves"}),
(a4:Actor {name: "Morgan Freeman"}),
(a5:Actor {name: "Bryan Cranston"}),
(a6:Actor {name: "Millie Bobby Brown"}),
(a7:Actor {name: "Kit Harington"}),
(a8:Actor {name: "Steve Carell"}),
(a9:Actor {name: "Cillian Murphy"}),
(a10:Actor {name: "Joaquin Phoenix"});


=========================
7. NODES — DIRECTORS
=========================
CREATE
(d1:Director {name: "Christopher Nolan"}),
(d2:Director {name: "David Fincher"}),
(d3:Director {name: "Quentin Tarantino"}),
(d4:Director {name: "Frank Darabont"}),
(d5:Director {name: "Vince Gilligan"});


=========================
8. RELATIONSHIPS — GENRES
=========================
MATCH
(m1:Movie {title:"Inception"}), (gSciFi:Genre {name:"Sci-Fi"}),
(m2:Movie {title:"The Dark Knight"}), (gAction:Genre {name:"Action"}),
(m3:Movie {title:"Interstellar"}), (gSciFi),
(m4:Movie {title:"Fight Club"}), (gDrama:Genre {name:"Drama"}),
(m5:Movie {title:"The Matrix"}), (gSciFi),
(m6:Movie {title:"Pulp Fiction"}), (gCrime:Genre {name:"Crime"}),
(m7:Movie {title:"Forrest Gump"}), (gDrama),
(m8:Movie {title:"The Shawshank Redemption"}), (gDrama),
(m9:Movie {title:"Gladiator"}), (gAction),
(m10:Movie {title:"Joker"}), (gDrama)
CREATE
(m1)-[:IN_GENRE]->(gSciFi),
(m2)-[:IN_GENRE]->(gAction),
(m3)-[:IN_GENRE]->(gSciFi),
(m4)-[:IN_GENRE]->(gDrama),
(m5)-[:IN_GENRE]->(gSciFi),
(m6)-[:IN_GENRE]->(gCrime),
(m7)-[:IN_GENRE]->(gDrama),
(m8)-[:IN_GENRE]->(gDrama),
(m9)-[:IN_GENRE]->(gAction),
(m10)-[:IN_GENRE]->(gDrama);


=========================
9. RELATIONSHIPS — SERIES GENRES
=========================
MATCH
(s1:Series {title:"Breaking Bad"}),(gCrime),
(s2:Series {title:"Stranger Things"}),(gSciFi),
(s3:Series {title:"Game of Thrones"}),(gAction),
(s4:Series {title:"The Office"}),(gComedy:Genre {name:"Comedy"}),
(s5:Series {title:"Dark"}),(gSciFi),
(s6:Series {title:"Narcos"}),(gCrime),
(s7:Series {title:"Friends"}),(gComedy),
(s8:Series {title:"The Boys"}),(gAction),
(s9:Series {title:"Chernobyl"}),(gDrama),
(s10:Series {title:"Peaky Blinders"}),(gCrime)
CREATE
(s1)-[:IN_GENRE]->(gCrime),
(s2)-[:IN_GENRE]->(gSciFi),
(s3)-[:IN_GENRE]->(gAction),
(s4)-[:IN_GENRE]->(gComedy),
(s5)-[:IN_GENRE]->(gSciFi),
(s6)-[:IN_GENRE]->(gCrime),
(s7)-[:IN_GENRE]->(gComedy),
(s8)-[:IN_GENRE]->(gAction),
(s9)-[:IN_GENRE]->(gDrama),
(s10)-[:IN_GENRE]->(gCrime);


=========================
10. RELATIONSHIPS — ACTORS
=========================
MATCH
(a1:Actor {name:"Leonardo DiCaprio"}),(m1:Movie {title:"Inception"}),
(a2:Actor {name:"Christian Bale"}),(m2:Movie {title:"The Dark Knight"}),
(a3:Actor {name:"Keanu Reeves"}),(m5:Movie {title:"The Matrix"}),
(a4:Actor {name:"Morgan Freeman"}),(m8:Movie {title:"The Shawshank Redemption"}),
(a5:Actor {name:"Bryan Cranston"}),(s1:Series {title:"Breaking Bad"}),
(a6:Actor {name:"Millie Bobby Brown"}),(s2:Series {title:"Stranger Things"}),
(a7:Actor {name:"Kit Harington"}),(s3:Series {title:"Game of Thrones"}),
(a8:Actor {name:"Steve Carell"}),(s4:Series {title:"The Office"}),
(a9:Actor {name:"Cillian Murphy"}),(s10:Series {title:"Peaky Blinders"}),
(a10:Actor {name:"Joaquin Phoenix"}),(m10:Movie {title:"Joker"})
CREATE
(a1)-[:ACTED_IN]->(m1),
(a2)-[:ACTED_IN]->(m2),
(a3)-[:ACTED_IN]->(m5),
(a4)-[:ACTED_IN]->(m8),
(a5)-[:ACTED_IN]->(s1),
(a6)-[:ACTED_IN]->(s2),
(a7)-[:ACTED_IN]->(s3),
(a8)-[:ACTED_IN]->(s4),
(a9)-[:ACTED_IN]->(s10),
(a10)-[:ACTED_IN]->(m10);


=========================
11. RELATIONSHIPS — DIRECTORS
=========================
MATCH
(d1:Director {name:"Christopher Nolan"}),(m1:Movie {title:"Inception"}),
(d1),(m2:Movie {title:"The Dark Knight"}),
(d1),(m3:Movie {title:"Interstellar"}),
(d2:Director {name:"David Fincher"}),(m4:Movie {title:"Fight Club"}),
(d3:Director {name:"Quentin Tarantino"}),(m6:Movie {title:"Pulp Fiction"}),
(d4:Director {name:"Frank Darabont"}),(m8:Movie {title:"The Shawshank Redemption"}),
(d5:Director {name:"Vince Gilligan"}),(s1:Series {title:"Breaking Bad"})
CREATE
(d1)-[:DIRECTED]->(m1),
(d1)-[:DIRECTED]->(m2),
(d1)-[:DIRECTED]->(m3),
(d2)-[:DIRECTED]->(m4),
(d3)-[:DIRECTED]->(m6),
(d4)-[:DIRECTED]->(m8),
(d5)-[:DIRECTED]->(s1);


=========================
12. RELATIONSHIPS — WATCHED (COM RATING)
=========================
MATCH
(u1:User {userId:1}), (u2:User {userId:2}), (u3:User {userId:3}), (u4:User {userId:4}), (u5:User {userId:5}),
(m1:Movie {title:"Inception"}),(m2:Movie {title:"The Dark Knight"}),(m3:Movie {title:"Interstellar"}),
(s1:Series {title:"Breaking Bad"}),(s2:Series {title:"Stranger Things"}),(s3:Series {title:"Game of Thrones"})
CREATE
(u1)-[:WATCHED {rating:5}]->(m1),
(u1)-[:WATCHED {rating:4}]->(m2),
(u1)-[:WATCHED {rating:5}]->(s1),

(u2)-[:WATCHED {rating:5}]->(m1),
(u2)-[:WATCHED {rating:5}]->(m3),
(u2)-[:WATCHED {rating:4}]->(s2),

(u3)-[:WATCHED {rating:4}]->(m2),
(u3)-[:WATCHED {rating:5}]->(s1),
(u3)-[:WATCHED {rating:5}]->(s3),

(u4)-[:WATCHED {rating:5}]->(m3),
(u4)-[:WATCHED {rating:4}]->(s2),
(u4)-[:WATCHED {rating:5}]->(s3),

(u5)-[:WATCHED {rating:4}]->(m1),
(u5)-[:WATCHED {rating:5}]->(m2),
(u5)-[:WATCHED {rating:4}]->(s1);
