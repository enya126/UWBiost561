context("Testing HW4 simulation study function")

# check reproducibility of generate_partial_clique
test_that("generate_partial_clique is reproducible with same seed", {
  set.seed(61)
  mat1 <- generate_partial_clique(10, 0.5, 0.8)$adj_mat
  set.seed(61)
  mat2 <- generate_partial_clique(10, 0.5, 0.8)$adj_mat
  expect_equal(mat1, mat2)
})

# Test simulation study on small case
test_that("small simulation structure is correct", {
  small_n_vec <- 5
  trial <- 1
  imp_nums <- 1:2
  alpha <- 0.5
  set.seed(1)

  result <- lapply(small_n_vec, function(n){
    lapply(1:trial, function(trial_id){
      mat <- generate_partial_clique(n, 0.5, 0.8)$adj_mat
      lapply(imp_nums, function(imp_id){
        compute_maximal_partial_clique_master(mat, alpha, imp_id, time_limit = 1)
      })
    })
  })

  expect_type(result, "list")
  expect_equal(length(result[[1]][[1]]), 2)
})
