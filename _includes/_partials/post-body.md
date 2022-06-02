## 개요

__{{ page.creator.name }}（{{ page.creator.contactPoint.contactType }}）__ 에서 공개한 데이터입니다. 

{{page.dateCreated}}에 만들어져 {{page.datePublished}}에 공개 되었고, 최근 {{page.dateModified}}에 수정되었습니다. 

## 내용

다음과 같은 데이터를 제공하고 있습니다. 

> {{ page.description }}

## 공개 데이터

공개된 데이터는 다음과 같습니다. 

{% for d in page.distribution %}
[ {{page.name}}.{{ d.encodingFormat | downcase }} ]({{ d.contentUrl }})

{% if d.encodingFormat == "MP4" %}
{% include _media/video.html src=d.contentUrl %}
{% endif %}

{% if d.encodingFormat == "OGG" %}
{% include _media/video.html src=d.contentUrl %}
{% endif %}

{% if d.encodingFormat == "MP3" %}
{% include _media/audio.html src=d.contentUrl %}
{% endif %}

{% if d.encodingFormat == "JPG" %}
{% include _media/image.html src=d.contentUrl alt=page.name %}
{% endif %}

{% if d.encodingFormat == "JPEG" %}
{% include _media/image.html src=d.contentUrl alt=page.name %}
{% endif %}

{% if d.encodingFormat == "PNG" %}
{% include _media/image.html src=d.contentUrl alt=page.name %}
{% endif %}

{% if d.encodingFormat == "GIF" %}
{% include _media/image.html src=d.contentUrl alt=page.name %}
{% endif %}

{% endfor %}



## 알림

위 내용은 [공공데이터포털](https://www.data.go.kr)에서 인용하였습니다. 더 자세한 정보와 데이터는 공공데이터 포털 [해당 페이지]( https://www.data.go.kr/data/{{page.did}}/fileData.do )에서 얻을 수 있습니다. 