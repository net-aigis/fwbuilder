# Firewall Builder WebUI

Browser UI for existing Firewall Builder projects. Uses **libfwbuilder** via
the `fwbweb` bridge — not a reimplementation of compilers or the object model.

See [ARCHITECTURE.md](ARCHITECTURE.md) and [STATUS.md](STATUS.md).

## Quick start (after a normal FWB build)

```bash
# from repo root, with FWB already configured/built
make -C src/fwbweb

export FWBWEB_BRIDGE="$(pwd)/src/fwbweb/fwbweb"   # or .../release/fwbweb.exe
export FWBWEB_API_TOKEN="dev-token"
export FWBWEB_WORKSPACE="$(pwd)/webui/.workspace"

cd webui/backend && pip install -e '.[dev]'
uvicorn fwbweb_api.main:app --reload --port 8088

# other terminal
cd webui/frontend && npm ci && npm run dev
```

Open the Vite URL, set the API token to `dev-token`, open
`webui/fixtures/sample.fwb` (or a path the API host can read).
