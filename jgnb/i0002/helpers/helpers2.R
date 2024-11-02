lineE <- ggplot2::geom_vline(xintercept = 0 / 180, linetype = "dashed", color = "blue", lwd = 0.5)
lineT <- ggplot2::geom_vline(xintercept = 46 / 180, linetype = "dashed", color = "black", lwd = 0.5)
lineR <- ggplot2::geom_vline(xintercept = 65 / 180, linetype = "dashed", color = "red", lwd = 0.5)

lineED <- ggplot2::geom_vline(xintercept = 0, linetype = "dashed", color = "blue", lwd = 0.5)
lineTD <- ggplot2::geom_vline(xintercept = 46, linetype = "dashed", color = "black", lwd = 0.5)
lineRD <- ggplot2::geom_vline(xintercept = 65, linetype = "dashed", color = "red", lwd = 0.5)


line2 <- ggplot2::geom_hline(yintercept = 0, linetype = "dashed", color = "black", lwd = 0.5)

line0h <- ggplot2::geom_hline(yintercept = 0, linetype = "dashed", color = "black", lwd = 0.5)
line0v <- ggplot2::geom_vline(xintercept = 0, linetype = "dashed", color = "black", lwd = 0.5)


scaleA <- ggplot2::scale_y_continuous(breaks = seq(0, 1, by = 0.100))
scaleB <- ggplot2::scale_y_continuous(breaks = seq(0, 1, by = 0.025))
scaleC <- ggplot2::scale_y_continuous(breaks = seq(0, 1, by = 0.0125))

timeD <- ggplot2::scale_x_continuous(
  name = "Time (days) relative to election day",
  breaks = c(
    -1, -0.75, -0.50, -0.25, 0.00, 0.25, 0.36, 0.50, 0.75, 1.00
  ),
  labels = c(
    "-1" = "-180",
    "-0.75" = "-135",
    "-0.50" = "-90",
    "-0.25" = "-45",
    "0" = "0",
    "0.25" = "45",
    "0.36" = "63",
    "0.50" = "90",
    "0.75" = "135",
    "1" = "180"
  )
)

timeDD <- ggplot2::scale_x_continuous(
  name = "Time (days) relative to election day",
  breaks = c(
    -180,
    -135,
    -90,
    -45,
    0,
    45,
    63,
    90,
    135,
    180
  ),
  labels = c(
    "-180" = "-180",
    "-135" = "-135",
    "-90"  = "-90",
    "-45"  = "-45",
    "0"    = "0",
    "45"   = "45",
    "63"   = "63",
    "90"   = "90",
    "135"  = "135",
    "180"  = "180"
  )
)


rxy0 <- data.frame(
  Phase = c("BE", "AE", "BR", "AR"),
  xmin = c(-1.0, 0.0, 0.256, 0.36),
  xmax = c(0.0, 0.256, 0.36, 1.0),
  ymin = c(0.15, 0.15, 0.15, 0.15),
  ymax = c(0.85, 0.85, 0.85, 0.85),
  alpha = c(.1, .1, .1, .1),
  fill = c("red", "green", "blue", "magenta")
)

rxy2 <- rxy0
rxy2$ymin <- 0.25
rxy2$ymax <- 0.75

rxy3 <- rxy0
rxy3$ymin <- 0.30
rxy3$ymax <- 0.70

rxy4 <- rxy0
rxy4$ymin <- 0.40
rxy4$ymax <- 0.60

rxy5 <- rxy0
rxy5$ymin <- 0.45
rxy5$ymax <- 0.55

rect0 <- ggplot2::geom_rect(
  aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = I(fill)),
  alpha = 0.1, data = rxy0, inherit.aes = FALSE
)

rect2 <- ggplot2::geom_rect(
  aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = I(fill)),
  alpha = 0.1, data = rxy2, inherit.aes = FALSE
)

rect3 <- ggplot2::geom_rect(
  aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = I(fill)),
  alpha = 0.1, data = rxy3, inherit.aes = FALSE
)

rect4 <- ggplot2::geom_rect(
  aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = I(fill)),
  alpha = 0.1, data = rxy4, inherit.aes = FALSE
)

rect5 <- ggplot2::geom_rect(
  aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = I(fill)),
  alpha = 0.1, data = rxy5, inherit.aes = FALSE
)
