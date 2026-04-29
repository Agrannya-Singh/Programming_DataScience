# ============================================================
# Lab 42 - Querying SQLite Song Database in R
# Packages: DBI, RSQLite, dplyr | Reg. No: 23BCE0965
# ============================================================

for (pkg in c('DBI','RSQLite','dplyr')) {
  if (!requireNamespace(pkg, quietly = TRUE))
    install.packages(pkg)
  library(pkg, character.only = TRUE)
}

# --- Step 1: Validate file ----
db_path <- file.path(getwd(), 'songs.db')
if (!file.exists(db_path))
  stop(paste('Database not found:', db_path,
             '\nPlace songs.db in the working directory.'))

# --- Step 2: Connect ----
con <- dbConnect(RSQLite::SQLite(), dbname = db_path)
cat('Connected to:', db_path, '\n')

# --- Step 3: Inspect tables ----
available <- dbListTables(con)
cat('Tables:', paste(available, collapse = ', '), '\n')
if (!'songs' %in% available) {
  dbDisconnect(con); stop('Table songs not found.')
}

# --- Step 4: Lazy tbl reference ----
songs_tbl <- tbl(con, 'songs')
cat('Columns:', paste(colnames(songs_tbl), collapse = ', '), '\n')

# --- Step 5: Build and show query ----
ARTIST_ID <- 11L  # Queen
queen_query <- songs_tbl |>
  filter(artist_id == ARTIST_ID) |>
  select(title, artist_id)
cat('\n=== Generated SQL ===\n')
show_query(queen_query)

# --- Step 6: Collect results ----
queen_songs <- queen_query |> collect()
cat('\n=== Queen Songs (artist_id =', ARTIST_ID, ') ===\n')
print(queen_songs)
cat('Total:', nrow(queen_songs), 'songs\n')

# --- Step 7: Aggregate - top 10 artists ----
cat('\n=== Top 10 Artists by Song Count ===\n')
print(songs_tbl |>
  group_by(artist_id) |>
  summarise(song_count = n(), .groups = 'drop') |>
  arrange(desc(song_count)) |>
  head(10) |> collect())

# --- Step 8: Raw SQL alternative ----
sql <- paste('SELECT title, artist_id FROM songs',
             'WHERE artist_id =', ARTIST_ID, 'ORDER BY title ASC')
cat('\n=== Raw SQL Result ===\n')
print(dbGetQuery(con, sql))

# --- Step 9: Disconnect ----
dbDisconnect(con)
cat('Connection closed.\n')
