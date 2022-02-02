{{define "head" -}}
<title>Ποδηλάτ-ισσ-ες</title>
{{- end}}

{{define "content"}}
<div class="container">

{{$nodes := (Drupal.FrontPageNodes)}}
{{$page := (F.Page (F.Int (F.First .R.URL.Query.page)) .PageSize (len $nodes))}}
{{$timeFormat := .DateTimeFormat}}
{{$summaryLength := .SummaryLength}}
<div></div>
<div>

{{$prev := "Προηγούμενη"}}
{{$next := "Επόμενη"}}
<span class="page-prev">{{if ($page.HasPrev)}}<a href="/front_page?page={{F.Add $page.Page -1}}">{{$prev}}</a>{{else}}{{$prev}}{{end}}</span>
Σελίδα {{F.Add $page.Page 1}}/{{$page.Pages}}
<span class="page-next">{{if ($page.HasNext)}}<a href="/front_page{{.type}}?page={{F.Add $page.Page 1}}">{{$next}}</a>{{else}}{{$next}}{{end}}</span>
</div>

{{range $k, $node := (F.NodeSlice $nodes $page.Start $page.End) -}}

<div class="date">{{F.FormatTime $node.Created $timeFormat}}</div>
<div class="title">
<a href="{{printf "/node/%d" $node.Id}}">{{$node.Title}}</a>
</div>
{{range $i, $b := $node.ValuesTextWithSummary "body" 1}}
<div class="summary">{{$b.SummaryHTML $summaryLength}}</div>
{{end}}
{{end}}
</div>
{{end}}