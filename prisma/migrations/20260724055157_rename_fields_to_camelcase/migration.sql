/*
  Warnings:

  - You are about to drop the column `folder_id` on the `files` table. All the data in the column will be lost.
  - You are about to drop the column `owner_id` on the `files` table. All the data in the column will be lost.
  - You are about to drop the column `owner_id` on the `folders` table. All the data in the column will be lost.
  - You are about to drop the column `parent_id` on the `folders` table. All the data in the column will be lost.
  - Added the required column `ownerId` to the `files` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ownerId` to the `folders` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "files" DROP CONSTRAINT "files_folder_id_fkey";

-- DropForeignKey
ALTER TABLE "files" DROP CONSTRAINT "files_owner_id_fkey";

-- DropForeignKey
ALTER TABLE "folders" DROP CONSTRAINT "folders_owner_id_fkey";

-- DropForeignKey
ALTER TABLE "folders" DROP CONSTRAINT "folders_parent_id_fkey";

-- DropIndex
DROP INDEX "files_owner_id_folder_id_idx";

-- DropIndex
DROP INDEX "folders_owner_id_parent_id_idx";

-- AlterTable
ALTER TABLE "files" DROP COLUMN "folder_id",
DROP COLUMN "owner_id",
ADD COLUMN     "folderId" INTEGER,
ADD COLUMN     "ownerId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "folders" DROP COLUMN "owner_id",
DROP COLUMN "parent_id",
ADD COLUMN     "ownerId" INTEGER NOT NULL,
ADD COLUMN     "parentId" INTEGER;

-- CreateIndex
CREATE INDEX "files_ownerId_folderId_idx" ON "files"("ownerId", "folderId");

-- CreateIndex
CREATE INDEX "folders_ownerId_parentId_idx" ON "folders"("ownerId", "parentId");

-- AddForeignKey
ALTER TABLE "folders" ADD CONSTRAINT "folders_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "folders" ADD CONSTRAINT "folders_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "folders"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "files" ADD CONSTRAINT "files_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "files" ADD CONSTRAINT "files_folderId_fkey" FOREIGN KEY ("folderId") REFERENCES "folders"("id") ON DELETE SET NULL ON UPDATE CASCADE;
