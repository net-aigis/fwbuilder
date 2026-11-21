# Firewall Builder WebUI

Browser UI for existing Firewall Builder projects. Uses **libfwbuilder** via
the `fwbweb` bridge — not a reimplementation of compilers or the object model.

See [ARCHITECTURE.md](ARCHITECTURE.md), [STATUS.md](STATUS.md), [INSTALL.md](INSTALL.md).

## What works today

- Open / save `.fwb` (workspace copy + advisory lock)
- Object tree, typed attribute editor, search
- Policy / NAT / Routing grids: enable, action, add / delete / move
- Rule-cell object picker and drag-and-drop from the tree
- Compile through the same CLIs as the desktop GUI
- Deploy: BatchMode key/agent + password/KBI (Paramiko) + expect runtime
- Multi-user API tokens (`FWBWEB_API_USERS` / `FWBWEB_API_USERS_FILE`)
- Host-native bridge when `ldd` is clean; Fedora Podman fallback otherwise
- Platform/OS option groups from `src/res` + typed option editors

## Quick start

```bash
bash webui/scripts/run-stack.sh
# API http://127.0.0.1:8088   UI http://127.0.0.1:5173
# Bearer token default: dev-token
```

Build steps and openSUSE vs Fedora images: [INSTALL.md](INSTALL.md).

## Auth

```bash
export FWBWEB_API_USERS='alice:tok-a,bob:tok-b'
# or FWBWEB_API_USERS_FILE=/path/to/users.txt   # lines: name:token
```

`GET /api/v1/me` → `{ "auth": "ok", "user": "alice" }`.
