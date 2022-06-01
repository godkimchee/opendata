# 머니게임

블로그 [공공데이터 OpenData](https://godkimchee.github.io/hanistory/)의 소스 페이지이다. 

## 사용법

```
# update metadata
ruby _getHiddenPostList.rb

# build posts form data
ruby _buildPosts.rb
```

## TEST

```
# Speed up
bundle exe jekyll serve --profile --incremental --verbose
bundle exe jekyll build --profile --incremental --verbose
```

```
# 1000개 페이지만 
bundle exe jekyll serve --profile --limit_posts 1000
```