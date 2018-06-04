const addAuthEnpointsTo = require('./controllers/auth');

module.exports = (app) => {
  // AUTHENTICATION
  addAuthEnpointsTo(app);
};