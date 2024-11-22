-- roles table
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    role_type VARCHAR(50)
);

-- permissions table
CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    permission_type VARCHAR(50) NOT NULL
);

-- roles_permissions table
CREATE TABLE roles_permissions (
    role_id INT REFERENCES roles (id),
    permission_id INT REFERENCES permissions (id)
);

-- clients table 
CREATE TABLE clients (
    id BIGSERIAL PRIMARY KEY,
    role_id INT REFERENCES roles (id),
    name VARCHAR(100) NOT NULL CHECK (name <> ''),
    username VARCHAR(255) NOT NULL UNIQUE CHECK (username <> ''),
    email VARCHAR(100) NOT NULL UNIQUE CHECK (email <> ''),
    phone_number VARCHAR(100) NOT NULL UNIQUE CHECK (phone_number <> ''),
    password_hash VARCHAR(255) UNIQUE,
    bio TEXT,
    avatar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- posts table
CREATE TABLE posts (
    id BIGSERIAL PRIMARY KEY,
    client_id BIGINT REFERENCES clients (id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    caption VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- stories table
CREATE TABLE stories (
    id BIGSERIAL PRIMARY KEY,
    client_id BIGINT REFERENCES clients (id) ON DELETE CASCADE,
    music VARCHAR(255),
    caption VARCHAR(255),
    content_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- photos table
CREATE TABLE photos (
    id BIGSERIAL PRIMARY KEY,
    post_id BIGINT REFERENCES posts (id) ON DELETE CASCADE,
    photo_url VARCHAR(255),
    webp_url VARCHAR(255)
);

-- videos table
CREATE TABLE videos (
    id BIGSERIAL PRIMARY KEY,
    post_id BIGINT REFERENCES posts (id) ON DELETE CASCADE,
    video_url VARCHAR(255),
    hls_url VARCHAR(255)
);

-- tags table
CREATE TABLE tags (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- post_tags table
CREATE TABLE post_tags (
    post_id BIGINT REFERENCES posts (id),
    tag_id BIGINT REFERENCES tags (id),
    PRIMARY KEY (post_id, tag_id)
);

-- comments table
CREATE TABLE comments (
    id BIGSERIAL PRIMARY KEY,
    comment_text TEXT,
    client_id BIGINT REFERENCES clients (id) ON DELETE CASCADE,
    post_id BIGINT REFERENCES posts (id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- followers table
CREATE TABLE followers (
    follower_id BIGINT REFERENCES clients (id),
    following_id BIGINT REFERENCES clients (id),
    PRIMARY KEY (follower_id, following_id)
);

-- messages table
CREATE TABLE messages (
    id BIGSERIAL PRIMARY KEY,
    sender_id BIGINT REFERENCES clients (id),
    receiver_id BIGINT REFERENCES clients (id),
    message TEXT,
    date_time_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);