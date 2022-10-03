generate_mle_table = function(mu_cap, alpha_cap, beta_cap) {
  mle_table = data.frame(0, 0, 0, 0, 0, 0, 0, 0, 0)
  # generating the table
  names(mle_table) = c('mu_in','alpha_in', 'beta_in', 'tau_in', 'mu_opt', 'tau_opt', 'beta_opt', 'tau_opt', 'neg_loglik')
  for (mu in 0.1*(1:10)) {
    for (tau in 1:10) {
      params = c(mu, runif(1, 0, 1), runif(1, 0, 2), tau)
      opt = optim(par = params, fn = neg_loglik, data = timestamps, method = "L-BFGS-B", lower = 1e-10, upper = 26.271)
      mle_table[nrow(mle_table)+1,] = c(params, opt$par, opt$value)
    }
  }
  write_xlsx(mle_table, "mle_table.xlsx")
  # library(writexl) is required
}