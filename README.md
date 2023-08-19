# black-indent
Wrapper for the [Black](https://github.com/psf/black) python formatter that let's me control the indent size.
Because the developer should be in control.

Usage: `black-indent filename 2` to set indentation to 2 spaces.

```
Usage: 
black-indent [-hv] filename current_indent target_indent

Options: 
  -h, --help     show this help text
  -V, --version  display version
  filename       file to be formatted
  current_indent current indentation level (default=4)
  target_indent  desired indentation level (default=2)
```
