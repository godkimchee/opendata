require 'yaml'
require 'fileutils'

puts "# Prepare Target Directiory"
LOCATION = File.join("_posts", "generated")
FileUtils.rm_rf( LOCATION )
FileUtils.mkdir( LOCATION )

puts "# Read Data Source"
data_file = "data-go-kr.yml"
objs = YAML.load_file( File.join("_data-raw", data_file) )

formats = ["CSV", "HWP", "PDF", "XLSX", "XLS", "MP4", "SHP", "JPG", "ODT", "XML", "PNG", "TXT", "GDB", "ZIP", "DOCX", "HTML", "TTL", "JSON", "AVI", "GIF", "JPEG", "URL", "MP3", "PPTX", "RDF", "FBX", "TIF", "PPT"]

file_body = <<BODY

{% include _partials/post-body.md %}

BODY

counter = 0

puts "# Build Posts"
for obj in objs
    if obj["distribution"].map{ |x| formats.include?( x["encodingFormat"] ) }.reduce(:|)
        
        # layout
        obj["layout"] = "post"
        
        # id : jekyll에서 파일 이름을 'id'로 지정해 사용하고 있음
        obj["did"] = obj["id"]
        obj.delete("id")

        # title
        obj["title"] = obj["name"].split("_").uniq.join("｜")

        # tags
        # puts obj["keywords"].inspect
        obj["tags"] = obj["keywords"]? obj["keywords"].flatten.join(",").split(",") : []
    
        # puts obj["tags"].inspect
        data_formats = obj["distribution"].map{ |x| x["encodingFormat"] }
        obj["tags"] = obj["tags"].concat( data_formats )
        obj.delete("keywords")

        # categories
        obj["categories"] = obj["creator"]["name"]

        # make file
        file_name = [ obj["dateCreated"], obj["did"] ].join("-") + ".md"
        file_frontmatter = obj.to_yaml
        file_content = file_frontmatter + file_body
        f = File.open( File.join(LOCATION, file_name ), 'w', encoding: 'utf-8')
        f.write( file_frontmatter)
        f.write("\n---\n\n\n")
        f.write( file_body )
        f.close()
        counter += 1
    end
end

puts "# " + counter.to_s + " pages created"
puts "# End Build Task"
