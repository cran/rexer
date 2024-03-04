## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(rexer)

rmd <- system.file("extdata/template01.Rmd", package = "rexer")

ex <- exam(
  rmd = rmd,
  instances_num = 30,
  random = FALSE,
  reorder_exercises = TRUE,
  select_n_exercises = 5
)

## -----------------------------------------------------------------------------
ex <- ex |>
  define_an_exercise(
    type = 'p',
    statement = 'What is the three-letter country code (ISO 3166-1 alpha-3) for
    the country represented in the figure below?',
    image = paste0(system.file('extdata/figures', package = 'rexer'), '/', '[[1]]'),
    image_alt = 'Country outline.',
    answer = c('ESP', 'CHL', 'NZL', 'ITA'),
    a_1 = c('spain.png', 'chile.png', 'new_zealand.png', 'italy.png')
  )

## -----------------------------------------------------------------------------
example <- system.file("extdata/example.csv", package = "rexer")

ex <- ex |>
  define_exercises_from_csv(example)

## ----results = "asis"---------------------------------------------------------
df <- read_exercise_csv(example)
pander::pandoc.table(df, split.table = Inf)

## -----------------------------------------------------------------------------
df <- set_pending_answers(df)

## ----results = "asis"---------------------------------------------------------
pander::pandoc.table(df, split.table = Inf)

## ----eval=FALSE---------------------------------------------------------------
#  ex <- ex |>
#    generate_document(out_dir = tempdir(), new_pages = 'all') |>
#    generate_correction_document(out_dir = tempdir(), new_pages = 'none')
#  

## ----echo = FALSE, fig.align = 'center', out.width = "100%"-------------------
knitr::include_graphics("figures/02.png")
knitr::include_graphics("figures/02c.png")

