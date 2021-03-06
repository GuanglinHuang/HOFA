% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Port_ICA.R
\name{Port_ICA}
\alias{Port_ICA}
\title{Portfolio selection with independent component analysis}
\usage{
Port_ICA(
  X,
  k = NULL,
  kmax = 10,
  fn_sel = c("ER", "GR", "IC3", "ED"),
  Port_obj = c("MVaR", "EU"),
  alpha = 0.01,
  gamma = 10,
  Adjcov = c("DNL", "LI"),
  shortselling = T,
  ...
)
}
\arguments{
\item{X}{A matrix or data frame with t rows (samples) and n columns (variables).}

\item{k}{An integer, the number of factors. Default to \code{NULL}, several methods exist to select the number of factors.}

\item{kmax}{An integer, the maximum number of factors. Default to \code{k=10}, only need when \code{k=NULL}.}

\item{fn_sel}{Factor selection criterion (only need when \code{k=NULL}):"\code{ER}" and "\code{GR}", Ahn and Horenstein(2013)'s ER and GR estimators;
"\code{IC3}", Bai and Ng(2002)'s IC3; "\code{ED}", Onatski(2010)'s ED criterion.}

\item{Port_obj}{The portfolio objective function to be used: Modified Value-at-Risk "\code{MVaR}" and Expected Utility "\code{EU}".}

\item{alpha}{The confidence level of MVaR (only need when \code{Port_obj="MVaR"}), default to \code{alpha = 0.01}.}

\item{gamma}{The risk averse parameter of CRRA utility function (only need when \code{Port_obj="EU"}), default to \code{gamma = 10}.}

\item{Adjcov}{The correction method of covariance matrix: "\code{DNL}", Lodit and Wolf(2018)'s Direct NonLinear shrinkage estimation; "\code{LI}", Lodit and Wolf(2004)'s Linear Identity shrinkage estimation.}

\item{shortselling}{A logical parameter: whether the portfolio is allowed to shortselling, defalut to \code{T}.}
}
\value{
A list contains the optimal portfolio weight \code{w}, the objective function value \code{obj}, the number of factors \code{k}, the moments of factors \code{mm_factor}
and the moments of epsilon \code{mm_eps}.
}
\description{
An implementation of the portfolio weight optimization through parsimonious higher comoments estimation presented in the paper:
Lassance and Vrins (2020), Portfolio selection with parsimonious higher comoments estimation, Forthcoming in Journal of Banking and Finance.
}
\examples{
data(sp500);
Result = Port_ICA(sp500,fn_sel = "IC3",Port_obj = "MVaR",Adjcov = "DNL");
}
