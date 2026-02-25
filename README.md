# sane.bash

For the future you to keep on enjoying GNU Bash.

For many decades now,
we've had [an unofficial Bash strict mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/),
essentially `set -euo pipefail`.

Except GNU Bash evolved - `errtrace` `functrace` `inherit_errexit`
and then there's one last thing (tm): `stack trace on failure`.

`sane.bash` wraps all that up in a script to import (source) or a snippet to copy-paste.

## Usage

Have a look at the [./example](./example) for usage and docs.

There's also [./example-inline](./example-inline) for those times when
[a little copying is better than a little dependency.](https://go-proverbs.github.io)

## License

[Unlicense](LICENSE)
