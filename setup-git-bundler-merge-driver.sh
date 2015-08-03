#!/usr/bin/env bash
# Usage: setup-git-bundler-merge-driver
# Help: Configures git to use a custom merge driver to resolve Gemfile.lock
# merge conflicts.

if [ ! -f Gemfile ]; then
  echo 'No `Gemfile` found! Aborting'
  exit 1
fi

if [[ -z "$(git config merge.bundler.name)" ]]; then
  git config merge.bundler.name \
    'Resolves Gemfile.lock merge conflicts by running `bundle install`'

  echo "Added driver name"
fi

if [[ -z "$(git config merge.bundler.driver)" ]]; then
  git config merge.bundler.driver \
    'echo Gemfile.lock merge conflict, running bundle install && bundle install --quiet'

  echo "Added driver command"
fi

if ! grep "Gemfile.lock merge=bundler" .gitattributes &> /dev/null; then
  echo "Gemfile.lock merge=bundler" >> .gitattributes
fi
