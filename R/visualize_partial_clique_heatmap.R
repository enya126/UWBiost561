#' Visualize an adjacency matrix with the maximal partial clique highlighted
#'
#' @param adj_mat A symmetric binary adjacency matrix (5–50 rows)
#' @param alpha A numeric value between 0.5 and 1 used in clique computation
#'
#' @return A ggplot heatmap of the adjacency matrix with clique block emphasized
#' @examples
#' mat <- matrix(0, nrow = 5, ncol = 5)
#' diag(mat) <- 1
#' mat[1,2] <- mat[2,1] <- 1
#' mat[3,4] <- mat[4,3] <- 1
#' visualize_partial_clique_heatmap(mat, alpha = 0.9)
#'
#' @export
visualize_partial_clique_heatmap <- function(adj_mat, alpha = 0.9) {
  # check for input
  stopifnot(is.matrix(adj_mat), isSymmetric(adj_mat))

  # Get clique index
  clique_result <- compute_maximal_partial_clique(adj_mat, alpha)
  clique_idx <- clique_result$clique_idx

  # Reorder matrix: bring clique to top-left
  new_order <- c(clique_idx, setdiff(1:nrow(adj_mat), clique_idx))
  adj_reordered <- adj_mat[new_order, new_order]

  # Prepare for heatmap
  df <- reshape2::melt(adj_reordered)
  colnames(df) <- c("Row", "Col", "Value")

  library(ggplot2)
  ggplot(df, aes(x = Col, y = Row, fill = factor(Value))) +
    geom_tile(color = "white") +
    scale_fill_manual(values = c("0" = "lightblue", "1" = "darkblue")) +
    coord_equal() +
    labs(
      title = "Adjacency Matrix with Maximal Partial Clique",
      fill = "Edge (0/1)"
    ) +
    theme_minimal() +
    theme(axis.text = element_blank(), axis.ticks = element_blank())
}
