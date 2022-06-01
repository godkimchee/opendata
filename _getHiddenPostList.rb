require 'net/http'
require 'json'
require "cgi"
require 'yaml'

def get_json( url )
    uri = URI( url )
    res = Net::HTTP.get( uri )
    return JSON.parse( res )
end

def get_params( baseUrl, initPageNo )
    url = baseUrl + initPageNo
    obj = get_json( url )
    puts "Total count of posts: " + obj["totalCount"]
    puts "Count per page: " + obj["countPerPage"]
    return { countPerPage: obj["countPerPage"], totalCount: obj["totalCount"] }
end

def get_postlist( listBaseUrl, postBaseUrl )
    initPageNo = 1
    par = get_params( listBaseUrl, initPageNo.to_s )
    maxPage = ( par[:totalCount].to_i / par[:countPerPage].to_i ).floor + 1
    rst = []
    for currentPageNo in initPageNo..maxPage
        puts currentPageNo
        currentListUrl = listBaseUrl + currentPageNo.to_s
        obj = get_json( currentListUrl )
        lst = obj["postList"].map{ |x| {"title" => CGI.unescape( x["title"] ), "url" => postBaseUrl + x["logNo"] } }
        rst = rst.concat( lst )
    end
    return rst 
end 

def main( )
    listBaseUrl = 'https://blog.naver.com/PostTitleListAsync.naver?blogId=khfamilylove&parentCategoryNo=13&countPerPage=30&currentPage='
    postBaseUrl = "https://blog.naver.com/PostView.naver?blogId=khfamilylove&logNo="
    postlist = get_postlist( listBaseUrl, postBaseUrl )
    puts postlist.length()
    File.open("_data/meta/postlist.yml", "w") do |f|
    # File.open("postlist.json", "w") do |f|
        # f.write(JSON.pretty_generate(postlist) )
        f.write( YAML.dump(postlist) )
    end
end

main()