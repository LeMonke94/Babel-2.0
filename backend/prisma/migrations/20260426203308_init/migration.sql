-- CreateEnum
CREATE TYPE "Region" AS ENUM ('Fontaine', 'Inazuma', 'Liyue', 'Mondstadt', 'Natlan', 'Nod_Krai', 'Snezhnaya', 'Sumeru');

-- CreateEnum
CREATE TYPE "Element" AS ENUM ('Anemo', 'Cryo', 'Dendro', 'Electro', 'Geo', 'Hydro', 'Pyro');

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('Dps', 'SubDps', 'Support');

-- CreateEnum
CREATE TYPE "WeaponType" AS ENUM ('Bow', 'Catalyst', 'Claymore', 'Polearm', 'Sword');

-- CreateEnum
CREATE TYPE "AscensionStat" AS ENUM ('CritRate', 'CritDamage');

-- CreateTable
CREATE TABLE "Character" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "rarity" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "affiliation" TEXT NOT NULL,
    "region" "Region" NOT NULL,
    "element" "Element" NOT NULL,
    "role" "Role" NOT NULL,
    "weaponType" "WeaponType" NOT NULL,
    "ascensionStattype" "AscensionStat" NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CharacterStat" (
    "id" SERIAL NOT NULL,
    "characterId" INTEGER NOT NULL,
    "level" INTEGER NOT NULL,
    "ascension" INTEGER NOT NULL,
    "hp" INTEGER NOT NULL,
    "atk" INTEGER NOT NULL,
    "def" INTEGER NOT NULL,
    "ascensionStatValue" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "CharacterStat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserCharacter" (
    "userId" TEXT NOT NULL,
    "characterId" INTEGER NOT NULL,
    "characterLevel" INTEGER NOT NULL DEFAULT 1,
    "characterAscension" INTEGER NOT NULL DEFAULT 0,
    "friendshipLevel" INTEGER NOT NULL DEFAULT 0,
    "normalAttackLevel" INTEGER NOT NULL DEFAULT 1,
    "elementalSkillLevel" INTEGER NOT NULL DEFAULT 1,
    "elementalBurstLevel" INTEGER NOT NULL DEFAULT 1,
    "hexereiUnlocked" BOOLEAN NOT NULL DEFAULT false,
    "constellation" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "UserCharacter_pkey" PRIMARY KEY ("userId","characterId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Character_name_key" ON "Character"("name");

-- CreateIndex
CREATE UNIQUE INDEX "CharacterStat_characterId_level_ascension_key" ON "CharacterStat"("characterId", "level", "ascension");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "CharacterStat" ADD CONSTRAINT "CharacterStat_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCharacter" ADD CONSTRAINT "UserCharacter_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCharacter" ADD CONSTRAINT "UserCharacter_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;
