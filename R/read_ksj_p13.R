#' Read kokudosuchi identified P13 data
#'
#' @examples
#' read_ksj_p13(33)
read_ksj_p13 <- function(pref) {

  pref <-
    stringr::str_pad(pref, width = 2, side = "left", pad = "0")

  st_read(here::here("data-raw", paste0("P13-11_",
                                        pref,
                                        "_GML")),
          options = c("ENCODING=CP932"),
          crs = 4326,
          quiet = TRUE,
          stringsAsFactors = FALSE) %>%
    dplyr::select(P13_005,
                  P13_001, P13_002, P13_003, P13_004,
                  P13_006, P13_008) %>%
    purrr::set_names(c("prefecture", "jurisdiction", "admin", "name", "type", "city", "area", "geometry")) %>%
    dplyr::mutate(name = stringi::stri_trans_general(name, "nfkc"),
                  type = as.character(type)) %>%
    tibble::new_tibble(subclass = "sf")
}
