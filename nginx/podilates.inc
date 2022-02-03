location /static {
	root /var/opt/podview;
}

location /libs {
	root /share;
}

location /api/ {
	proxy_set_header Host $host;
	proxy_pass http://127.0.0.1:8080;
}

location /app {
	proxy_set_header Host $host;
	proxy_pass http://127.0.0.1:8080;
}

location / {
	proxy_set_header Host $host;
	proxy_pass http://127.0.0.1:8080;
}
