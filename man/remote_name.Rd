% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/remote.R
\name{remote_name}
\alias{remote_name}
\alias{remote_table}
\alias{remote_src}
\alias{remote_con}
\alias{remote_query}
\alias{remote_query_plan}
\title{Metadata about a remote table}
\usage{
remote_name(x, null_if_local = TRUE)

remote_table(x, null_if_local = TRUE)

remote_src(x)

remote_con(x)

remote_query(x, cte = FALSE, sql_options = NULL)

remote_query_plan(x, ...)
}
\arguments{
\item{x}{Remote table, currently must be a \code{\link{tbl_sql}}.}

\item{null_if_local}{Return \code{NULL} if the remote table is created via
\code{\link[=tbl_lazy]{tbl_lazy()}} or \code{\link[=lazy_frame]{lazy_frame()}}?}

\item{cte}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}
Use the \code{sql_options} argument instead.}

\item{sql_options}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}
SQL rendering options generated by \code{\link[=sql_options]{sql_options()}}.}

\item{...}{Additional arguments passed on to methods.}
}
\value{
A string, or \code{NULL} if not a remote table, or not applicable.
For example, computed queries do not have a "name".
}
\description{
\code{remote_name()} gives the unescaped name of the remote table, or \code{NULL} if it
is a query (created by \code{sql()}) or already escape (created by \code{ident_q()}).
\code{remote_table()} gives the remote table or the query.
\code{remote_query()} gives the text of the query, and \code{remote_query_plan()}
the query plan (as computed by the remote database). \code{remote_src()} and
\code{remote_con()} give the dplyr source and DBI connection respectively.
}
\examples{
mf <- memdb_frame(x = 1:5, y = 5:1, .name = "blorp")
remote_name(mf)
remote_src(mf)
remote_con(mf)
remote_query(mf)

mf2 <- dplyr::filter(mf, x > 3)
remote_name(mf2)
remote_src(mf2)
remote_con(mf2)
remote_query(mf2)
}
