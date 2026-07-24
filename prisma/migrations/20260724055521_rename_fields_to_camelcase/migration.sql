/*
  Warnings:

  - You are about to drop the column `storage_path` on the `files` table. All the data in the column will be lost.
  - Added the required column `storagePath` to the `files` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "files" DROP COLUMN "storage_path",
ADD COLUMN     "storagePath" TEXT NOT NULL;
