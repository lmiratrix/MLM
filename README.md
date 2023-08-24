# Collection of handouts and materials for S043/Stat151: Multilevel and longitudinal data

This is the github repo for the code and whatnot that makes the on-line "textbook" served at https://lmiratrix.github.io/MLM/

The goal of this project is to make all the handouts for my multilevel modeling course easy to find, access and browse.

All comments welcome!

## Technical note on updating posted book

The posted book is rendered and stored in an alternate branch called `gh-pages`. This process is (not yet) automated, but the shell script `update_book`, when run locally, will copy the current rendered `_book` contents and push to github.

To make this script work, you have to make a local directory called `book` via the following call in a shell at the top-level directory:

```         
git clone -b gh-pages \
  https://github.com/lmiratrix/MLM.git \
  book-output
```
