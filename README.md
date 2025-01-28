# 🎬 Blockbuster 2.0

Welcome to **Blockbuster 2.0** 🍿, a modern take on the classic movie rental system! This Ruby application allows users to create accounts, log in, and rent movies from a vast selection. Get ready to binge-watch your favorite films with just a few clicks! 🎥🍿

## 🎥 Vimeo Link

You can view the app in action here:

[Blockbuster 2.0 Demo 🎬](https://vimeo.com/manage/videos/438258720)

## 📋 Requirements

- Ruby 2.7 or higher 🦾
- TTY::Box gem for a stylish banner 🎨
- RestClient gem for making API requests 🌐
- JSON gem for parsing API responses 🔍
- TTY::Prompt gem for interactive prompts 📝

## 🛠️ Setup

1. Clone this repository:
    ```bash
    git clone https://github.com/Lix311/Blockbuster_2.0
    cd blockbuster-2.0
    ```

2. Checkout the `Alex` branch for the working branch:
    ```bash
    git checkout Alex
    ```

3. Install dependencies:
    ```bash
    gem install bundler
    bundle install
    ```

4. Start the application:
    ```bash
    ruby run.rb
    ```

## 🌟 Features

- **Create Account**: Users can create new accounts with a username, age, credit card, email, phone number, and password ✍️.
- **Sign-In**: Existing users can log in with their username and password 🔑.
- **Rent Movies**: Search and rent movies by various criteria:
    - Popular list 🔥
    - Movie title 📜
    - Genre 🎭
    - Personalized recommendations 💡
    - High-rated movies 🌟
- **View My Movies**: Check out the list of movies you've rented 🎬.
- **Settings**: Manage your account settings ⚙️.

## 🎮 Usage

Once the app is running, you'll be prompted with these options:

1. **Create Account** – New to Blockbuster? Create your account! 🆕
2. **Sign-In** – Already have an account? Log in with your username and password! 🔐

After logging in, you'll have access to the main menu with options to:

- **Rent Movie**: Search for movies to rent 🎥.
- **My Movies**: View your rented movies 📅.
- **Settings**: Manage your account settings ⚙️.
- **Exit**: Quit the application (but why would you? 😉).

### 🔍 Rent Movie Search Options

- **By Blockbuster 2.0 Popular List**: Rent from the hottest movies 🔥.
- **By Title**: Search for movies by title 📜.
- **By Genre**: Find movies by genre 🎭.
- **By Blockbuster 2.0 Recommendation for You**: Rent movies based on your preferences 🤩.
- **By Blockbuster 2.0 Rating**: Rent top-rated movies 🌟.

### 🍿 Renting a Movie

When you find a movie, its details (title, overview, genre, rating, etc.) will be displayed, and you’ll be prompted to rent it. You have 3 days to watch it—just like a true movie lover! 🎬⏳
