% Generated by roxygen2 (4.0.2): do not edit by hand
\name{appendEnv}
\alias{appendEnv}
\title{Merge two enviroments}
\usage{
appendEnv(e1, e2)
}
\arguments{
\item{e1}{First environment}

\item{e2}{Second environment}
}
\description{
Merge two enviroments. If these two environments have some object with identical name \code{o}, then
\code{o} in the first environment with be overwritten by \code{o} in the second environment. The first
environment is updated in-place, no third environment is generated.
}

