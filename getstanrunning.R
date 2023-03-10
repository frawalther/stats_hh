#helpful links
# https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
# https://github.com/stan-dev/rstan/wiki/Configuring-C---Toolchain-for-Windows

#problem to run rstan with RTools42 thats why: 
#install preview of rstan 2.26
install.packages("StanHeaders", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
install.packages("rstan", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))

setwd("~/Pius_stats")

library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)
#run example 
schools_dat <- list(J = 8, 
                    y = c(28,  8, -3,  7, -1,  1, 18, 12),
                    sigma = c(15, 10, 16, 11,  9, 11, 10, 18))
fit <- stan(file = 'schools.stan', data = schools_dat)
print(fit)

#works 
