# Clickhouse with Hasura v3.

## Pre requisites 
1. Hasura Cloud account
2. Hasura v3 CLI with logged into Hasura
3. VS Code extension (not mandatory)
4. a Clickhouse database. 


## Steps to connect to Hasura v3

1. Create a new Hasura v3 project 
    ```
    hasura3 init --dir .
    ```
2. Update the `clickhouse.connector.configuration.json` with your clickhouse db connection configuration. (if you use the same table structure, you can re-use the tables section and to create the table, use the table.sql file on clickhouse client)
3. deploy the connector to Hasura cloud (this will take some time)

```
hasura3 connector create clickhouse:v1 \
--github-repo-url https://github.com/hasura/ndc-clickhouse/tree/main \
--config-file ./clickhouse.connector.configuration.json
```
4. Once the deployment is done get the connector URL by running `hasura3 connector list`
5. Update the URL as data connector URL the `ch.hml`. 
6. run `hasura3 watch` or `hasura3 build create` to create builds on Hasura v3,
7. If everything works fine, you will see the console URL through which you can access the generated queries. 


## FAQ

1. How will I add different table? 
You can modify the table definition on `clickhouse.connector.configuration.json` to add your table for the connector to understand and define the access boundaries. alternatively you can also generate this by following the generator script mentioned [here](https://github.com/hasura/ndc-clickhouse/?tab=readme-ov-file#for-hasura-users)

Once the connector config is updated and deployed, its easy to track the tables on Hasura with VS Code extension. Just use `Ctrl/CMD + Shift + P` and type `Refresh datasource`, then select the datasource name. After which you can also do `Track All Tables/Commands` and create a build. 

## DX is in development
Some of the steps mentioned above may change, and the beta /GA product will have a smooth workflow to connect any datasources without spending more time on wiring.

## More Questions
Feel free to reach out to us on [Github](https://github.com/hasura/graphql-engine) or [Discord](https://discord.com/invite/hasura)