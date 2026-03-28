library(tidyverse)
library(compmus)

glass_novelty |>
  ggplot(aes(x = TIME, y = VALUE)) +
  geom_line() +
  xlim(150, 212) +                         # Adjust the limits to the desired time range
  theme_minimal() +
  labs(x = "Time (s)", y = "Novelty")

glass_act |> 
  pivot_longer(-TIME, names_to = "tempo") |> 
  mutate(tempo = as.numeric(tempo)) |> 
  ggplot(aes(x = TIME, y = tempo, fill = value)) +
  geom_raster() +
  scale_y_continuous(transform = c("reciprocal", "reverse"), breaks = seq(50, 350, 100)) +    
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)", title = "Broken Glass ACT") +
  theme_classic()

glass_dft |> 
  pivot_longer(-TIME, names_to = "tempo") |> 
  mutate(tempo = as.numeric(tempo)) |> 
  ggplot(aes(x = TIME, y = tempo, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)", title = "Broken Glass") +
  theme_classic()

horses_novelty |>
  ggplot(aes(x = TIME, y = VALUE)) +
  geom_line() +
  xlim(0, 100) +                         # Adjust the limits to the desired time range
  theme_minimal() +
  labs(x = "Time (s)", y = "Novelty")

horses_act |> 
  pivot_longer(-TIME, names_to = "tempo") |> 
  mutate(tempo = as.numeric(tempo)) |> 
  ggplot(aes(x = TIME, y = tempo, fill = value)) +
  geom_raster() +
  scale_y_continuous(transform = c("reciprocal", "reverse"), breaks = seq(50, 350, 100)) +    
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)", title = " White Horses") +
  theme_classic()

horses_dft |> 
  pivot_longer(-TIME, names_to = "tempo") |> 
  mutate(tempo = as.numeric(tempo)) |> 
  ggplot(aes(x = TIME, y = tempo, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)", title = " White Horses DFT") +
  theme_classic()


carousel_novelty |>
  ggplot(aes(x = TIME, y = VALUE)) +
  geom_line() +
  xlim(0, 200) +                         # Adjust the limits to the desired time range
  theme_minimal() +
  labs(x = "Time (s)", y = "Novelty")

carousel_act |> 
  pivot_longer(-TIME, names_to = "tempo") |> 
  mutate(tempo = as.numeric(tempo)) |> 
  ggplot(aes(x = TIME, y = tempo, fill = value)) +
  geom_raster() +
  scale_y_continuous(transform = c("reciprocal", "reverse"), breaks = seq(50, 350, 100)) +    
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)", title = "Carousel ACT") +
  theme_classic()

carousel_dft |> 
  pivot_longer(-TIME, names_to = "tempo") |> 
  mutate(tempo = as.numeric(tempo)) |> 
  ggplot(aes(x = TIME, y = tempo, fill = value)) +
  geom_raster() +
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)", title = "Carousel DFT") +
  theme_classic()
