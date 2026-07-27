// Create a controller to render the homepage
async function getHomepage(req, res) {
  // get user stored in session
  const user = req.user || null;

  res.render("pages/home", { user });
}

export { getHomepage };
