# #! Shell Signup #

<https://github.com/hashbang/shell-signup>

## About ##

This is the central login system for #! users.

All ssh connections to this container as any user will be routed to a signup
script which will be provided with intercepted public key and username value.

The signup script will provide a user interface to allow specifying a desired
username and home server. On submission the script will make a POST request
to our central signup server to create the account.

## Requirements ##

  * Docker v18.0+

## Cloning ##

  ```
  git clone git@github.com:hashbang/shell-signup.git
  cd shell-signup
  git submodule update --init
  ```

## Building ##

  ```
  docker build -t shell-signup .
  ```

## Testing ##

  ```
  docker run --rm --name shell-signup -it -p 22:22 shell-signup
  ssh localhost
  ```

## Debugging ##

## Verify NSS resolution for unknown users
  ```
  docker run --rm --name shell-signup -it shell-signup id randomuser
  ```

## Start with ssh debugging to stdout
  ```
  docker run \
    --rm \
    --name shell-signup \
    -it \
    -p 22:22 \
    shell-signup \
    /usr/sbin/sshd -dD -f /etc/ssh/sshd_config
  ```

## Notes ##

Use at your own risk. You may be eaten by a grue.

Questions/Comments?

Talk to us via:

[Email](mailto:team@hashbang.sh) |
[IRC](ircs://irc.hashbang.sh:6697/#!) |
[Issues](http://github.com/hashbang/)
