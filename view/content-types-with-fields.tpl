{{define "head" -}}
<title>Content Types</title>
{{- end}}

{{define "content"}}
<div class="container">

{{range $k, $type := Drupal.ContentTypes -}}
<h3><a href="{{printf "/nodes/%s" $type.Type}}">{{$type.Name}}</a></h3>
<div class="description">{{$type.Description}}</div>
<table class="table auto">
<tbody>
<tr>
<th>Field Label</th>
<th>Internal Name</th>
<th>Type</th>
</tr>


{{range $k, $f := (Drupal.Fields $type.Type) -}}
<tr>
<td>{{$f.Label}}</td>
<td>{{$f.Name}}</td>
<td>{{$f.Type}}</td>
</tr>
{{end}}
</tbody>
</table>
{{end}}

</div>
{{end}}