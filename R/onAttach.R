
.onAttach = function(libname, pkgname) {
  if (!interactive()) {
    return()
  }
  
  threads_env <- Sys.getenv("R_SPRUCE_NUM_THREADS")
  threads_option1 <- getOption("spruce.num.threads")
  threads_option2 <- getOption("Ncpus")
  
  if (threads_env != "") {
    thread_string <- paste(threads_env, "threads as set by environment variable R_SPRUCE_NUM_THREADS. Can be overwritten with num.threads.")
  } else if (!is.null(threads_option1)) {
    thread_string <- paste(threads_option1, "threads as set by options(spruce.num.threads = N). Can be overwritten with num.threads.")
  } else if (!is.null(threads_option2)) {
    thread_string <- paste(threads_option2, "threads as set by options(Ncpus = N). Can be overwritten with num.threads.")
  } else {
    thread_string <- "2 threads (default). Change with num.threads in spruce() and predict(), options(Ncpus = N), options(spruce.num.threads = N) or environment variable R_SPRUCE_NUM_THREADS."
  }
  
  packageStartupMessage(paste("spruce", packageVersion("spruce"), "using", thread_string))
}
