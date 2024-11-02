library(ggeffects)

sep0 <- "====================================================================="
sep1 <- "---------------------------------------------------------------------"
sep2 <- "---------------------------------------------------------------------"

cat0 <- function(thing) {
  cat(thing, "\n")
}

pp <- function(model) {
  cat(paste0(model, ": "))
  cat(paste0("[", summary(get(model))$call$data, "] "))
  print(formula(get(model)))
}

get_model_info <- function(model, ofd4) {
  fbase <- file.path(ofd4, model)
  readr::write_rds(get(model), file = paste0(fbase, ".mdl.rds"))

  pp(model)
  print(summary(get(model)), correlation = FALSE)
  cat0(sep2)

  pp(model)
  print(performance::r2(get(model)))
  cat0(sep2)

  pp(model)
  print(performance::icc(get(model)))
  cat0(sep2)

  pp(model)
  print(performance::icc(get(model), by_group = TRUE))
  cat0(sep2)

  print(
    sjPlot::tab_model(get(model),
      show.reflvl = TRUE,
      show.intercept = TRUE,
      p.style = "numeric_stars",
      file = paste0(fbase, ".tab.html")
    )
  )
  print(
    sjPlot::tab_model(get(model),
      show.reflvl = TRUE,
      show.intercept = TRUE,
      p.style = "numeric_stars",
      file = paste0(fbase, ".tab.doc")
    )
  )
  # webshot::webshot(
  #   paste0(fbase, ".tab.html"),
  #   paste0(fbase, ".tab.png"),
  #   zoom = 2
  # )
  fbase
}

get_eff_null <- function(
    model,
    terms,
    extra,
    ofd4,
    p_adjust = "fdr") {
  pp(model)
  pred0 <- ggeffects::predict_response(
    get(model),
    terms = terms
  )
  test0 <- ggeffects::test_predictions(
    ## get(model),
    ## terms = terms,
    pred0,
    test = NULL,
    p_adjust = p_adjust
  )
  test2 <- ggeffects::test_predictions(
    ## get(model),
    ## terms = terms,
    pred0,
    test = "pairwise",
    ## collapse_levels = TRUE,
    p_adjust = "fdr"
  )
  ## cat0(sep0)
  ## print(pred0, n = Inf) ## PROBLEM: print + ggeffects
  ## cat0(sep0)
  ## print(test0, n = Inf) ## PROBLEM: print + ggeffects

  fbasefig <- file.path(
    ofd4, paste0(
      model, "-xtr-", extra, "-ggeff-",
      paste(terms, collapse = "-x-")
    )
  )
  fbasetab <- fbasefig

  pred0tab <- ggeffects::print_html(pred0)
  file <- paste0(fbasetab, "-pred0.html")
  tinytable::save_tt(pred0tab, file, overwrite = TRUE)

  test0tab <- ggeffects::print_html(test0)
  file <- paste0(fbasetab, "-test0.html")
  tinytable::save_tt(test0tab, file, overwrite = TRUE)

  test2tab <- ggeffects::print_html(test2)
  file <- paste0(fbasetab, "-test2.html")
  tinytable::save_tt(test2tab, file, overwrite = TRUE)

  file <- paste0(fbasetab, "-pred0.rds")
  readr::write_rds(pred0, file = file)
  file <- paste0(fbasetab, "-test0.rds")
  readr::write_rds(test0, file = file)
  file <- paste0(fbasetab, "-test2.rds")
  readr::write_rds(test2, file = file)

  return(list(fbasefig = fbasefig, pred0 = pred0, test0 = test0, test2 = test2))
}
