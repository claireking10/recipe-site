# recipe-site
Dynamic multi-page recipe web application using Express.js, EJS for templating, MySQL for database storage, and client-side Javascript. Allows for users to browse recipes by protein source, search for recipes, create recipes, etc.

# Setup Instructions

## 1. Clone the Repository

```bash
git clone <repo-url>
cd recipe-site
```

Alternatively, you can use Git Desktop to easily pull the repository outside of command line.

## 2. Install Dependencies
Ensure you have Node.js and npm installed. Then run:
```bash
npm install
```

## 3. Set Up the Database
First, make sure MySQL is installed and running. Then, create a new database:
```bash
CREATE DATABASE recipe_db;
```
Then, import the provided SQL file:
```bash
mysql -u <your-username> -p recipe_db < path/to/recipe.sql
```

## 4. Configure Environment Variables
In the provided .env file, modify the variables to fit your database credentials.
```bash
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=recipe_db
PORT=3000
```

## 5. Start the Application
```bash
npm start
```
Open your browser and navigate to http://localhost:3000
