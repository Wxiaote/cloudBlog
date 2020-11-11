#!/bin/sh

if [[ $(git status -s) ]]
then
    echo "暂时无改变，请重新提交"
    exit 1;
fi

echo "删除旧的发布文件"
rm -rf public
mkdir public
rm -rf .git/worktrees/public/

echo "删除旧文件"
rm -rf public/*

echo "生成hugo静态页面"
hugo

echo "更新Master分支"
# cd public && git add --all && git commit -m " 通过(publish.sh)更新博客"
git add --all && git commit -m " 通过(publish.sh)更新博客"

echo "Push to origin"
git push origin master
