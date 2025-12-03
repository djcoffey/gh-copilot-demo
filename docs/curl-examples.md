# API curl examples

Use these curl examples against a running API on `http://localhost:3000` (or set `API_HOST`).

Defaults

- API_HOST: http://localhost:3000

Examples

1) List albums

```bash
curl "${API_HOST:-http://localhost:3000}/albums"
```

2) Get album by id

```bash
curl "${API_HOST:-http://localhost:3000}/albums/1"
```

3) Create album (POST)

```bash
curl -sS -X POST "${API_HOST:-http://localhost:3000}/albums" \
  -H "Content-Type: application/json" \
  -d '{"id":0,"title":"New","artist":"You","price":9.99,"image_url":"https://example.com/1.png"}'
```

4) Update album (PUT)

```bash
curl -sS -X PUT "${API_HOST:-http://localhost:3000}/albums/1" \
  -H "Content-Type: application/json" \
  -d '{"id":1,"title":"Updated","artist":"You","price":11.99,"image_url":"https://example.com/1.png"}'
```

5) Delete album

```bash
curl -sS -X DELETE "${API_HOST:-http://localhost:3000}/albums/1"
```

Notes

- If your frontend or environment uses a different port, set `API_HOST` before running the commands, e.g.:

```bash
API_HOST="http://localhost:3000" curl "${API_HOST}/albums"
```
