## Puppet module: hiera_backend

### Intro

hiera_backend provides a couple of functions for querying and determining a specific hiera backend to use for a search.  It is mostly useful for people running multple back ends but do not always want to cycle through the list of configured backends, but rather, target one in particular.

This is not intended as a permenant solution, I hope that there is a nicer more elegant way of accomplishing this in hiera-2.0.0 but until then this will provide a way of doing per-backend queries for sites running more than one backend.

### Examples

    # If we have GPG, insist we use it
    if hiera_has_backend('gpg') {
      $password = hiera_backend('gpg', 'password')
    }


    # Assume we have yaml, mysql configured, but want to search in reverse
    $foo = hiera_has_backend('mysql') ? {
      true  => hiera_backend('mysql', 'foo'),
      false => hiera('foo')
    }

### Functions

- hiera_has_backend(<backend>) : returns true or false
- hiera_backend(<backend>, <query>, [<default>[<override>]])



