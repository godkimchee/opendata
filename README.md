# 머니게임

블로그 [공공데이터 OpenData](https://godkimchee.github.io/hanistory/)의 소스 페이지이다. 

## 사용법

```
# update metadata
ruby _getHiddenPostList.rb

# build posts form data
ruby _buildPosts.rb
```

* git push 후 `main` branch에 올라감
* github actions를 통해 `ruby _buildPosts.rb` 코드가 실행됨
* github actions를 통해 jekyll build가 수행됨
* 최종 build 결과가 `gh-pages`에 저장됨

## TEST

```
# 100개 페이지만 
bundle exe jekyll serve --profile --limit_posts 100
```

```
# Speed up
bundle exe jekyll serve --profile --incremental --verbose
bundle exe jekyll build --profile --incremental --verbose
```

