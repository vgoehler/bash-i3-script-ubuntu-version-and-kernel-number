#!/usr/bin/env bats

SUT="$BATS_TEST_DIRNAME/../print_ubuntu_and_kernel_version.sh"
EXAMPLE_DIR="$BATS_TEST_DIRNAME/example"

@test "do not accept only one parameter" {
    run "$SUT" -h
    [ "$status" -eq 255 ]
}

@test "do not accept more then two parameters" {
    run "$SUT" -fu -bar -kaching
    [ "$status" -eq 255 ]
}

@test "if not a correct input file is given echo error" {
    run "$SUT" -fu -bar
    [ "$status" -eq 25 ]
    [ "$output" = "FILE -fu NOT FOUND" ]
}

@test "parse correctly" {
    run "$SUT" "$EXAMPLE_DIR/lsb_release_dump" "$EXAMPLE_DIR/uname_dump"
    echo "$output"
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "20.04(focal)[5.4.0-37]" ]
    [ "${lines[1]}" = "focal[5.4.0]" ]
    [ "${lines[2]}" = "#426BDC" ]
    [ "${lines[3]}" = "#DC6642" ]
}
