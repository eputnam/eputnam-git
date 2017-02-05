# git

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with git](#setup)
    * [Beginning with git](#beginning-with-git)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This is an all-inclusive Git management module. Manage the Git package as well as
repos and config files.

If you're looking to get all the Git functionality you'll ever need, look no further.

## Setup

### Beginning with git

Start with a basic class declaration to install and manage the Git package:

```puppet
class { 'git': }
```

## Usage

After intial declaration, add a configuration file:

```puppet
git::config_file { '/home/user/.gitconfig':
  user_email => 'user@example.com',
  user_name  => 'User Smith',
  aliases    => [{'a' => 'add'}, {'co' => 'checkout'}]
}
```

## Reference

### git
* `manage_package`
_Boolean_
Defaults to true, manage the git package.

* `package_ensure`
_ensure_
Defaults to present, used only if `manage_package` is true

* `package_name`
_String_
Defaults to 'git', used only if `manage_package` is true

### git::user
* `username`
_String_
Git user name

* `email`
_String_
Specify user's email

* `full_name`
_String_
Specify the user's name

### git::config_file
* `config_file`
_String_
Defaults to $name, path to configuration file

* `user`
_Git::User_
Pass in a user resource

* `aliases`
_Array_
An array of hashes for git aliases

## Limitations

Currently this module has only been verified on Ubuntu 14.04

## Development

Please feel free to submit issues and PRs at www.github.com/eputnam/eputnam-git
