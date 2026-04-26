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



# Mental Models / Notes for understanding

## Package.json
1. TypeScript Type definitions are only needed at compile time -> Dev Dependencies
2. prisma is the CLI and the engine that builds my custom type-safe database library from my schemas -> Dev Dependency
3. @prisma/client is the frame with the basics that gets filled by prisma with my custom database library later -> Dependency

## Prisma
1. schema.prisma:
    generator client:   create a client for my defined schema and place it in the output location
    datasource db:      defines the dialect for the database communication

2. prisma.config.ts:
    paths for schema / migrations / db that prisma will use



on character display it will calculate the stats from CharacterStat model, and then add the bonuses to the baseline stats from a file:
    
    em                      Int
    critRate                Float
    critDamage              Float
    healingBonus            Float
    incomingHealingBonus    Float
    er                      Float
    cdReduction             Float
    shieldStrength          Float

    pyroDmgBonus            Float
    pyroRes                 Float
    hydroDmgBonus           Float
    hydroRes                Float
    dendroDmgBonus          Float
    dendroRes               Float
    electroDmgBonus         Float
    electroRes              Float
    anemoDmgBonus           Float
    anemoRes                Float
    cryoDmgBonus            Float
    cryoRes                 Float
    geoDmgBonus             Float
    geoRes                  Float
    physicalDmgBonus        Float
    physicalRes             Float
