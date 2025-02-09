#' Kilogram conversion
#'
#' Convert mass in Kilogram to Pounds
#' @param K_mass The mass in Kilograms
#' @return The mass in Pounds
#' @examples 
#' mass1 <- K_to_P(69);
#' mass2 <- K_to_P( c(55, 69, 71) );
#' @export
K_to_P <- function(K_mass){
  P_mass <- (K_mass * 2.20462)
  return (P_mass)
}

#' Pounds conversion
#'
#' Convert mass in Pounds to Kilograms
#' @param P_mass The mass in Pounds
#' @return The mass in Kilograms
#' @examples 
#' mass1 <- P_to_K(150);
#' mass2 <- P_to_K( c(200, 155, 342) );
#' @export
P_to_K <- function(P_mass){
  K_mass <- (P_mass/2.20462)
  return (K_mass)
}