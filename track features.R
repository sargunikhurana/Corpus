library(tidyverse)
library(dplyr)
library(tidyr)

matter <- read.csv("C:/Users/sargu/Downloads/CM actual/amot.csv")
clearing <- read.csv("C:/Users/sargu/Downloads/CM actual/the_clearing.csv")
older <- read.csv("C:/Users/sargu/Downloads/CM actual/older_and_wiser.csv")


albums <-
  bind_rows(
    matter |> mutate(Category = "A Matter of Time"),
    clearing |> mutate(Category = "The Clearing"),
    older |> mutate(Category = "Older and Wiser")
  ) 

albums|>
  ggplot(aes(x = Category, y = Energy)) +
  geom_boxplot()

albums|>
  ggplot(aes(x = Category, y = Acousticness)) +
  geom_boxplot()

albums|>
  ggplot(aes(x = Category, y = Instrumentalness)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(-5, 5))


albums|>
  ggplot(aes(x = Category, y = Danceability)) +
  geom_boxplot()

albums|>
  ggplot(aes(x = Category, y = Loudness,fill = Category)) +
  geom_boxplot()  +
  scale_fill_manual(values = c("turquoise", "lightgreen", "forestgreen"))+
  theme_minimal() +
  theme(legend.position = "none")


albums_long <- albums |>
  select(Category, Acousticness, Danceability, Energy, Valence) |>
  pivot_longer(
    cols = -Category,
    names_to = "Feature",
    values_to = "Value"
  )

ggplot(albums_long, aes(Feature, Value, fill = Category)) +
  geom_boxplot() +
  scale_fill_manual(values = c("turquoise", "lightgreen", "forestgreen")) +
  labs(title = "Audio Feature Comparison Across Albums",
       fill = NULL) +
  theme_minimal() +
  theme(legend.position = "top")
