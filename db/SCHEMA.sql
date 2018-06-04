create table users (
  id serial primary key,
  username varchar(50) unique not null,
  password varchar(80) not null,
  first_name varchar(80),
  last_name varchar(80),
  email varchar(80),
  photo text
);

create table friends (
  id serial primary key,
  user_id integer references users(id),
  friend_id integer references users(id)
);

create table recipes (
  id serial primary key,
  owner_id integer references users (id),
  recipe_name varchar(60),
  recipe_photo text,
  description varchar(250),
  servings int,
  prep_time int,
  meal varchar(10),
  tags text array,
  privacy_setting text
);

create table steps (
  id serial primary key,
  recipe_id integer references recipes(id),
  step_number int,
  step_category varchar(30),
  description varchar(300)
);

create table subscribers (
  id serial primary key,
  owner_id integer references users(id),
  subscriber_id integer references users(id),
  recipe_id integer references recipes(id)
);

create table categories (
  id serial primary key,
  category_name varchar(40)
);

create table raw_ingredients (
  id serial primary key,
  ingredient_name varchar(25),
  ingredient_category integer references categories(id)
);

create table recipe_ingredients (
  id serial primary key,
  raw_ingredient_id integer references raw_ingredients(id),
  recipe_id integer references recipes(id),
  amount text,
  mesurement_unit varchar(20)
);

create table tools (
  id serial primary key,
  recipe_id integer references recipes(id),
  tool_name varchar(25),
  quantity varchar(30)
);

create table current_week_meals (
  id serial primary key,
  user_id integer references users(id),
  recipe_id integer references recipes(id),
  day_of_week varchar(25),
  servings integer
);

create table next_week_meals (
  id serial primary key,
  user_id integer references users(id),
  recipe_id integer references recipes(id),
  day_of_week varchar(25),
  servings integer
);

create table comments (
  id serial primary key,
  user_id integer references users(id),
  recipe_id integer references recipes(id),
  comment_date timestamp,
  comment_text text
);

create table ratings (
  id serial primary key,
  user_id integer references users(id),
  recipe_id integer references recipes(id),
  rating integer
);
