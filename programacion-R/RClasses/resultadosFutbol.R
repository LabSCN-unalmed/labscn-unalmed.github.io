dir1 <- url("http://fussball.wettpoint.com/en/results.html", "r")
texto <- readLines(dir1)
close(dir1)
indx1 <- regexpr("<table>",texto)
marcadores <- texto[indx1]