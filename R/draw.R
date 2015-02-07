#' Draw function
#'
#' Draws a very simple table inside your plotting window based on data in a data frame.  The functions were
#' adapted from \code{demo(\link{plotmath})}
#' 
#' @param data A data frame formatted exactly how you want your table to look.  Row names will not be preserved.
#' 
#' @return NULL
#' 
#' @details The \code{tabler} \code{draw} will simply plot your table in a plotting window.
#' This is mainly helpful in conjunction with knitr/pandoc.  It will help you convert tables
#' to word documents without anything exploding or leaking off the page.  You can control
#' the table size by adjusting \code{fig.height} in the R-markdown code chunk.
#' 
#' @examples
#' 
#' my_table <- data.frame("A" = c(1, 2), "B" = c(3, 4))
#' 
#' draw(my_table)
#'   
#' @export

draw <- function(data) {
  ## Functions adapted from demo(plotmath)
  
  get_row <- function() {
    (cell_count %% num_rows) + 1
  }
  
  get_col <- function() {
    (cell_count %/% num_rows) + 1
  }
  
  draw_cell <- function(title, .border = "black", .lwd = 1) {
    row <- get_row()
    col <- get_col()
    
    # Draw the text
    text(x = (col - 1) + 0.5,
         y = -(row - 1) - 0.5,
         labels = title)
    
    # Draw the cell outline
    rect(xleft   = col - 1,
         ybottom = -row,
         xright  = col,
         ytop    = -(row - 1),
         border  = .border, lwd = .lwd)
  }
  
  # Get dimensions and titles
  num_cols   <- length(data[1, ])
  num_rows   <- length(data[, 1]) + 1
  
  # Initialize the table plot
  old_par <- par(mar = rep(0, 4), pty = "m")
  plot(x = c(0, num_cols), y = c(0, -num_rows), 
       type = "n", xlab = "", ylab = "", axes = FALSE)
  
  # start the cell counter
  cell_count <- 0
  
  for(c in 1:num_cols){
    draw_cell(names(data[c]), .lwd = 1)
    cell_count <- cell_count + 1
    
    for(r in 1:(num_rows - 1)){
      draw_cell(data[r, c], "grey")
      cell_count <- cell_count + 1
    }
  }
  
  par(old_par)
}