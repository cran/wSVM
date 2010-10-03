\name{wsvm.boost}
\alias{wsvm.boost}
\title{Weighted SVM using boosting algorithm}
\description{
    Improve accuracy for learning algorithm to bond with a lot of weak classifiers to construct the only one strong classifier.
}
\usage{
    wsvm.boost(X, Y, new.X, new.Y, c.n, B = 50, kernel.type = list(type = "rbf", par= 0.5), C = 4, eps = 1e-10, plotting = FALSE)
} 
\arguments{
  \item{X}{
    input variable matrix to generate kernel. Data type must be a matrix format.
  }
  \item{Y}{
    output variable vector which will be declared as a matrix in SVM. Data type must be a matrix format.
  }
  \item{new.X}{
    test predictors.
  }
  \item{new.Y}{
    test response.    
  }
  \item{c.n}{
    weighted term.
  }
  \item{B}{
    the number of iterations.
  }
  \item{kernel.type}{
    set an attributes of kernel using list(). kernel$type means a type of kernel, including 'linear', 'poly', and 'rbf'. kernel$par means a parameter of kernel. For example, par = degree for 'poly' and  par = scale for 'rbf'.
  }
  \item{C}{
    regularization parameter.
  }
  \item{eps}{
    epsilon value.
  }
  \item{plotting}{
    logical values. If TRUE, plot the result.
  }
}
\value{ 
 A function wsvm.boost generates a list consists of error.rate and predicted.model.\cr        
  \item{error.rate}{
    misclassification error rate
  }
  \item{predicted.model}{
    predicted model
  }
} 
\author{ 
    SungWhan Kim \email{swiss747@korea.ac.kr} \cr
    Soo-Heang Eo \email{hanansh@korea.ac.kr} 
}
\references{
    SungWhan Kim (2010). Weighted K-means SVM with Boosting algorithm for improving accuracy, Master Thesis, Korea University.
}
\seealso{ 
    \code{\link{wsvm}}, \code{\link{wsvm.predict}} 
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

boo <- wsvm.boost(X, Y, new.X, new.Y, c.n = rep(1 / length(Y),length(Y)), 
    B = 50, kernel.type = list(type = "rbf", par= 0.5), C = 4, 
    eps = 1e-10, plotting = TRUE)
boo
} 
\keyword{svm}
