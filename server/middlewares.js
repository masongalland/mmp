const bodyParser = require('body-parser')
    , session = require('express-session');

exports.default = function addMiddlewaresTo(app, session_secret) {

  // BODY PARSER
  app.use(bodyParser.json());

  // DATABASE
  app.use((req, res, next) => {
    const db = req.app.get('db');
    req.db = db;
    next();
  });

  // SESSION
  app.use(session({
    secret: session_secret,
    resave: false,
    saveUninitialized: false
  }));

  // DESERIALIZE
  app.use((req, res, next) => {
    let user_id = req.session.user || 1;
    if (user_id) {
        console.log("GETTING USER: " + user_id);
        req.db.read_user(user_id)
            .then(user => {
                req.user = user;
                next();
            })
            .catch(err => {
                console.log(err);
                res.status(500).send(err);
            });
    } else next();
  });
};

exports.requireAuthentication = (req, res, next) => {
  // if (!req.session.user) {
  if (!req.user || !req.user.id) {
      res.status(401).json("unauthorized");
  } else next();
};