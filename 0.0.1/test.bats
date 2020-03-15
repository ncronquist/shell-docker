@test "shellcheck is available" {
  run which shellcheck
  [ $status -eq 0 ]
}

@test "shellcheck version is correct" {
  run shellcheck -V
  [ $status -eq 0 ]
  [ "${lines[1]}" = "version: 0.7.0" ]
}

@test "shfmt is available" {
  run which shfmt
  [ $status -eq 0 ]
}

@test "shfmt version is correct" {
  run shfmt -version
  [ $status -eq 0 ]
  [ "${lines[0]}" = "v3.0.1" ]
}
