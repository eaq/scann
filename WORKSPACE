workspace(name = "scann")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//build_deps/py:python_configure.bzl", "python_configure")
load("//build_deps/tf_dependency:tf_configure.bzl", "tf_configure")

http_archive(
    name = "rules_proto",
    sha256 = "2490dca4f249b8a9a3ab07bd1ba6eca085aaf8e45a734af92aad0c42d9dc7aaf",
    strip_prefix = "rules_proto-218ffa7dfa5408492dc86c01ee637614f8695c45",
    url = "https://mirrors.tencent.com/github.com/bazelbuild/rules_proto/archive/218ffa7dfa5408492dc86c01ee637614f8695c45.tar.gz",
)
load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

tf_configure(
    name = "local_config_tf",
)

python_configure(name = "local_config_python")

#http_archive(
#    name = "rules_pkg",
#    sha256 = "352c090cc3d3f9a6b4e676cf42a6047c16824959b438895a76c2989c6d7c246a",
#    url = "https://github.com/bazelbuild/rules_pkg/releases/download/0.2.5/rules_pkg-0.2.5.tar.gz",
#)

#load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

#rules_pkg_dependencies()


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



git_repository(
    name = "com_google_googletest",
    remote = "https://github.com/google/googletest.git",
    tag = "release-1.8.1",
)

