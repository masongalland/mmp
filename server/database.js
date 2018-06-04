const massive = require('massive');

module.exports = (app, db_uri) => {
	return massive(db_uri)
		.then(db => {
			console.log("Connected To Database");
			app.set('db', db);
		})
		.catch(err => {
			console.log("Database Error");
			console.log(err);
		});
}
