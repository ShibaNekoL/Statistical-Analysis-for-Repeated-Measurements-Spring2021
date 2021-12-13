data <- read.csv(file.choose())

X <- rep(1,120)
R <- diag(6.6729,120)
Z <- matrix(0,120,10)
for(i in 1:10){
    Z[(12*i-11):(12*i),i] <- 1
}
G <- diag(7.8247,10)
Y <- matrix(data$milk, ncol=1)

red <- solve(rbind(cbind(t(X) %*% solve(R) %*% X, t(X) %*% solve(R) %*% Z),cbind(t(Z) %*% solve(R) %*% X, (t(Z) %*% solve(R) %*% Z + solve(G)))))
sqrt(diag(red))
red %*% rbind(t(X) %*% solve(R) %*% Y, t(Z) %*% solve(R) %*% Y)