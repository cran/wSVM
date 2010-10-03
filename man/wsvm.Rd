\name{wsvm}
\alias{wsvm}
\title{Weighted SVM with boosting algorithm for improving accuracy}
\description{
    Compute Weighter SVM with boosting algorithm
}
\usage{
    wsvm(X, Y, c.n, kernel = list(type = 'linear', par = NULL), C = 1, eps = 1e-10)
} 
\arguments{
  \item{X}{
    input variable matrix. Data type must be a matrix format.
  }
  \item{Y}{
    output variable vector which will be declared as a matrix in SVM. Data type must be a matrix format.
  }
  \item{c.n}{
    weighted term.
  }
  \item{kernel}{
    set an attributes of kernel using list(). kernel$type means a type of kernel, including 'linear', 'poly', and 'rbf'. kernel$par means a parameter of kernel. For example, par = degree for 'poly' and  par = scale for 'rbf'.
  }
  \item{C}{
    regularization parameter.
  }
  \item{eps}{
    epsilon value.
  }
}
\details{
  Weighted SVM with boosting algorithm for improving accuracy.
} 
\value{ 
 A function wsvm generate a list consists of fit, alpha, bias and sv. \cr        
 model$fit = predicted values (n by 1)  \cr
 model$alpha = estimated coefficients (n by 1) \cr 
 model$bias = bias term  \cr
 model$sv = index of support vectors  
} 
\author{ 
    SungWhan Kim \email{swiss747@korea.ac.kr} \cr
    Soo-Heang Eo \email{hanansh@korea.ac.kr} 
} 
\seealso{ 
    \code{\link{wsvm.predict}}, \code{\link{wsvm.boost}} 
} 
\examples{

# generate a simulation data set using mixture example(page 17, Friedman et al. 2000)

svm.data <- simul.wsvm(set.seeds = 123)
X <- svm.data$X
Y <- svm.data$Y
new.X <- svm.data$new.X
new.Y <- svm.data$new.Y

# run Weighted K-means clustering SVM with boosting algorithm
model <- wsvm(X, Y, c.n = rep(1/ length(Y),length(Y)))

# predict the model and compute an error rate. 
pred <- wsvm.predict(X,Y, new.X, new.Y, model)

Error.rate(pred$predicted.Y, Y)

# add boost algorithm

boo <- wsvm.boost(X, Y, new.X, new.Y, c.n = rep(1/ length(Y),length(Y)), 
    B = 50, kernel.type = list(type = "rbf", par= 0.5), C = 4, 
    eps = 1e-10, plotting = TRUE)
boo
} 

\keyword{svm} 
