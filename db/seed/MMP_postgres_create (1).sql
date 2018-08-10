CREATE TABLE users (
	user_id serial NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password varchar(80) NOT NULL,
	first_name varchar(80) NOT NULL,
	last_name varchar(80) NOT NULL,
	email varchar(80) NOT NULL,
	photo TEXT,
	CONSTRAINT users_pk PRIMARY KEY (user_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE friendships (
	friendship_id serial NOT NULL,
	user_id serial NOT NULL,
	friend_id serial NOT NULL,
	CONSTRAINT friendships_pk PRIMARY KEY (friendship_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE recipes (
	recipe_id serial NOT NULL,
	owner_id serial NOT NULL,
	recipe_name varchar(60) NOT NULL,
	recipe_photo TEXT,
	description varchar(250),
	servings integer NOT NULL,
	prep_time integer,
	meal varchar(10),
	tags TEXT,
	privacy_setting TEXT NOT NULL,
	CONSTRAINT recipes_pk PRIMARY KEY (recipe_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE steps (
	step_id serial NOT NULL,
	recipe_id integer NOT NULL,
	CONSTRAINT steps_pk PRIMARY KEY (step_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE subscriptions (
	subscription_id serial NOT NULL,
	owner_id integer NOT NULL,
	subscriber_id integer NOT NULL,
	recipe_id integer NOT NULL,
	CONSTRAINT subscriptions_pk PRIMARY KEY (subscription_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE categories (
	category_id serial NOT NULL,
	name varchar(40) NOT NULL,
	CONSTRAINT categories_pk PRIMARY KEY (category_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE raw_ingredients (
	ingredient_id serial NOT NULL,
	name varchar(40) NOT NULL,
	category integer NOT NULL,
	CONSTRAINT raw_ingredients_pk PRIMARY KEY (ingredient_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE recipe_ingredients (
	ingredient_id serial NOT NULL,
	raw_ingredient_id integer NOT NULL,
	recipe_id integer NOT NULL,
	amount TEXT NOT NULL,
	measurement_unit varchar(20) NOT NULL,
	CONSTRAINT recipe_ingredients_pk PRIMARY KEY (ingredient_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE tools (
	tool_id serial NOT NULL,
	recipe_id integer NOT NULL,
	name varchar(25) NOT NULL,
	quantity varchar(30) NOT NULL DEFAULT '1',
	CONSTRAINT tools_pk PRIMARY KEY (tool_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE meals (
	meal_id serial NOT NULL,
	user_id integer NOT NULL,
	recipe_id integer NOT NULL,
	week integer NOT NULL,
	day_of_week varchar(25) NOT NULL,
	servings integer NOT NULL,
	CONSTRAINT meals_pk PRIMARY KEY (meal_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE comments (
	comment_id serial NOT NULL,
	user_id integer NOT NULL,
	recipe_id integer NOT NULL,
	date TIMESTAMP NOT NULL,
	comment varchar(250) NOT NULL,
	CONSTRAINT comments_pk PRIMARY KEY (comment_id)
) WITH (
  OIDS=FALSE
);
CREATE TABLE ratings (
	rating_id serial NOT NULL,
	user_id integer NOT NULL,
	recipe_id integer NOT NULL,
	rating integer NOT NULL,
	CONSTRAINT ratings_pk PRIMARY KEY (rating_id)
) WITH (
  OIDS=FALSE
);
ALTER TABLE friendships ADD CONSTRAINT friendships_fk0 FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE friendships ADD CONSTRAINT friendships_fk1 FOREIGN KEY (friend_id) REFERENCES users(user_id);
ALTER TABLE recipes ADD CONSTRAINT recipes_fk0 FOREIGN KEY (owner_id) REFERENCES users(user_id);
ALTER TABLE steps ADD CONSTRAINT steps_fk0 FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);
ALTER TABLE subscriptions ADD CONSTRAINT subscriptions_fk0 FOREIGN KEY (owner_id) REFERENCES users(user_id);
ALTER TABLE subscriptions ADD CONSTRAINT subscriptions_fk1 FOREIGN KEY (subscriber_id) REFERENCES users(user_id);
ALTER TABLE subscriptions ADD CONSTRAINT subscriptions_fk2 FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);
ALTER TABLE raw_ingredients ADD CONSTRAINT raw_ingredients_fk0 FOREIGN KEY (category) REFERENCES categories(category_id);
ALTER TABLE recipe_ingredients ADD CONSTRAINT recipe_ingredients_fk0 FOREIGN KEY (raw_ingredient_id) REFERENCES raw_ingredients(ingredient_id);
ALTER TABLE recipe_ingredients ADD CONSTRAINT recipe_ingredients_fk1 FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);
ALTER TABLE tools ADD CONSTRAINT tools_fk0 FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);
ALTER TABLE meals ADD CONSTRAINT meals_fk0 FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE meals ADD CONSTRAINT meals_fk1 FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);
ALTER TABLE comments ADD CONSTRAINT comments_fk0 FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE comments ADD CONSTRAINT comments_fk1 FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);
ALTER TABLE ratings ADD CONSTRAINT ratings_fk0 FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE ratings ADD CONSTRAINT ratings_fk1 FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);
