
https://www.udemy.com/course/nginx-crash-course/
https://ivogluhchev.medium.com/from-redis-to-keydb-with-nginx-as-load-balancer-and-net-core-8c0a5484b343

```python
user nobody; # a directive in the 'main' context

events { # configuration of connection processing
}

http { # Configuration specific to HTTP (OSI LEVEL 7: Applicaction) 

    server { # configuration of HTTP virtual server 1       
        
        location /one { # configuration for processing URIs starting with '/one'
        
        }

        location /two { # configuration for processing URIs starting with '/two'
        }
    }
    
    server { # configuration of HTTP virtual server 2
    }
}

stream { # Configuration specific to TCP/UDP (OSI LEVEL 4: Ports) FASTER !!!


    ###### Proxy level 4
    #https://docs.nginx.com/nginx/admin-guide/load-balancer/tcp-udp-load-balancer/
    server {
        listen 12345;
        proxy_pass backend.example.com:12346;
    }
    ##### End


    ##### Load balancer level 4 (Round Robin by default)
    server {
        listen 12345;
        proxy_pass my_load_balancer;
    }
    upstream my_load_balancer {
        server backend1.example.com:12345;
        server backend2.example.com:12345;
        server backend3.example.com:12346;
        # ...
    }
    #### End
}
```

