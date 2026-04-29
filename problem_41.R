# Created by Agrannya Singh (23BCE0965)
# Problem 41: Database Querying with dbplyr and RSQLite

if (!requireNamespace('DBI', quietly = TRUE)) install.packages('DBI')
if (!requireNamespace('RSQLite', quietly = TRUE)) install.packages('RSQLite')
if (!requireNamespace('dplyr', quietly = TRUE)) install.packages('dplyr')
if (!requireNamespace('dbplyr', quietly = TRUE)) install.packages('dbplyr')
library(DBI)
library(RSQLite)
library(dplyr)
library(dbplyr)

# --- Step 1: Create in-memory SQLite database with sample data ----
con <- dbConnect(RSQLite::SQLite(), ":memory:")

# Create songs table with sample data
songs_df <- data.frame(
  id = 1:20,
  title = c('Bohemian Rhapsody', 'We Will Rock You', 'We Are The Champions',
            'Somebody To Love', 'Dont Stop Me Now', 'Under Pressure',
            'Radio Gaga', 'I Want To Break Free', 'Killer Queen',
            'Another One Bites The Dust', 'Stairway To Heaven',
            'Hotel California', 'Imagine', 'Yesterday', 'Hey Jude',
            'Let It Be', 'Come Together', 'Thriller', 'Beat It', 'Billie Jean'),
  artist_id = c(11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
                12, 13, 14, 15, 15, 15, 15, 16, 16, 16),
  stringsAsFactors = FALSE
)
dbWriteTable(con, 'songs', songs_df)

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
