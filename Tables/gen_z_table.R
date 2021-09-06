
# Function to generate a table of standard normal CDF

gen_z_table <- function(from, to, digits = 4){
  range <- seq(from, to, by = 0.01)
  range %>%
    pnorm() %>%
    round(digits) %>% 
    matrix(nrow = length(range) / 10, ncol = 10, byrow = TRUE)
}
