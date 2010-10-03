\name{wsvm.predict}
\alias{wsvm.predict}
\title{Predict new test set using wsvm function and compute error rate}
\description{
    Predict a weighted svm fit and compute error rate.
}
\usage{
    wsvm.predict(X, Y, new.X, new.Y, model, comp.error.rate = FALSE)
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
  \item{model}{
    predicted model including alpha and bias terms. The alpha means estimated coefficients(nrow(X) by 1) and bias means bias term.
  }
  \item{comp.error.rate}{
    logical value. If true, calculate error rate.
  }
}
\details{
  Predict a weighted svm fit.
} 
\value{ 
 A function wsvm.predict generates a list consists of values, g, and error.rate. \cr        
  \item{predicted.values}{
    fitted value at new.X
  }
  \item{g}{
    signs of predicted values
  }
  \item{error.rate}{
    misclassification error rate
  }
} 
\author{ 
    SungWhan Kim \email{swiss747@korea.ac.kr} \cr
    Soo-Heang Eo \email{hanansh@korea.ac.kr} 
} 
\seealso{ 
    \code{\link{wsvm}}, \code{\link{wsvm.boost}} 
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
