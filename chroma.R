library(tidyverse)
library(compmus)
library(dplyr)

glass_chroma <- read.csv("C:/Users/sargu/Downloads/CM actual/glass_chromagram.csv")
carousel_chroma <- read.csv("C:/Users/sargu/Downloads/CM actual/carousel_chromagram.csv")
horses_chroma <- read.csv("C:/Users/sargu/Downloads/CM actual/horses_chromagram.csv")


glass_chroma <- glass_chroma|> 
  rename(
    `C#` = `C.` ,
    `F#`= `F.`
  )

carousel_chroma <- carousel_chroma|> 
  rename(
    `C#` = `C.` ,
    `F#`= `F.`
  )

horses_chroma <- horses_chroma|> 
  rename(
    `C#` = `C.` ,
    `F#`= `F.`
  )

glass_chroma |>
  compmus_wrangle_chroma() |> 
  mutate(pitches = map(pitches, compmus_normalise, "chebyshev")) |>
  compmus_gather_chroma() |> 
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = pitch_class,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude", title= "Chromagram of 'Broken Glass'") +
  theme_minimal() +
  scale_fill_viridis_c()

horses_chroma |>
  compmus_wrangle_chroma() |> 
  mutate(pitches = map(pitches, compmus_normalise, "chebyshev")) |>
  compmus_gather_chroma() |> 
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = pitch_class,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude", title= "Chromagram of 'White Horses'") +
  theme_minimal() +
  scale_fill_viridis_c()

carousel_chroma |>
  compmus_wrangle_chroma() |> 
  mutate(pitches = map(pitches, compmus_normalise, "chebyshev")) |>
  compmus_gather_chroma() |> 
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = pitch_class,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude", title= "Chromagram of 'Carousel'") +
  theme_minimal() +
  scale_fill_viridis_c()
