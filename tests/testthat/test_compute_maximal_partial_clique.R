context("Testing find maximal partial clique function")

# check input
test_that("Fails if input matrix is invalid", {
  adj_invalid <- matrix(1:9, nrow = 3)
  diag(adj_invalid) <- 1
  expect_error(compute_maximal_partial_clique(adj_invalid, 0.8))
})

# check_output
test_that("compute_maximal_partial_clique returns a list with expected names", {
  adj <- generate_partial_clique(n = 10, clique_fraction = 0.5, clique_edge_density = 0.8)$adj_mat
  result <- compute_maximal_partial_clique(adj, alpha = 0.7)

  expect_true(is.list(result))
  expect_true("clique_idx" %in% names(result))
  expect_true("edge_density" %in% names(result))
})

# test for small clique fraction & edge density with small alpha
test_that("Returned clique_idx is valid and edge_density ≥ alpha", {
  set.seed(10)
  g <- generate_partial_clique(n = 30, clique_fraction = 0.1, clique_edge_density = 0.1)
  adj <- g$adj_mat
  alpha <- 0.5

  result <- compute_maximal_partial_clique(adj, alpha)
  clique <- result$clique_idx
  density <- result$edge_density

  expect_true(all(clique %% 1 == 0 & clique > 0 & clique <= nrow(adj)))
  expect_true(length(unique(clique)) == length(clique))
  expect_true(density >= alpha)

  m <- length(clique)
  if (m >= 2) {
    sub_mat <- adj[clique, clique]
    sum_edges <- (sum(sub_mat) - m) / 2
    max_possible <- m * (m - 1) / 2
    actual_density <- sum_edges / max_possible
    expect_equal(density, actual_density)
    expect_true(actual_density >= alpha)
  }
})

# test for extreme clique fraction & edge density with large alpha
test_that("Edge case: small graph with full clique", {
  set.seed(10)
  g <- generate_partial_clique(n = 5, clique_fraction = 1, clique_edge_density = 1)
  adj <- g$adj_mat
  alpha <- 0.9

  result <- compute_maximal_partial_clique(adj, alpha)
  clique <- result$clique_idx

  expect_equal(length(clique), 5)
  expect_equal(result$edge_density, 1)
})

# test a corner case of a empty adjacency matrix
test_that("empty adjacency matrix returns minimal clique", {
  adj <- diag(1, nrow = 10)  # 10 nodes, no edges
  alpha <- 0.8

  result <- compute_maximal_partial_clique(adj, alpha)
  clique <- result$clique_idx

  expect_true(clique == 1)
  expect_true(result$edge_density == 1)
})

