INSERT INTO users (username, hash, first_name, last_name, email)
VALUES (${un}, ${hash}, ${fn}, ${ln}, ${em})
returning *;