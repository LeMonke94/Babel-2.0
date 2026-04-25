# Project Setup
    1. Install Node.js
    2. Install TypeScript with the Type Definitions
    3. Initialise npm-Project
    4. Install Express + 

# Technology-Stack
Runtime - Node.js
Framework - Express
Database ORM - Prisma + Postgres
Validator - Zod

# Mental Model Notes for clarification
    1. Type definitions are only needed at compile time -> Dev Dependencies
    2. prisma is just the "toolbox" -> Dev @prisma/client is for the Postgres queries -> regular Dependency
    
    Prisma
    1. schema.prisma:
        generator client -> erzeuge ein client für das schema im output ...
        datasource db -> dialekt bestimmung für kommunikation mit db
    2. prisma.config.ts:
        pfade für prisma schema/migrations/db
