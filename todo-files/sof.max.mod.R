#' MaxMod function.
#'
#' @template arg_dimensions
#' @template ret_smoof_single
#' @export
makeMaxModFunction = function(dimensions) {
  assertCount(dimensions)
  global.opt.params = as.list(rep(0, dimensions))
  names(global.opt.params) = paste("x", seq(dimensions), sep = "")
  makeSingleObjectiveFunction(
    name = paste(dimensions, "-d MaxMod function", sep = ""),
    fn = function(x) {
      max(abs(x))
    },
    par.set = makeNumericParamSet(
      len = dimensions,
      id = "x",
      lower = rep(-10, dimensions),
      upper = rep(10, dimensions),
      vector = TRUE
    ),
    global.opt.params = global.opt.params,
    global.opt.value = 0
  )
}
