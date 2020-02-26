git config user.name "ci-build@example.domain"
git config user.email "ci-build"
touch ~/.nojekyll

git checkout -b gh-pages
# git pull origin gh-pages

find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;
mv _site/* .
rm -R _site/

git add -fA
git commit --allow-empty -m "$(git log master -1 --pretty=%B)"
git push origin gh-pages

echo "deployed successfully"
