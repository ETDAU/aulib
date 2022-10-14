library(ggplot2)


table(sample(LETTERS[1:6],
               size = 100,
               replace = T)) %>%
    as.data.frame() %>%
  # create a bar graph with the fake data
  ggplot(aes(x = Var1,
             y = Freq,
             fill = Var1)) +
  geom_bar(stat = "identity",
           position = position_dodge(.8)) +
  scale_y_continuous("Count") +
  scale_x_discrete("") +
  au_minimal_theme()
