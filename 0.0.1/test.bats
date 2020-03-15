setup() {
  docker history "ncronquist/shell-docker:0.0.1" >/dev/null 2>&1
}

@test "shellcheck should be available" {
  run docker run "ncronquist/shell-docker:0.0.1" which shellcheck
  [ $status -eq 0 ]
}

@test "shellcheck version is correct" {
  run docker run "ncronquist/shell-docker:0.0.1" shellcheck -V
  [ $status -eq 0 ]
  [ "${lines[1]}" = "version: 0.7.0" ]
}

@test "shfmt is available" {
  run docker run "ncronquist/shell-docker:0.0.1" which shfmt
  [ $status -eq 0 ]
}

@test "shfmt version is correct" {
  run docker run "ncronquist/shell-docker:0.0.1" shfmt -version
  [ $status -eq 0 ]
  [ "${lines[0]}" = "v3.0.1" ]
}

