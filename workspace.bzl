load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//build_deps/py:python_configure.bzl", "python_configure")
load("//build_deps/tf_dependency:tf_configure.bzl", "tf_configure")
def load_deps():

    tf_configure(
        name = "local_config_tf",
    )

    python_configure(name = "local_config_python")

    if not native.existing_rule("com_google_googletest"):
        git_repository(
            name = "com_google_googletest",
            remote = "https://github.com/google/googletest.git",
            tag = "release-1.8.1",
        )

    if not native.existing_rule("com_google_protobuf"):
        http_archive(
            name = "com_google_protobuf",
            strip_prefix = "protobuf-3.11.0",
            type = "zip",
            url = "https://github.com/protocolbuffers/protobuf/archive/v3.11.0.zip",
        )

        http_archive(
            name = "zlib",
            build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
            sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
            strip_prefix = "zlib-1.2.11",
            urls = [
                "https://mirror.bazel.build/zlib.net/zlib-1.2.11.tar.gz",
                "https://zlib.net/zlib-1.2.11.tar.gz",
            ],
        )

    if not native.existing_rule("com_google_absl"):
        http_archive(
            name = "com_google_absl",
            patch_args = ["-p1"],
            patches = ["//build_deps/patches:absl-cpp17.patch"],
            sha256 = "f368a8476f4e2e0eccf8a7318b98dafbe30b2600f4e3cf52636e5eb145aba06a",
            strip_prefix = "abseil-cpp-df3ea785d8c30a9503321a3d35ee7d35808f190d",
            urls = [
                "https://storage.googleapis.com/mirror.tensorflow.org/github.com/abseil/abseil-cpp/archive/df3ea785d8c30a9503321a3d35ee7d35808f190d.tar.gz",
                "https://github.com/abseil/abseil-cpp/archive/df3ea785d8c30a9503321a3d35ee7d35808f190d.tar.gz",
            ],
        )

    if not native.existing_rule("pybind11_bazel"):
        git_repository(
            name = "pybind11_bazel",
            commit = "f22df0e57ba664c2d3cf439ddfb7f8804e3f36c1",
            remote = "https://github.com/pybind/pybind11_bazel.git",
        )

        http_archive(
            name = "pybind11",
            build_file = "@pybind11_bazel//:pybind11.BUILD",
            strip_prefix = "pybind11-2.4.3",
            urls = [
                "https://github.com/pybind/pybind11/archive/v2.4.3.tar.gz",
            ],
        )

