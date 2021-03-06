#
# Copyright:: Copyright (c) 2012-2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "cacerts"

# Date of the file is in a comment at the start, or in the changelog
default_version "2014.09.03"

version "2014.09.03" do
  source :md5 => "d7f7dd7e3ede3e323fc0e09381f16caf"
end

version "2014.08.20" do
  source :md5 => "c9f4f7f4d6a5ef6633e893577a09865e"
end

version "2014.07.15" do
  source :md5 => "fd48275847fa10a8007008379ee902f1"
end

version "2014.04.22" do
  source :md5 => "9f92a0d9f605e227ae068e605f4c86fa"
end

version "2014.01.28" do
  source :md5 => "5d108f8ab86afacc6663aafca8604dd3"
end

source :url => "http://curl.haxx.se/ca/cacert.pem"
relative_path "cacerts-#{version}"

build do
  block do
    FileUtils.mkdir_p(File.expand_path("embedded/ssl/certs", install_dir))

    # There is a bug in omnibus-ruby that may or may not have been fixed. Since the source url
    # does not point to an archive, omnibus-ruby tries to copy cacert.pem into the project working
    # directory. However, it fails and copies to '/var/cache/omnibus/src/cacerts-2012.12.19\' instead
    # There is supposed to be a fix in omnibus-ruby, but under further testing, it was unsure if the
    # fix worked. Rather than trying to fix this now, we're filing a bug and copying the cacert.pem
    # directly from the cache instead.

    FileUtils.cp(File.expand_path("cacert.pem", Config.cache_dir),
                 File.expand_path("embedded/ssl/certs/cacert.pem", install_dir))
  end

  unless Ohai['platform'] == 'windows'
    command "ln -sf #{install_dir}/embedded/ssl/certs/cacert.pem #{install_dir}/embedded/ssl/cert.pem"
  end
end
