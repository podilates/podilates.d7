{{define "head"}}
{{F.Set . "node" (Drupal.AliasNode (printf "content/%s" .path))}}
<title>{{.node.Title}}</title>
{{end}}

{{define "content"}}

<div class="container">
{{template "node-content.htm" .}}
{{end}}