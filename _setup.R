fs::dir_create(here::here("data-raw/ksj_p13"))

# 国土数値情報 都市公園データ 平成23年度 ---------------------------------------------------
# remotes::install_github("uribo/kuniumi")
if (length(fs::dir_ls(here::here("data-raw/ksj_p13/"))) != 47L) {
  seq.int(41, 47) %>%
    purrr::walk(
      ~ kuniumi::read_ksj_p13(.pref_code = .x, .download = TRUE))
  fs::dir_ls(regexp = "P13", type = "directory") %>%
    purrr::walk(
      ~ fs::file_move(.x, here::here("data-raw/ksj_p13"))
    )
}
