# fwbweb-api

FastAPI front for the `fwbweb` libfwbuilder bridge.

```bash
export FWBWEB_BRIDGE=/path/to/fwbweb
export FWBWEB_API_TOKEN=dev-token
pip install -e '.[dev]'
uvicorn fwbweb_api.main:app --port 8088
```
