{{define "head"}}
{{F.Set . "id" (F.Id .nid)}}
{{F.Set . "node" (Drupal.Node .id)}}
<title>{{.node.Title}}</title>
{{end}}

{{define "content"}}
{{template "node-content.htm" .}}
{{end}}
