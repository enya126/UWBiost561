load("vignettes/HW4_simulation.RData")

trial1_n10 <- level_trial_list[["n:10"]]$`Trial: 1`
trial2_n10 <- level_trial_list[["n:10"]]$`Trial: 2`
trial3_n10 <- level_trial_list[["n:10"]]$`Trial: 3`

trial1_n30 <- level_trial_list[["n:30"]]$`Trial: 1`
trial2_n30 <- level_trial_list[["n:30"]]$`Trial: 2`
trial3_n30 <- level_trial_list[["n:30"]]$`Trial: 3`

# Helper to extract edge densities
get_status <- function(trial) {
  sapply(trial, function(impl) impl$status)
}

trial1_n10 <- get_status(trial1_n10)
trial2_n10 <- get_status(trial2_n10)
trial3_n10 <- get_status(trial3_n10)

trial1_n30 <- get_status(trial1_n30)
trial2_n30 <- get_status(trial2_n30)
trial3_n30 <- get_status(trial3_n30)

# Combine into a data frame for plotting
df <- data.frame(
  Implementation = rep(1:15, 2),
  status = c(trial1_n10, trial1_n30),
  group = factor(rep(c("n=10", "n=30"), each = 15))
)

# Plot using ggplot2
library(ggplot2)
plot <- ggplot(df, aes(x = Implementation, y = status, color = status))+
  geom_point() +
  facet_wrap(~ group, labeller = label_both) +
  labs(title = "Completion Status per Implementation", y = "Status")

ggsave("HW4_simulation.png", plot = plot, width = 6, height = 4, dpi = 300)

