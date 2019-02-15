library(stringr)
library(purrr)

allowed_files = c(
  "data/IMDb_Economist_tv_ratings.csv",
  "hw4.Rproj",
  "hw4.Rmd",
  "hw4_whitelist.R",
  "README.md",
  "wercker.yml",
  ".gitignore"
)

files = dir(recursive=TRUE, full.names=TRUE)
disallowed_files = !map_lgl(files, ~ any(str_detect(., allowed_files)))

if (any(disallowed_files))
{
  cat("Disallowed files found:\n")
  cat("  (remove the following files from your repo)\n\n")

  for(file in files[disallowed_files])
    cat("*",file,"\n")

  quit("no",1,FALSE)
}
