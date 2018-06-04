require('dotenv').config();

//------------DEPENDENCIES------------//

const express = require('express')
    , connectDbTo = require('./database')
    , {default: addMiddlewaresTo} = require('./middlewares')
    , addEndpointsTo = require('./endpoints');

const app = express();

//-----------------ENV----------------//

const {DB_URI, SESSION_SECRET, SERVER_PORT} = process.env;

//---------INITIALIZE SERVER----------//

const initialize_web_server = async (app, port, db_uri, session_secret, connectDbTo, addMiddlewaresTo, addEndpointsTo) => {

  await connectDbTo(app, db_uri);
  await addMiddlewaresTo(app, session_secret);
  await addEndpointsTo(app);
  app.listen(port, () => console.log(`listening on port: ${port}`));

};

initialize_web_server(app, SERVER_PORT, DB_URI, SESSION_SECRET, connectDbTo, addMiddlewaresTo, addEndpointsTo);