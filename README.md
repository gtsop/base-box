# base-box

Basline utilites for *-box repositories

## Installation

```
git clone --recurse-submodule https://github.com/gtsop/base-box.git ~/.base-box && cd ~/.base-box && ./install-bats.sh
```

## Running

Assert your machine's compatibility by running

```
bats acceptance.bats
```

For every failure there should be a relevant solution in the output
