library(tidyverse)
library(compmus)

glass_timbre <- read.csv("C:/Users/sargu/Downloads/Corpus/glass_timbre.csv")
carousel_timbre <- read.csv("C:/Users/sargu/Downloads/Corpus/carousel_timbressm.csv")
horses_timbre <- read.csv("C:/Users/sargu/Downloads/Corpus/horse_timbre.csv")

carousel_timbre_ssm <- carousel_timbre |>
  compmus_wrangle_timbre() |> 
  filter(row_number() %% 50L == 0L) |> 
  mutate(timbre = map(timbre, compmus_normalise, "euclidean")) |>
  compmus_self_similarity(timbre, "cosine") |> 
  ggplot(
    aes(
      x = xstart + xduration / 2,
      width = 50 * xduration,
      y = ystart + yduration / 2,
      height = 50 * yduration,
      fill = d
    )
  ) +
  geom_tile() +
  coord_fixed() +
  scale_fill_viridis_c(guide = "none") +
  theme_classic() +
  labs(x = "", y = "", title= "Timbre SSM of 'Carousel'")

glass_ssm <- glass_timbre |>
  compmus_wrangle_timbre() |> 
  filter(row_number() %% 50L == 0L) |> 
  mutate(timbre = map(timbre, compmus_normalise, "euclidean")) |>
  compmus_self_similarity(timbre, "cosine") |> 
  ggplot(
    aes(
      x = xstart + xduration / 2,
      width = 50 * xduration,
      y = ystart + yduration / 2,
      height = 50 * yduration,
      fill = d
    )
  ) +
  geom_tile() +
  coord_fixed() +
  scale_fill_viridis_c(guide = "none") +
  theme_classic() +
  labs(x = "", y = "", title= "Timbre SSM of 'Broken Glass'")

horse_ssm <- horses_timbre |>
  compmus_wrangle_timbre() |> 
  filter(row_number() %% 50L == 0L) |> 
  mutate(timbre = map(timbre, compmus_normalise, "euclidean")) |>
  compmus_self_similarity(timbre, "cosine") |>
  ggplot(
    aes(
      x = xstart + xduration / 2,
      width = 50 * xduration,
      y = ystart + yduration / 2,
      height = 50 * yduration,
      fill = d
    )
  ) +
  geom_tile() +
  coord_fixed() +
  scale_fill_viridis_c(guide = "none") +
  theme_classic() +
  labs(x = "", y = "", title= "Timbre SSM of 'White Horses'")


mots_down <- mots_chromagram |> slice(seq(1, n(), by = 30))
mots_down_timbre <- mots_cepstro |> slice(seq(1, n(), by = 60))

timbre_plot <- mots_down_timbre |>
  compmus_wrangle_timbre() |>
  mutate(timbre = map(timbre, compmus_normalise, "euclidean")) |>
  compmus_self_similarity(timbre, "euclidean") |>
  ggplot(aes(
    x = xstart + xduration / 2,
    width = xduration,
    y = ystart + yduration / 2,
    height = yduration,
    fill = d
  )) +
  geom_tile() +
  coord_fixed() +
  scale_fill_viridis_c(guide = "none") +
  theme_minimal() +
  xlab("") + ylab("")

chromagram_plot <- mots_down |>
  compmus_wrangle_chroma() |>
  mutate(pitches = map(pitches, compmus_normalise, "manhattan")) |>
  compmus_self_similarity(pitches, "cosine") |>
  ggplot(aes(
    x = xstart + xduration / 2,
    width = xduration,
    y = ystart + yduration / 2,
    height = yduration,
    fill = d
  )) +
  geom_tile() +
  coord_fixed() +
  scale_fill_viridis_c(guide = "none") +
  theme_minimal() +
  xlab("") + ylab("")
