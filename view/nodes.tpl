{{define "head" -}}
<title>Nodes</title>
{{- end}}

{{define "content"}}
<div class="container">

{{$nodes := (Drupal.Nodes .type)}}
{{$page := (F.Page (F.Int (F.First .R.URL.Query.page)) .PageSize (len $nodes))}}
{{$timeFormat := .DateTimeFormat}}
<div></div>
<div>
{{if ($page.HasPrev)}}<a href="/nodes/{{.type}}?page={{F.Add $page.Page -1}}">&lt;&lt;</a>{{else}}&lt;&lt;{{end}}
{{if ($page.HasNext)}}<a href="/nodes/{{.type}}?page={{F.Add $page.Page 1}}">&gt;&gt;</a>{{else}}&gt;&gt;{{end}}
Page  {{F.Add $page.Page 1}}/{{$page.Pages}}
, {{.PageSize}} items per page
, {{len $nodes}} items
</div>

<table class="table auto">
<tbody>
<tr>
<th>Created</td>
<th>Title</td>
</tr>
{{range $k, $node := (F.NodeSlice $nodes $page.Start $page.End) -}}
<tr>
<td>{{F.FormatTime $node.Created $timeFormat}}</td>
<td><a href="{{printf "/node/%d" $node.Id}}">{{$node.Title}}</a></td>
</tr>
{{end}}
</tbody>
</table>
</div>
{{end}}