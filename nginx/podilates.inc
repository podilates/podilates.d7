location /static {
	root /var/opt/podview;
}

location /static/css {
	root /var/opt/podview;
    expires 600;
}

location /libs {
	root /share;
}

location /api/ {
	proxy_set_header Host $host;
	proxy_pass http://127.0.0.1:8080;
}

location /sites/default/files {
	root /var/opt/podilates;
}

location /system/files/kentriko {
	root /var/opt/podilates;
}

location / {
	proxy_set_header Host $host;
	proxy_pass http://127.0.0.1:8080;
}
