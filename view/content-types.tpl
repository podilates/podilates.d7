{{define "head" -}}
<title>Content Types</title>
{{- end}}

{{define "content"}}
<div class="container">

<table class="table auto">
<tbody>
{{range $k, $type := Drupal.ContentTypes -}}
<tr>
<td><a href="{{printf "/nodes/%s" $type.Type}}">{{$type.Name}}</a></td>
<td>{{$type.Description}}</td>
</tr>
{{end}}
</tbody>
</table>
</div>
{{end}}