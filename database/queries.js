import { prisma } from "../lib/prisma.js";

// USER QUERIES
// Create query method to get user by email
const getUserByEmail = async (email) => {
  const user = await prisma.user.findUnique({
    where: {
      email: email,
    },
  });

  return user;
};

// Create method to get user by id
const getUserById = async (userId) => {
  const user = await prisma.user.findUnique({
    where: {
      id: userId,
    },
  });

  return user;
};

export { getUserByEmail, getUserById };
