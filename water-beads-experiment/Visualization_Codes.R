# Hydrogel Water Beads Experiment - Visualization Code

library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)
library(scales)

# Set global theme
theme_set(theme_bw(base_size = 12))

# DATA INPUT

swelling_data <- data.frame(
  Time_min = c(0, 5, 10, 20, 30, 40, 60, 90, 120, 150, 180, 1440),
  Average_mm = c(2.04, 4.06, 6.16, 7.90, 9.14, 10.54, 11.92, 12.90, 13.66, 13.72, 14.24, 16.52),
  Error_mm = c(0.05, 0.26, 0.23, 0.29, 0.49, 0.55, 0.29, 0.16, 0.24, 0.19, 0.23, 0.64)
)

deswelling_data <- data.frame(
  Condition = rep(c("NaCl", "CaCl2"), each = 2),
  Time_min = rep(c(0, 720), 2),
  Average_mm = c(16.52, 6.30, 17.54, 7.86),
  Error_mm = c(0.64, 0.86, 0.46, 0.36)
)

recovery_data <- data.frame(
  Condition = rep(c("NaCl-treated", "CaCl2-treated"), each = 3),
  Time_min = rep(c(0, 360, 1440), 2),
  Average_mm = c(6.30, 14.84, 16.60, 7.86, 8.10, 8.16),
  Error_mm = c(0.86, 1.07, 0.38, 0.36, 0.35, 0.34)
)

# FIGURE: Swelling Kinetics

fig1_swelling <- ggplot(swelling_data, aes(x = Time_min, y = Average_mm)) +
  geom_line(color = "#2E86AB", linewidth = 1) +
  geom_point(color = "#2E86AB", size = 3) +
  geom_errorbar(aes(ymin = Average_mm - Error_mm, ymax = Average_mm + Error_mm),
                width = 30, color = "#2E86AB", linewidth = 0.8) +
  scale_x_continuous(
    name = "Time (min)",
    breaks = c(0, 30, 60, 90, 120, 150, 180, 1440),
    labels = c("0", "30", "60", "90", "120", "150", "180", "1440")
  ) +
  scale_y_continuous(
    name = "Average Diameter (mm)",
    limits = c(0, 18),
    expand = c(0, 0)
  ) +
  labs(title = "Swelling Kinetics of Water Beads in Deionized Water") +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    panel.grid.minor = element_blank()
  )

print(fig1_swelling)
ggsave("swelling_kinetics.png", fig1_swelling, width = 8, height = 6, dpi = 300)

# FIGURE: Deswelling Comparison

deswelling_plot <- deswelling_data %>%
  mutate(Time_label = ifelse(Time_min == 0, "Before (0 min)", "After 12 h (720 min)"),
         Time_label = factor(Time_label, levels = c("Before (0 min)", "After 12 h (720 min)")))

fig2_deswelling <- ggplot(deswelling_plot, aes(x = Time_label, y = Average_mm, fill = Condition)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7, color = "black") +
  geom_errorbar(aes(ymin = Average_mm - Error_mm, ymax = Average_mm + Error_mm),
                position = position_dodge(width = 0.8), width = 0.2, linewidth = 0.8) +
  scale_fill_manual(
    name = "Solution",
    values = c("NaCl" = "#A23B72", "CaCl2" = "#F18F01"),
    labels = c("NaCl" = "NaCl", "CaCl2" = expression(CaCl[2]))
  ) +
  scale_y_continuous(
    name = "Average Diameter (mm)",
    limits = c(0, 20),
    expand = c(0, 0)
  ) +
  labs(
    title = "Deswelling Behavior in Salt Solutions",
    x = NULL
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.position = "top",
    panel.grid.major.x = element_blank()
  )

print(fig2_deswelling)
ggsave("deswelling_comparison.png", fig2_deswelling, width = 8, height = 6, dpi = 300)

# FIGURE: Recovery Behavior

# Create combined data for recovery with reference line
recovery_full <- recovery_data %>%
  mutate(Time_h = Time_min / 60)

original_size <- 16.52

fig3_recovery <- ggplot(recovery_full, aes(x = Time_h, y = Average_mm, color = Condition)) +
  geom_hline(yintercept = original_size, linetype = "dashed", color = "gray50", linewidth = 0.8) +
  annotate("text", x = 20, y = 15.0, label = "Original swollen size", color = "gray50", size = 3.5) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = Average_mm - Error_mm, ymax = Average_mm + Error_mm),
                width = 0.5, linewidth = 0.8) +
  scale_color_manual(
    name = "Treatment",
    values = c("NaCl-treated" = "#2E86AB", "CaCl2-treated" = "#C73E1D"),
    labels = c("NaCl-treated" = "NaCl-treated", "CaCl2-treated" = expression(CaCl[2] ~ "-treated"))
  ) +
  scale_x_continuous(
    name = "Time in Deionized Water (h)",
    breaks = c(0, 6, 24),
    labels = c("0", "6", "24")
  ) +
  scale_y_continuous(
    name = "Average Diameter (mm)",
    limits = c(0, 18),
    expand = c(0, 0)
  ) +
  labs(title = "Recovery Behavior in Deionized Water") +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.position = "top"
  )

print(fig3_recovery)
ggsave("recovery_behavior.png", fig3_recovery, width = 8, height = 6, dpi = 300)

# FIGURE: Volume Swelling Ratio Analysis

# Calculate volume ratios
D0 <- 2.04  # dry diameter

volume_analysis <- data.frame(
  Condition = c("Dry", "Swollen (DI water)", "After NaCl", "After CaCl2", 
                "NaCl Recovery", "CaCl2 Recovery"),
  Diameter_mm = c(2.04, 16.52, 6.30, 7.86, 16.60, 8.16),
  Volume_Ratio = c(1, (16.52/2.04)^3, (6.30/2.04)^3, (7.86/2.04)^3, 
                   (16.60/2.04)^3, (8.16/2.04)^3)
)

print("Volume Swelling Analysis:")
print(volume_analysis)

# Bar plot for volume ratios
fig4_volume <- ggplot(volume_analysis[-1, ], aes(x = reorder(Condition, -Volume_Ratio), y = Volume_Ratio)) +
  geom_bar(stat = "identity", fill = "#2E86AB", color = "black", width = 0.6) +
  scale_y_continuous(
    name = "Volume Swelling Ratio (Q)",
    trans = "log10",
    breaks = c(10, 50, 100, 200, 400),
    labels = c("10", "50", "100", "200", "400")
  ) +
  labs(
    title = "Equilibrium Volume Swelling Ratios",
    x = NULL
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    axis.text.x = element_text(angle = 25, hjust = 1)
  )

print(fig4_volume)
ggsave("volume_ratios.png", fig4_volume, width = 8, height = 6, dpi = 300)