package;

import sys.io.File;

using StringTools;

class Pine
{

    static var filelines : Array<String>;
    static var filename : String;
    static var filecontent : String;

    static var pardonindex = 0;
    static var pardonflag = false;

    static var file : String = "";

    public static function main(){
        filename = Sys.args()[0];

        Sys.println("(Pine) Loading file: " + filename);

        filecontent = File.getContent(filename);
        filelines = filecontent.split("\n");

        Sys.println("(Pine) Parsing...");

        //var output = Parser.parse();
        parse();

        Sys.println("(Pine) Creating file: output.html");
        File.saveContent("output.html", file);
        Sys.println("(Pine) Done.");
    }

    public static function addTag(tag : String, properties : String){
        if (properties == ""){
            file += "<" + tag + ">";
        }else{
            file += "<" + tag + " " + properties + ">";
        }
    }

    public static function addClosingTag(tag : String){
        file += "</" + tag + ">";
    }

    public static function parse(){
        var elementname = "";
        var properties = "";
        
        var tags = [];

        var propertypolling = false;
        var pollingelement = false;
        var textpolling = true;
        
        for (line in filelines){
            var l = line.trim();
            var chars = l.split("");
           
            for (char in chars){
                if (pollingelement && !pardonflag){
                    textpolling = false;

                    if (char == "("){
                        propertypolling = true;
                    }

                    if (!propertypolling){
                        if (char == "{"){
                            pollingelement = false;

                            tags.push(elementname);
                            addTag(elementname, properties);

                            textpolling = true;
                        

                            properties = "";
                            elementname = "";
                        }else{
                            elementname += char;
                        }
                    }else{
                        if(propertypolling){
                            if (char == ")"){
                                propertypolling = false;
                            }else{
                                if (char != "("){
                                    properties += char;
                                }
                            }
                        }
                    }
                }


                if (char != " "){
                    if (char == "@" && !pardonflag){
                        pollingelement = true;
                    }
                    else if (char == "}" && !pardonflag){
                        addClosingTag(tags.pop());
                    }
                    else if (char == "~"){
                        pardonindex += 1;

                        if(pardonindex == 3){
                            pardonflag = true;
                            pardonindex = 0;
                        }
                    }
                    else{
                        pardonindex = 0;
                    }
                }

                if(pardonflag){
                    if(char == "~"){
                        pardonindex += 1;
                        if(pardonindex == 3){
                            pardonflag = false;
                            pardonindex = 0;
                        }
                    }else{
                        file += char;
                    }
                }

                if (textpolling && !pardonflag){
                    if (char != "@" && char != "{" && char != "}" && char != "~"){
                        file += char;
                    }
                }
            }

        }
    }

}