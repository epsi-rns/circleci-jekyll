git worktree add ../public gh-pages
cd ../public
git pull

touch ~/.nojekyll

# before running anything, please make a gh-pages branch first
# git checkout gh-pages

#git checkout gh-pages
#git pull origin gh-pages

find . -maxdepth 1 ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;
mv ~/source/_site/* .

git add -fA
git commit --allow-empty -m "[ci skip] $(git log master -1 --pretty=%B)"
git push origin gh-pages

echo "deployed successfully"
