# CoachMaster
🏆 Sistema de Estatísticas de Carreira — Modo Treinador

Este projeto implementa a estrutura de banco de dados para um sistema completo de gerenciamento de carreira de treinador, inspirado no modo carreira de jogos de futebol. O objetivo é permitir que treinadores registrem sua trajetória profissional, desempenho por clube, temporadas, jogadores, notícias e muito mais.

O banco foi projetado para suportar estatísticas avançadas, histórico detalhado e até um sistema de notícias fictícias geradas por “jornalistas” dentro do próprio ambiente.

📊 Funcionalidades do Banco de Dados
👤 Usuários

Tabela responsável pelos dados básicos de cadastro dos usuários do sistema, armazenando nome, e-mail e senha criptografada.

🧑‍🏫 Técnicos

Registra o treinador controlado pelo usuário, incluindo:

Total de jogos

Vitórias, empates e derrotas

Aproveitamento geral

Gols marcados e sofridos

Médias por jogo

🏟️ Times

Armazena o histórico de clubes pelos quais o treinador passou:

Datas de entrada e saída

Tempo total no clube

Estatísticas completas (jogos, vitórias, aproveitamento, gols etc.)

📅 Temporadas

Cada período jogado com um time é registrado como uma temporada individual, com desempenho detalhado:

Jogos, resultados, aproveitamento

Gols marcados e sofridos

Médias por partida

👨‍🏫 Jogadores

Cada jogador do elenco possui estatísticas gerais calculadas:

Jogos disputados

Gols e assistências

Participações em gols

Nota média

📈 Temporada por Jogador

Desempenho individual de cada atleta em cada temporada, permitindo acompanhar evolução e fases:

Gols, assistências

PG/J (participações por jogo)

Nota da temporada

📰 Jornalistas e Notícias

Sistema para criar matérias personalizadas sobre a carreira do treinador:

Jornalistas vinculados a usuários

Notícias com título, subtítulo, corpo da matéria e até três imagens

Cada notícia vinculada a uma temporada específica

🔗 Relacionamentos Principais

Um usuário pode ter vários técnicos e jornalistas.

Um técnico pode comandar vários times ao longo da carreira.

Cada time possui múltiplas temporadas.

Jogadores pertencem a um técnico e possuem desempenho por temporada.

Cada temporada pode gerar várias notícias.

🎯 Objetivo do Projeto

Criar a base de um sistema capaz de registrar, acompanhar e apresentar a evolução completa da carreira de um treinador — desde estatísticas individuais até matérias jornalísticas simuladas. Ideal para quem joga modo carreira, cria histórias de save ou deseja desenvolver um portal avançado de estatísticas esportivas.
