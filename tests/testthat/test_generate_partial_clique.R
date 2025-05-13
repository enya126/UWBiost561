context("Testing generate random graphs with partial cliques function")

test_that("Adjacency matrix is symmetric", {
  result <- generate_partial_clique(10, 0.3, 0.5)
  adj <- result$adj_mat
  expect_true(all(adj == t(adj)))
})

# Check that adj_mat has no row or column names
test_that("adj_mat has no row or column names", {
  result <- generate_partial_clique(n = 10, clique_fraction = 0.5, clique_edge_density = 0.8)
  adj <- result$adj_mat
  expect_true(is.null(rownames(adj)))
  expect_true(is.null(colnames(adj)))
})
