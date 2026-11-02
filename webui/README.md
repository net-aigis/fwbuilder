# Firewall Builder WebUI

Browser UI for existing Firewall Builder projects. Uses **libfwbuilder** via
the `fwbweb` bridge — not a reimplementation of compilers or the object model.

See [ARCHITECTURE.md](ARCHITECTURE.md) and [STATUS.md](STATUS.md).

## What works today

- Open / save `.fwb` (workspace copy + advisory lock)
- Object tree, typed attribute editor, search
- Policy / NAT / Routing grids: enable, action, add / delete / move
- Rule-cell object picker and drag-and-drop from the tree
- Compile (`fwb_nft` / `fwb_ipt`) through the same CLIs as the desktop GUI
- Firewall platform/installer options + management address
- Deploy dry-run / real `scp`+`ssh` (simplified; not the full Qt installer)
- Platform/OS catalog and option groups from `src/res` (nft/ipt/pf/ipf/ipfw compilers)

## Local workflow (no GitHub Actions)

```bash
# 1) Image + native fwbweb (+ compilers)
podman build -t fwbuilder-linux-qt6 -f docker/Dockerfile.linux-qt6-fedora docker/
podman run --rm -v "$PWD":/src:Z -w /src -e JOBS=4 fwbuilder-linux-qt6 \
  bash docker/build-linux-qt6-fwbweb.sh

# 2) API E2Es
bash webui/scripts/e2e-local.sh
bash webui/scripts/e2e-phase2.sh
bash webui/scripts/e2e-phase3.sh
bash webui/scripts/e2e-phase4.sh
bash webui/scripts/e2e-phase5.sh

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

In the UI: token `dev-token`, project path under the repo (e.g.
`webui/fixtures/sample-v24.fwb`). Open firewall **nft-test** → Rules → Compile.
