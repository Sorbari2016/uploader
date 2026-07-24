import passport from "passport";
import { prisma } from "../lib/prisma.js";

// Create initial data to work with
async function main() {
  // create a new user with a folder, and a file
  const user = await prisma.user.create({
    data: {
      firstName: "Clematins",
      lastName: "Nwiibee",
      email: "clematins@gmail.com",
      password: "#1Blessing",
      folders: {
        create: {
          name: "Project",
        },
      },
    },
    include: {
      folders: true,
    },
  });
  console.log("Created user:", user);

  // Fetch all users with their folders
  const allUsers = await prisma.user.findMany({
    include: {
      folders: true,
    },
  });
  console.log("All users:", JSON.stringify(allUsers, null, 2));
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
