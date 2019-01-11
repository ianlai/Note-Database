
# Create the migration files 

```migrate create -ext sql -dir . yoyo```

Then, it will generate two migration files with the current timestamp

--> ```1547167304.yoyo.up.sql```

--> ```1547167304.yoyo.down.sql```

# Manage the migration

## Database URL

### - Format

```
postgres://[account]:[password]@localhost:5432/[database_name]
```

### - Example

```
postgres://yoyo:pwd@localhost:5432/yoyo_dev
```

## Check current

```migrate --verbose -database 'postgres://yoyo:yoyo@localhost:5432/yoyo_dev?sslmode=disable' -path ./internal/data/config/migrations version```

## Version Up (all)

```migrate --verbose -database 'postgres://yoyo:yoyo@localhost:5432/yoyo_dev?sslmode=disable' -path ./internal/data/config/migrations up```

## Version Up (n patches)

```migrate --verbose -database 'postgres://yoyo:yoyo@localhost:5432/yoyo_dev?sslmode=disable' -path ./internal/data/config/migrations up 1```

## Version Down (all)

```migrate --verbose -database 'postgres://yoyo:yoyo@localhost:5432/yoyo_dev?sslmode=disable' -path ./internal/data/config/migrations down```

## Version Down (n patches)

```migrate --verbose -database 'postgres://yoyo:yoyo@localhost:5432/yoyo_dev?sslmode=disable' -path ./internal/data/config/migrations down 1```

## When database becomes dirty, fix it and jump to the expected version (timestamp)

```migrate --verbose -database 'postgres://yoyo:yoyo@localhost:5432/yoyo_dev?sslmode=disable' -path ./internal/data/config/migrations force 1547167304```