# An R function for sending plots directly to gmail.
# Useful when you are working in an ssh session without x-forwarding
plot2gmail <- function(cmd, title, ...){
  args <- as.list(substitute(list(...)))[-1L]
  tmpfile = "/tmp/plot2gmail_tmp.png"
  png(tmpfile)
  do.call(cmd, args)
  dev.off()
  system(sprintf("echo %s | sendEvernote.py -yeg -a %s", title, tmpfile))
}
