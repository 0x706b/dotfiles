filepath=$1

local_prettier=$PWD/node_modules/.bin/prettier

if test -f $local_prettier; then
  $local_prettier --stdin-filepath $filepath | eslint_d --stdin --stdin-filename $filepath --fix-to-stdout
else
  prettier --stdin-filepath $filepath | eslint_d --stdin --stdin-filename $filepath --fix-to-stdout
fi
