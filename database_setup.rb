CONNECTION=SQLite3::Database.new("/Users/gwendolyn/code/06-29-css-flashcards/flashcards.db")
CONNECTION.results_as_hash = true
CONNECTION.execute("PRAGMA foreign_keys = ON;")


CONNECTION.execute("CREATE TABLE IF NOT EXISTS css_definitions (id INTEGER PRIMARY KEY, name TEXT NOT NULL, definition TEXT NOT NULL, example TEXT NOT NULL);")