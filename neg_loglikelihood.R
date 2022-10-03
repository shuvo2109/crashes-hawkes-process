neg_loglikelihood = function(params, data) {
  mu = params[1]
  alpha = params[2]
  beta = params[3]
  tau = params[4]
  t = sort(data)
  n = length(t)
  sum_j1 = 0
  for (j in 1:n) {
    sum_i1 = 0
    for (i in 1:(j-1)) {
      if (t[j]-t[i]<tau) {
        sum_i1 = sum_i1 + alpha
      }
      if (t[j]-t[i]>=tau) {
        sum_i1 = sum_i1 + alpha*exp(-beta*(t[j]-t[i]-tau))
      }
    }
    sum_j1 = sum_j1 + log(mu + sum_i1)
  }
  sum_j2 = 0
  for (j in 1:(n-1)) {
    sum_i2 =0
    for (i in 1:j) {
      if (t[j+1]-t[i]<tau) {
        sum_i2 = sum_i2 + (t[j+1]-t[j])
      }
      if (t[j]-t[i]>=tau) {
        sum_i2 = sum_i2 + (-1/beta)*(exp(-beta*(t[j+1]-t[j]-tau))-exp(-beta*(t[j]-t[i]-tau)))
      }
      if (t[j]-t[i]<tau && tau<t[j+1]-t[i]) {
        sum_i2 = sum_i2 + (tau-t[j]-t[i]-(1/beta)*(exp(-beta*(t[j+1]-t[i]-tau))-1))
      }
    }
    sum_j2 = sum_j2 + sum_i2
  }
  loglik = sum_j1 - mu*t[n] - alpha*sum_j2
  return(-loglik)
}