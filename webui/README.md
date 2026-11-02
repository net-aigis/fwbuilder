# Firewall Builder WebUI

Browser UI for existing Firewall Builder projects. Uses **libfwbuilder** via
the `fwbweb` bridge — not a reimplementation of compilers or the object model.

See [ARCHITECTURE.md](ARCHITECTURE.md) and [STATUS.md](STATUS.md).

## Local workflow (no GitHub Actions)

openSUSE hosts often lack Fedora’s `libxml2.so.2`; build and run the bridge
inside Podman, then use the host wrapper.

```bash
# 1) Image + native fwbweb
podman build -t fwbuilder-linux-qt6 -f docker/Dockerfile.linux-qt6-fedora docker/
podman run --rm -v "$PWD":/src:Z -w /src -e JOBS=4 fwbuilder-linux-qt6 \
  bash docker/build-linux-qt6-fwbweb.sh

# 2) API E2E (open → tree → update → save)
bash webui/scripts/e2e-local.sh

# 3) Dev servers
export FWBWEB_BRIDGE="$(pwd)/webui/bin/fwbweb"
export FWBWEB_API_TOKEN="dev-token"
export FWBWEB_WORKSPACE="$(pwd)/webui/.workspace"
export FWBUILDER_RES_DIR="$(pwd)/webui/.res"

cd webui/backend && pip install -e '.[dev]'
uvicorn fwbweb_api.main:app --reload --port 8088

# other terminal
cd webui/frontend && npm install && npm run dev
```

In the UI, token `dev-token`, project path under the repo (e.g.
`…/webui/fixtures/sample-v24.fwb`).
