package;

class Parser
{
    static var elementname = "";

    static var properties = [];
    static var propertyname = "";
    static var propertyvalue = "";

    static var rawcode = [];
    static var tags = [];

    static var propertypolling = false;
    static var namepolling = false;
    static var valuepolling = false;
    static var pollingelement = false;
    static var textpolling = true;

    public function new()
    {

    }

    /* 
        for (char in chars)
            {
                if (pollingelement)
                {
                    textpolling = false;

                    if (char == "(")
                    {
                        propertypolling = true;
                        namepolling = true;

                        tags.push(elementname);
                    }
                    else if (char == "{")
                    {
                        pollingelement = false;
                        tags.push(elementname);

                        addTag(elementname, properties);

                        elementname = "";

                        properties = [];

                        textpolling = true;
                    }
                    else if (!propertypolling)
                    {
                        elementname += char;
                    }
                }

                if (propertypolling)
                {
                    if (char == ")")
                    {
                        propertypolling = false;
                        namepolling = false;
                        valuepolling = false;
                    }

                    if (namepolling)
                    {
                        if (char != ":")
                        {
                            namepolling = false;
                            valuepolling = true;
                        }
                        else
                        {
                            propertyname += char;
                        }
                    }

                    if (valuepolling)
                    {
                        if (char == ",")
                        {
                            valuepolling = false;
                            namepolling = true;

                            properties.push(new Property(propertyname, propertyvalue));
                            propertyname = "";
                            propertyvalue = "";
                        }
                        else
                        {
                            propertyvalue += char;
                        }
                    }

                }

                if (char != " ")
                {
                    if (char == "@")
                    {
                        pollingelement = true;
                    }
                    else if (char == "}")
                    {
                        addClosingTag(tags.pop());
                    }
                }

                if (textpolling)
                {
                    if (char != "@" && char != "{" && char != "}")
                    {
                        file += char;
                    }
                }
            }
    */

    public static function parse(c : String)
    {
        if (pollingelement)
                {
                    textpolling = false;

                    if (c == "(")
                    {
                        propertypolling = true;
                        namepolling = true;

                        tags.push(elementname);
                    }
                    else if (c == "{")
                    {
                        pollingelement = false;
                        tags.push(elementname);

                        addTag(elementname, properties);

                        elementname = "";

                        properties = [];

                        textpolling = true;
                    }
                    else if (!propertypolling)
                    {
                        elementname += c;
                    }
                }

                if (propertypolling)
                {
                    if (c == ")")
                    {
                        propertypolling = false;
                        namepolling = false;
                        valuepolling = false;
                    }

                    if (namepolling)
                    {
                        if (c != ":")
                        {
                            namepolling = false;
                            valuepolling = true;
                        }
                        else
                        {
                            propertyname += c;
                        }
                    }

                    if (valuepolling)
                    {
                        if (c == ",")
                        {
                            valuepolling = false;
                            namepolling = true;

                            properties.push(new Property(propertyname, propertyvalue));
                            propertyname = "";
                            propertyvalue = "";
                        }
                        else
                        {
                            propertyvalue += c;
                        }
                    }

                }

                if (c != " ")
                {
                    if (c == "@")
                    {
                        pollingelement = true;
                    }
                    else if (c == "}")
                    {
                        addClosingTag(tags.pop());
                    }
                }

                if (textpolling)
                {
                    if (c != "@" && c != "{" && c != "}")
                    {
                        file += c;
                    }
                }
    }

    public static function element(c : String)
    {

    }
}