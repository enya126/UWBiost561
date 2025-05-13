#' Generate a partial clique
#'
#' @param n the number of nodes in the graph
#' @param clique_fraction the fraction of nodes that are part of the partial clique
#' @param clique_edge_density the edge density among the nodes in the clique.
#'
#' @return a list named adj_mat
#' @export
generate_partial_clique <- function(n, clique_fraction, clique_edge_density){
  # check inputs
  stopifnot(
    n %% 1 == 0, n >= 0,
    clique_fraction >= 0, clique_fraction <= 1,
    clique_edge_density >= 0, clique_edge_density <= 1
  )
  # start the function
  # Number of nodes in the clique
  size <- ceiling(n * clique_fraction)

  # Create empty adjacency matrix
  adj_mat <- matrix(0, nrow = n, ncol = n)

  # Create clique submatrix
  if (size > 1) {
    clique <- matrix(
      rbinom(size * size, 1, clique_edge_density),
      nrow = size, ncol = size
    )
    clique[lower.tri(clique)] <- t(clique)[lower.tri(clique)] # symmetric
    diag(clique) <- 1
    adj_mat[1:size, 1:size] <- clique
  } else if (size == 1) {
    adj_mat[1, 1] <- 1
  }

  diag(adj_mat) <- 1

  # Remove row/col names
  dimnames(adj_mat) <- NULL

  return(list(adj_mat = adj_mat))
}
