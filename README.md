<div align=center>

# [WEBSERVIFY]

[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)
[![Release](https://github.com/d3p1/webservify/actions/workflows/release.yml/badge.svg)](https://github.com/d3p1/webservify/actions/workflows/release.yml)

</div>

## Introduction

A tiny script to set up a machine as a web server. It is important to notice that this script will not set up the web server. Instead, it will implement the necessary configurations so the machine can start working as a web server with any technology that suites your needs. For instance:

- Most of the virtual machine in the market will come just with a `root` user. This script will create a normal user with `sudo` privileges.
- This script will set up a firewall that will only allow connections to the `80` (`http`), `443` (`https`) and a custom `ssh` port.

> [!NOTE]
> This script is still in progress and will continue improving to add other relevant common configuration tasks (like [adding `ssh` key pairs](https://github.com/d3p1/webservify/issues/5)).

## Prerequisites

Before using this tool, ensure that you have:

- `ssh` installed on your system.

- `ssh` access to the machine that you want to configure with a user with `sudo` privileges to be able to perform the necessary configuration tasks.

- [`git`](https://git-scm.com/) installed on your system.

## Installation

To install this tool, run the following command:

```shell
git clone https://github.com/d3p1/webservify.git && \
chmod +x webservify/src/bin/setup/installer.sh   && \
./webservify/src/bin/setup/installer.sh          && \
source ~/.bash_profile                           && \
rm -rf webservify/
```

## Usage

Using this tool is straightforward:

1. Create a [`.webservify_profile` file](https://github.com/d3p1/webservify/blob/main/src/bin/etc/.webservify_profile.sample). This file lets you configure variables that define how to configure the machine.

2. Add secure permissions to created [`.webservify_profile` file](https://github.com/d3p1/webservify/blob/main/src/bin/etc/.webservify_profile.sample): `chmod 400 .webservify_profile`.

3. Execute `webservify configure` to configure the machine.

> [!NOTE]
> To gain a deeper understanding of how this tool works under the hood, visit the [wiki page](https://github.com/d3p1/webservify/wiki) (currently, [_in progress_](https://github.com/d3p1/webservify/issues/4)).

> [!NOTE]
> If you encounter issues while using this tool, refer to the [troubleshooting page](https://github.com/d3p1/webservify/wiki/%5B8%5D-Troubleshooting) for guidance (currently, [_in progress_](https://github.com/d3p1/webservify/issues/4)).

> [!IMPORTANT]
> Please note that [as of now](https://github.com/d3p1/webservify/issues/3), this tool has only been tested on `Debian 12` and requires an environment with `bash` to function correctly.

## Changelog

Detailed changes for each release are documented in [`CHANGELOG.md`](./CHANGELOG.md).

## License

This work is published under [MIT License](./LICENSE).

## Author

Always happy to receive a greeting on:

- [LinkedIn](https://www.linkedin.com/in/cristian-marcelo-de-picciotto/) 
- [Web](https://d3p1.dev/)
