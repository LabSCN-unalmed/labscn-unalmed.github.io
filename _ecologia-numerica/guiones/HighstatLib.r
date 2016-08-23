
##################################################################
#Below are some functions that we took from the pairs help file and
#modified, or wrote ourselves. You need to copy and paste all these commands
#into R. It is perhaps better not to try and understand what it all does.



## put correlations on the panels,
## with size proportional to the correlations.
panel.cor <- function(x, y, digits=1, prefix="", cex.cor)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r1=cor(x,y,use="pairwise.complete.obs")
    r <- abs(cor(x, y,use="pairwise.complete.obs"))

    txt <- format(c(r1, 0.123456789), digits=digits)[1]
    txt <- paste(prefix, txt, sep="")
    if(missing(cex.cor)) cex <- 0.9/strwidth(txt)
    text(0.5, 0.5, txt, cex = cex * r)
}

panel.smooth2=function (x, y, col = par("col"), bg = NA, pch = par("pch"),
    cex = 1, col.smooth = "red", span = 2/3, iter = 3, ...)
{
    points(x, y, pch = pch, col = col, bg = bg, cex = cex)
    ok <- is.finite(x) & is.finite(y)
    if (any(ok))
        lines(stats::lowess(x[ok], y[ok], f = span, iter = iter),
            col = 1, ...)
}


panel.lines2=function (x, y, col = par("col"), bg = NA, pch = par("pch"),
    cex = 1, ...)
{
    points(x, y, pch = pch, col = col, bg = bg, cex = cex)
    ok <- is.finite(x) & is.finite(y)
    if (any(ok)){
        tmp=lm(y[ok]~x[ok])
        abline(tmp)}

}




panel.hist <- function(x, ...)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h <- hist(x, plot = FALSE)
    breaks <- h$breaks; nB <- length(breaks)
    y <- h$counts; y <- y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col="white", ...)
}



#VIF
myvif <- function(mod) {
  v <- vcov(mod)
  assign <- attributes(model.matrix(mod))$assign
  if (names(coefficients(mod)[1]) == "(Intercept)") {
    v <- v[-1, -1]
    assign <- assign[-1]
  } else warning("No intercept: vifs may not be sensible.")
  terms <- labels(terms(mod))
  n.terms <- length(terms)
  if (n.terms < 2) stop("The model contains fewer than 2 terms")
  if (length(assign) > dim(v)[1] ) {
     diag(tmp_cor)<-0
     if (any(tmp_cor==1.0)){
        return("Sample size is too small, 100% collinearity is present")
     } else {
        return("Sample size is too small")
     }
  }
  R <- cov2cor(v)
  detR <- det(R)
  result <- matrix(0, n.terms, 3)
  rownames(result) <- terms
  colnames(result) <- c("GVIF", "Df", "GVIF^(1/2Df)")
  for (term in 1:n.terms) {
    subs <- which(assign == term)
    result[term, 1] <- det(as.matrix(R[subs, subs])) * det(as.matrix(R[-subs, -subs])) / detR
    result[term, 2] <- length(subs)
  }
  if (all(result[, 2] == 1)) {
    result <- data.frame(GVIF=result[, 1])
  } else {
    result[, 3] <- result[, 1]^(1/(2 * result[, 2]))
  }
  invisible(result)
}

corvif <- function(dataz) {
    dataz <- as.data.frame(dataz)
    #correlation part
    cat("Correlations of the variables\n\n")
    tmp_cor <- cor(dataz,use="complete.obs")
    print(tmp_cor)

    #vif part
    form    <- formula(paste("fooy ~ ",paste(strsplit(names(dataz)," "),collapse=" + ")))
    dataz   <- data.frame(fooy=1,dataz)
    lm_mod  <- lm(form,dataz)

    cat("\n\nVariance inflation factors\n\n")
    print(myvif(lm_mod))
}

myvif <- function(mod) {
  v <- vcov(mod)
  assign <- attributes(model.matrix(mod))$assign
  if (names(coefficients(mod)[1]) == "(Intercept)") {
    v <- v[-1, -1]
    assign <- assign[-1]
  } else warning("No intercept: vifs may not be sensible.")
  terms <- labels(terms(mod))
  n.terms <- length(terms)
  if (n.terms < 2) stop("The model contains fewer than 2 terms")
  if (length(assign) > dim(v)[1] ) {
     diag(tmp_cor)<-0
     if (any(tmp_cor==1.0)){
        return("Sample size is too small, 100% collinearity is present")
     } else {
        return("Sample size is too small")
     }
  }
  R <- cov2cor(v)
  detR <- det(R)
  result <- matrix(0, n.terms, 3)
  rownames(result) <- terms
  colnames(result) <- c("GVIF", "Df", "GVIF^(1/2Df)")
  for (term in 1:n.terms) {
    subs <- which(assign == term)
    result[term, 1] <- det(as.matrix(R[subs, subs])) * det(as.matrix(R[-subs, -subs])) / detR
    result[term, 2] <- length(subs)
  }
  if (all(result[, 2] == 1)) {
    result <- data.frame(GVIF=result[, 1])
  } else {
    result[, 3] <- result[, 1]^(1/(2 * result[, 2]))
  }
  invisible(result)
}



corvif <- function(dataz) {
    dataz <- as.data.frame(dataz)
    #correlation part
    cat("Correlations of the variables\n\n")
    tmp_cor <- cor(dataz,use="complete.obs")
    print(tmp_cor)

    #vif part
    form    <- formula(paste("fooy ~ ",paste(strsplit(names(dataz)," "),collapse=" + ")))
    dataz   <- data.frame(fooy=1,dataz)
    lm_mod  <- lm(form,dataz)

    cat("\n\nVariance inflation factors\n\n")
    print(myvif(lm_mod))
}

