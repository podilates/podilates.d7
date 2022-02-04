{{define "head" -}}
<title>Πρόσφατα</title>
{{- end}}

{{define "content"}}
<div class="container">

{{$nodes := (Drupal.NodesForTypes "forum" "kentriko")}}
{{$page := (F.Page (F.Add (F.Int (F.First .R.URL.Query.page)) -1) .PageSize (len $nodes))}}
{{$timeFormat := .DateTimeFormat}}
<div></div>

<div class="pager">
{{$prev := "Προηγούμενη"}}
{{$next := "Επόμενη"}}
<span class="page-prev">{{if ($page.HasPrev)}}<a href="/new?page={{$page.Page}}">{{$prev}}</a>{{else}}{{$prev}}{{end}}</span>
Σελίδα {{F.Add $page.Page 1}}/{{$page.Pages}}
<span class="page-next">{{if ($page.HasNext)}}<a href="/new?page={{F.Add $page.Page 2}}">{{$next}}</a>{{else}}{{$next}}{{end}}</span>
</div>

<table class="table new">
<tbody>
<tr>
<th>Τύπος</th>
<th>Θέμα</th>
<th>Σχόλια</th>
<th>Δημοσιεύτηκε</th>
<th>Σχολιάστηκε</th>
</tr>

{{range $k, $node := (F.NodeSlice $nodes $page.Start $page.End) -}}
<tr>
<td>{{Drupal.ContentTypeLabel $node.Type}}</td>
<td>
<a href="{{printf "/node/%d" $node.Id}}">{{$node.Title}}</a>
</td>
<td>{{$cc := $node.CommentCount}}{{if $cc}}{{$cc}}{{end}}</td>
<td class="date">{{F.FormatTime $node.Created $timeFormat}}</td>
{{$c := $node.CommentSummary}}
<td>
{{if (gt $c.Count 0)}}
{{F.DaysOld $c.LastTime}} ημέρες πριν<br>από {{$c.LastAuthor}}
{{end}}
</td>
</tr>
{{end}}
</div>
{{end}}