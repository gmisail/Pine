import sys

file_arg = sys.argv[1]

def setup_parse(raw_file):
    final_parse = ""
    for line in raw_file:
        for char in line:
            if char != " ":
                final_parse += char
            final_parse + "\n"
    return final_parse

def parse(raw_code):
    polling_tag = False
    output_html = ""
    text = ""
    tags = []

    for char in raw_code:
        if polling_tag:
            if char == "{":
                output_html += "<"
                output_html += name
                output_html += ">"

                tags.append(name)

                name = ""

                continue
            else:
                name += char
        
        if char == "}":
            output_html += "</"
            output_html += tags.pop()
            output_html += ">"
        elif char == "@":
            polling_tag = True
            name = ""
        else:
            output_html += char

    return output_html
        

def open_file(file_name):
    raw_file = open(file_name, "r")
    raw_code = setup_parse(raw_file)
    output = parse(raw_code)
    print output


open_file(file_arg)
