# Collection of handouts and materials for S043/Stat151: Multilevel and longitudinal data

This is the github repo for the code and whatnot that makes the on-line "textbook" served at https://lmiratrix.github.io/MLM/

The goal of this project is to make all the handouts for my multilevel modeling course easy to find, access and browse.

All comments welcome!

## Using the Git Repo itself

For those developing the git repo, some notes

### Getting started

1.  **Get Data.** We are not posting the data to the git repo as it is not entirely our data to post (they are distributed with textbooks like Raudenbush and Bryk, for example). To get started, obtain a copy of the `data` folder and put it in the toplevel of the repo.
2.  **Install needed libraries.** You will then need to install the libraries used by the book. Open `install_all_libraries.R` and run that. This will get most (maybe all) of the libraries.
3.  **Render book**. Then render the book from the Build tab of RStudio. If it crashes due to missing libraries, update the `install_all_libraries.R` file with the additional library and re-run. The build should not crash for any other reason.

The final render should give you a local copy of the book that you can browse and read.

### How to update the posted book

The posted book available as a GitHub Pages bundle is rendered and stored on the GitHub repo in an alternate branch called `gh-pages`. This process is (not yet) automated, but the shell script `update_book`, when run locally, will copy your current rendered `_book` contents and push those contents to github.

To make this script work, you have to first make a local directory called `book-output` via the following call in a Terminal shell at the top-level directory (you can do this inside RStudio's Terminal tab):

```         
git clone -b gh-pages \
  https://github.com/lmiratrix/MLM.git \
  book-output
```

This should make a copy of the repo's `gh-pages` branch as a new directory called `book-output`. You can then run the script `update_book.sh` by typing

```         
./update_book.sh
```
