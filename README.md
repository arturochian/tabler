# tabler

Plot your table in the plotting window.

To install:

`devtools::install_github("adletaw/tabler")`

The `tabler` `draw` function will simply plot a data.frame in a plotting window. This is mainly helpful in conjunction with R-markdown.  It will help you convert tables over to word documents without anything exploding or leaking off the page.  You can control the table size by adjusting `fig.height` in the R-markdown code chunk.

`tabler` does not currently allow any modifications to the default table.