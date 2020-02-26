# https://jtway.co/deploying-jekyll-to-github-pages-with-circleci-2-0-3eb69324bc6e

git config user.name "ci-build@example.domain"
git config user.email "ci-build"
touch ~/.nojekyll

# before running anything, please make a gh-pages branch first
# git checkout gh-pages

git checkout gh-pages
git pull origin gh-pages

find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;
mv _site/* .
rm -R _site/

git add -fA
git commit --allow-empty -m "[ci skip] $(git log master -1 --pretty=%B)"
git push origin gh-pages

echo "deployed successfully"
