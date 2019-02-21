unit RSSParser;

interface

uses
  System.Generics.Collections,
  Xml.OmniXmlDom,
  Xml.XmlDom,
  Xml.XmlDoc,
  Xml.XmlIntf,
  Xml.XmlUtil;

type
  TRSSItem = record
    Title: string;
    Link: string;
    Description: string;
    constructor Create(const ATitle, ALink, ADescription: string);
  end;

  TRSSParser = class
  strict protected
    function GetChild(const node: IDOMNode; const childName: string): string;
  public
    function ParseRSS(const rss: string; var items: TList<TRSSItem>): boolean;
  end;

implementation

uses
  System.SysUtils;

function TRSSParser.GetChild(const node: IDOMNode; const childName: string): string;
var
  childNode: IDOMNode;
begin
  childNode := SelectNode(node, childName + '\#text');
  if assigned(childNode) then
    Result := childNode.nodeValue
  else
    Result := '';
end;

function TRSSParser.ParseRSS(const rss: string; var items: TList<TRSSItem>): boolean;
var
  xmlDoc: IXMLDocument;
  i: Integer;
  channelNode: IDOMNode;
begin
   DefaultDOMVendor := 'Omni XML';

  // Parse the XML
  try
    xmlDoc := LoadXMLData(rss);
  except
    Exit(false);
  end;

  channelNode := SelectNode(xmlDoc.Node.DOMNode, 'rss\channel');
  if not assigned(channelNode) then
    Exit(false);

  for i := 0 to channelNode.childNodes.length - 1 do
    if SameText(channelNode.childNodes[i].nodeName, 'item') then
      items.Add(TRSSItem.Create(
                  GetChild(channelNode.childNodes[i], 'title'),
                  GetChild(channelNode.childNodes[i], 'link'),
                  GetChild(channelNode.childNodes[i], 'description')));

  Result := true;
end;

{ TRSSItem }

constructor TRSSItem.Create(const ATitle, ALink, ADescription: string);
begin
  Title := ATitle;
  Link := ALink;
  Description := ADescription;
end;

end.
