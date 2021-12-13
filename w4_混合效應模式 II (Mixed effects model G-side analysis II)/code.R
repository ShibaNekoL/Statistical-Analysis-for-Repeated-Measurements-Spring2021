data <- read.csv(file.choose())

levels(factor(data$School))

s8367 <- subset(data, data$School==8367)

z <- matrix(1,14,1)
sigmar <- 4.7665
zt <- matrix(1,1,14)
sigmae <- 37.0346
R <- diag(sigmae, 14,14)

m0 <- z %*% sigmar %*% zt + R
m1 <- m0 / m0[1,1]


###
Z <- cbind(1, s8367$SES)
G <- matrix(c(4.8278,-0.1547,-0.1547,0.4127),2,2)
ZT <- t(Z)
R <- diag(36.8304, 14,14)

m0 <- Z %*% G %*% ZT + R
m1 <- m0/sqrt(diag(m0)%*%t(diag(m0)))


