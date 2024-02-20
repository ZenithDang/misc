CREATE TABLE IF NOT EXISTS anime (
    anime_id INTEGER NOT NULL,
    title VARCHAR(255),
    type VARCHAR(255),
    episodes INTEGER,
    year INTEGER,
    season INTEGER,
    status VARCHAR(255),
    score FLOAT,
    ranking INTEGER,
    popularity INTEGER,
    members INTEGER,
    PRIMARY KEY (anime_id)
);

CREATE TABLE IF NOT EXISTS synonyms (
    synonym_id INTEGER PRIMARY KEY,
    synonym TEXT,
    anime_id INTEGER,
    FOREIGN KEY (anime_id) REFERENCES anime(anime_id)
);

CREATE TABLE IF NOT EXISTS tags (
    tag_id INTEGER PRIMARY KEY,
    tag TEXT
);

CREATE TABLE IF NOT EXISTS tags_bridging (
    anime_id INTEGER,
    tag_id INTEGER,
    PRIMARY KEY (anime_id, tag_id),
    FOREIGN KEY (anime_id) REFERENCES anime(anime_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

CREATE TABLE IF NOT EXISTS source (
    source_id INTEGER,
    name VARCHAR(255),
    PRIMARY KEY (source_id)
);

CREATE TABLE IF NOT EXISTS source_bridging (
    anime_id INTEGER,
    source_id INTEGER,
    PRIMARY KEY (anime_id, source_id),
    FOREIGN KEY (anime_id) REFERENCES anime(anime_id),
    FOREIGN KEY (source_id) REFERENCES source(source_id)
);

CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    gender VARCHAR(255),
    birthday DATE,
    link VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS reviews (
    review_id INTEGER PRIMARY KEY,
    review TEXT,
    overall_score INTEGER,
    story_score INTEGER,
    animation_score INTEGER,
    sound_score INTEGER,
    character_score INTEGER,
    enjoyment_score INTEGER,
    link VARCHAR(255),
    anime_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (anime_id) REFERENCES anime(anime_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS user_favorite_anime (
    user_id INTEGER,
    anime_id INTEGER,
    PRIMARY KEY (user_id, anime_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (anime_id) REFERENCES anime (anime_id)
);
