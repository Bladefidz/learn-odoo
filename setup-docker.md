# Setup odoo container

Official odoo image file can be found at [here](https://store.docker.com/images/odoo). 

- Run Postgres
```
docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres:9.4
```

- Run odoo:
    * Latest version:
    ```
    $ docker run -p 8069:8069 --name odoo --link db:db -t odoo
    ```
    * Sepcific version:
    ```
    $ docker run -p 8069:8069 --name odoo --link db:db -t odoo:9
    ```

- Start odoo instance
```
docker start -a odoo
```

- Stop odoo instance
```
docker stop -a odoo
```