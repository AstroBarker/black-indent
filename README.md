# black-indent
```
      __    __           __         _           __           __ 
     / /_  / /___ ______/ /__      (_)___  ____/ /__  ____  / /_
    / __ \/ / __ `/ ___/ //_/_____/ / __ \/ __  / _ \/ __ \/ __/
   / /_/ / / /_/ / /__/ ,< /_____/ / / / / /_/ /  __/ / / / /_  
  /_.___/_/\__,_/\___/_/|_|     /_/_/ /_/\__,_/\___/_/ /_/\__/  
 ```
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/astrobarker/black-indent/.github%2Fworkflows%2Ftest.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![Static Badge](https://img.shields.io/badge/release-v1.0.0-blue)


Wrapper for the [Black](https://github.com/psf/black) python formatter that let's me control the indent size.
Because the developer should be in control.

## Installation
To install, clone this repo and run `make install`
```
git clone https://github.com/astrobarker/black-indent.git
make install
```
to install `black-indent` and its man page at the root level.

## Usage
run 
```
black-indent filename 2
```
to set indentation to 2 spaces.

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
